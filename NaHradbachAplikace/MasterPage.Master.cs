using System;
using System.Web.UI;

namespace NaHradbachApp
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.facebook.com/PizzerieNaHradbach/?fref=ts");
        }

        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Response.Redirect("http://nahradbach.tofik.cloud/Home.aspx");
        }
    }
}