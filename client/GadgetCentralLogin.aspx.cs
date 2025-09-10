using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GadgetHub
{
    public partial class GadgetCentralLogin : System.Web.UI.Page
    {
        private const string HardcodedUsername = "central";
        private const string HardcodedPassword = "cen123";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (username == HardcodedUsername && password == HardcodedPassword)
            {
                // Login successful
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "Login successful!";

                Response.Redirect("GadgetCentralManager.aspx");
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Invalid username or password.";
            }
        }
    }
}