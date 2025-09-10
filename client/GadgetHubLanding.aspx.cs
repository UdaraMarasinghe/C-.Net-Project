using GadgetHub.Client.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.UI;

namespace GadgetHub.Client
{
    public partial class GadgetHubLanding : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.RegisterAsyncTask(new PageAsyncTask(LoadProducts));
            }
        }

        private async Task LoadProducts()
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44399/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.GetAsync("api/Product");

                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();
                    var products = JsonConvert.DeserializeObject<List<Product>>(jsonString);

                    if (products != null && products.Count > 0)
                    {
                        if (products.Count > 0) litProduct1.Text = products[0].ProductName;
                        if (products.Count > 1) litProduct2.Text = products[1].ProductName;
                        if (products.Count > 2) litProduct3.Text = products[2].ProductName;
                        if (products.Count > 3) litProduct4.Text = products[3].ProductName;
                        if (products.Count > 4) litProduct5.Text = products[4].ProductName;
                        if (products.Count > 5) litProduct6.Text = products[5].ProductName;
                        if (products.Count > 6) litProduct7.Text = products[6].ProductName;
                        if (products.Count > 7) litProduct8.Text = products[7].ProductName;
                        if (products.Count > 8) litProduct9.Text = products[8].ProductName;
                        if (products.Count > 9) litProduct10.Text = products[9].ProductName;
                    }
                }
            }
        }
        protected async void AddToCart_Click(object sender, EventArgs e)
        {
            var button = (System.Web.UI.WebControls.Button)sender;

            // Get Product ID from CommandArgument
            int itemId = int.Parse(button.CommandArgument);

            // Dynamically build the TextBox ID
            string textboxId = $"txtQty{itemId}";

            // Use NamingContainer to find the TextBox in the same container
            var container = button.NamingContainer;
            var quantityBox = (System.Web.UI.WebControls.TextBox)container.FindControl(textboxId);

            if (quantityBox == null) return;

            int quantity = int.TryParse(quantityBox.Text, out int parsedQty) ? parsedQty : 0;

            if (quantity <= 0) return;

            var cartItem = new CartItem
            {
                ItemID = itemId,
                RequestedQuantity = quantity
            };

            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44399/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                var json = JsonConvert.SerializeObject(cartItem);
                var content = new StringContent(json, System.Text.Encoding.UTF8, "application/json");

                var response = await client.PostAsync("api/cart", content);

                string result = await response.Content.ReadAsStringAsync();

                if (!response.IsSuccessStatusCode)
                {
                    throw new Exception($"API call failed: {response.StatusCode}, {result}");
                }

            }
        }
    }
}
