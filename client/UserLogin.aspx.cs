using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GadgetHub
{
    public partial class UserLogin : System.Web.UI.Page
    {
        private const string HardcodedUsername = "gadgetuser";
        private const string HardcodedPassword = "gadget123";

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

                Response.Redirect("GadgetHubLanding.aspx");
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Invalid username or password.";
            }
        }
    }
}