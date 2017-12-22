using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace NaHradbachApp.AdminPage
{
    public partial class AdminTools : System.Web.UI.Page
    {
        protected void loadDropDown()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT Kategorie FROM Kategorie ORDER BY Kategorie"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);

                        kategorieDropDownList.DataSource = ds.Tables[0];
                        kategorieDropDownList.DataTextField = "Kategorie";
                        kategorieDropDownList.DataValueField = "Kategorie";
                        kategorieDropDownList.DataBind();

                        kategorieDropDownList2.DataSource = ds.Tables[0];
                        kategorieDropDownList2.DataTextField = "Kategorie";
                        kategorieDropDownList2.DataValueField = "Kategorie";
                        kategorieDropDownList2.DataBind();
                    }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                loggedInPanel.Visible = true;
                anonymousPanel.Visible = false;
            }
            else
            {
                loggedInPanel.Visible = false;
                anonymousPanel.Visible = true;
            }

            if (!Page.IsPostBack)
            {
                loadDropDown();
            }
        }

        protected void removeCategoryButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("delete Kategorie FROM Kategorie where Kategorie like @Kategorie"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@Kategorie", kategorieDropDownList.SelectedValue.ToString());
                    cmd.ExecuteNonQuery();
                    loadDropDown();
                }
            }
        }

        protected void addCategoryButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Kategorie (Kategorie) values(@Kategorie)", conn))
                {
                    cmd.Parameters.AddWithValue("@Kategorie", kategorieTextBox.Text);

                    cmd.ExecuteNonQuery();
                    loadDropDown();
                    kategorieTextBox.Text = null;
                }
            }
        }

        protected void addFoodButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Pokrmy (Kategorie,Hmotnost,Název,Popis,Cena) values (@Kategorie,@Hmotnost,@Název,@Popis,@Cena)", conn))
                {
                    cmd.Parameters.AddWithValue("@Kategorie", kategorieDropDownList2.SelectedValue);
                    cmd.Parameters.AddWithValue("@Hmotnost", weightTextBox.Text);
                    cmd.Parameters.AddWithValue("@Název", nameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Popis", descriptionTextBox.Text);
                    cmd.Parameters.AddWithValue("@Cena", priceTextBox.Text);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("AdminTools.aspx");
                }
            }
        }

        protected void addDailyFoodButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conString"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Poledni_menu (Datum,Hmotnost,Popis,Cena) values (@Datum,@Hmotnost,@Popis,@Cena)", conn))
                {
                    cmd.Parameters.AddWithValue("@Datum", dailyCalendar.SelectedDate);
                    cmd.Parameters.AddWithValue("@Hmotnost", dailyWeightTextBox.Text);
                    cmd.Parameters.AddWithValue("@Popis", dailyDescriptionTextBox.Text);
                    cmd.Parameters.AddWithValue("@Cena", dailyPriceTextBox.Text);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("AdminTools.aspx");
                }
            }
        }
    }
}