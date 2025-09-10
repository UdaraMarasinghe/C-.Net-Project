using GadgetHub.Client.Models;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.UI;

namespace GadgetHub.Client
{
    public partial class CartDisplay : Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadCartItems();
            }
        }

        private async Task LoadCartItems()
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44399/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                try
                {
                    HttpResponseMessage response = await client.GetAsync("api/cart");
                    if (response.IsSuccessStatusCode)
                    {
                        var carts = await response.Content.ReadAsAsync<List<CartItem>>();
                        CartRepeater.DataSource = carts;
                        CartRepeater.DataBind();
                    }
                    else
                    {
                        CartRepeater.DataSource = null;
                        CartRepeater.DataBind();
                        // Optionally show message: Cart is empty or error
                    }
                }
                catch (Exception ex)
                {
                    // Log or handle exceptions
                    CartRepeater.DataSource = null;
                    CartRepeater.DataBind();
                }
            }
        }

        protected async void btnCheckout_Click(object sender, EventArgs e)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44399/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                try
                {
                    HttpResponseMessage response = await client.PostAsync("api/order", null);

                    if (response.IsSuccessStatusCode)
                    {
                        await LoadCartItems(); // Refresh cart (should be empty now)
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Order placed successfully!');", true);

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your cart is empty!');", true);
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}
