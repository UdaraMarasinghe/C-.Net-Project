using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using GadgetHub.Client.Models;

namespace GadgetHub.Client
{
    public partial class ElectroComManager : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadOrders();
            }
        }

        private async Task LoadOrders()
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44399/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.GetAsync("api/order");

                if (response.IsSuccessStatusCode)
                {
                    var orders = await response.Content.ReadAsAsync<List<OrderDisplay>>();
                    OrderRepeater.DataSource = orders;
                    OrderRepeater.DataBind();
                }
                else
                {
                    OrderRepeater.DataSource = null;
                    OrderRepeater.DataBind();
                }
            }
        }
    }
}
