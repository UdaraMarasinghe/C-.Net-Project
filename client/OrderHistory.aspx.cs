using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using GadgetHub.Client.Models;

namespace GadgetHub.Client
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadOrderHistory();
        }

        private void LoadOrderHistory()
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://localhost:44399/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = client.GetAsync("api/OrderHistory").Result;
            if (response.IsSuccessStatusCode)
            {
                var json = response.Content.ReadAsStringAsync().Result;
                var data = JsonConvert.DeserializeObject<List<OrderHistoryModel>>(json);
                rptOrderHistory.DataSource = data;
                rptOrderHistory.DataBind();
            }
        }
    }
}
