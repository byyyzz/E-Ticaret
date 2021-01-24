using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopProject
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AraButton_Click(object sender, EventArgs e)
        {
            string aranan = SearchText.Text;
            Response.Redirect("Arama.aspx?aranan=" + aranan);
        }

        protected void Cikis_Click1(object sender, EventArgs e)
        {
            SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnString"].ToString());
            sqlconn.Open();
            string OnlineStatusStr = "update Kullanici set status = 0 where kullaniciID = @user";

            SqlCommand comm1 = new SqlCommand(OnlineStatusStr, sqlconn);
            comm1.Parameters.AddWithValue("@user", Session["kullanici"]);

            comm1.ExecuteNonQuery();
            sqlconn.Close();
            Session.Remove("kullanici");
            Response.Redirect("Giris.aspx");
        }

        protected void Giris_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Giris.aspx");
        }

        protected void Sepetim_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sepetim.aspx");
        }
    }
}