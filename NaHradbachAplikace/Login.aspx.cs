using System;

namespace NaHradbachApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            Response.Redirect("http://nahradbach.tofik.cloud/AdminPage/AdminTools.aspx");
        }
    }
}