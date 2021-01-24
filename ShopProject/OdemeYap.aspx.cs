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
    public partial class OdemeYap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] == null)
            {
                Response.Redirect("Giris.aspx");
            }
            else
            { 
               
                
                SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnString"].ToString());
                sqlconn.Open();

                string strkmt = "exec SepetGoruntule " + Session["kullanici"].ToString();
                SqlCommand nwcm = new SqlCommand(strkmt, sqlconn);
                int status1 = Convert.ToInt32(nwcm.ExecuteScalar());

                if (status1 == 0)
                {
                    Response.Redirect("Sepetim.aspx");
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

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnString"].ToString());
            sqlconn.Open();

            string strkomut = "exec OdemeYap " + Session["kullanici"].ToString();
            SqlCommand nnewcomm = new SqlCommand(strkomut, sqlconn);
            nnewcomm.ExecuteNonQuery();
            sqlconn.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
        }

    }
}