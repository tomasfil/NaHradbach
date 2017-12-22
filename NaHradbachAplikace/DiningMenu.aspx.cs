using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace NaHradbachApp
{
    public partial class DiningMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString))
            {
                conn.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT DISTINCT Kategorie FROM Kategorie ORDER BY Kategorie", conn))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        kategorieRepeater.DataSource = dt;
                        kategorieRepeater.DataBind();
                    }
                }
            }
        }

        protected void kategorieButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string kategorie = btn.CommandArgument;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString))
            {
                conn.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter("Select Název, Hmotnost, Popis, Cena FROM Pokrmy where Kategorie like '" + kategorie + "' order by Název", conn))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        foodGridView.DataSource = dt;
                        foodGridView.DataBind();
                    }
                }
            }
        }

        protected void KategorieRepeaterItemCreated(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT Kategorie FROM Kategorie ORDER BY Kategorie", conn);
            string result = cmd.ExecuteScalar().ToString();
            using (SqlDataAdapter sda = new SqlDataAdapter("Select Název, Hmotnost, Popis, Cena FROM Pokrmy where Kategorie like '" + result + "' order by Název", conn))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    foodGridView.DataSource = dt;
                    foodGridView.DataBind();
                }
            }
            conn.Close();
        }
    }
}