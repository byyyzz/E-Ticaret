using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopProject
{
    public partial class Sepetim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["kullanici"] == null)
            {
                Response.Redirect("Giris.aspx");
            }
            else
            {
                SqlDataSource1.SelectCommand = "exec SepetGoruntule " + Session["kullanici"].ToString();
                SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnString"].ToString());
                sqlconn.Open();

               
                string strkmt="exec SepetGoruntule "+ Session["kullanici"].ToString();
                SqlCommand nwcm = new SqlCommand(strkmt, sqlconn);
                int status1 = Convert.ToInt32(nwcm.ExecuteScalar());

                if (status1 == 0)
                {
                    SepetBos.Text=("Sepette ürün bulunmamaktadır.");

                }
                else
                {
                    string strkom = "exec ToplamFiyatGoruntule " + Session["kullanici"].ToString();
                    SqlCommand newcomm = new SqlCommand(strkom, sqlconn);
                    decimal status = Convert.ToDecimal(newcomm.ExecuteScalar());
                    newcomm.ExecuteNonQuery();
                    TopFiyat.Text = status + " ₺";
                    sqlconn.Close();

                }



            }


        }
        protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                string id = (e.CommandArgument.ToString());
                SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnString"].ToString());
                sqlconn.Open();
                string kullanici = Session["kullanici"].ToString();
                string str = "exec SepetUrunSil " + kullanici + "," + id;
                SqlCommand newcom = new SqlCommand(str, sqlconn);
                newcom.ExecuteNonQuery();
                sqlconn.Close();
                Response.Redirect("Sepetim.aspx");
            }
        }

        protected void Odeme_Click(object sender, EventArgs e)
        {
            Response.Redirect("OdemeYap.aspx");
        }
    }
}