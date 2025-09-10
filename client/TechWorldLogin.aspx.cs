using System;
using System.Web.UI;

namespace GadgetHub.Client
{
    public partial class TechWorldLogin : Page
    {
        private const string HardcodedUsername = "techworld";
        private const string HardcodedPassword = "tech123";

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

                Response.Redirect("TechWorldManager.aspx");
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Invalid username or password.";
            }
        }
    }
}


