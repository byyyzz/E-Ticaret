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
    public partial class Anasayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName =="Detay" )
            {
                var id = (e.CommandArgument.ToString());
                Response.Redirect("Detay.aspx?urun=" + id);
            }
            if (e.CommandName == "SepetEkle")
            {

                if (Session["kullanici"] == null)
                {
                    Response.Redirect("Giris.aspx");
                }
                else
                {
                    var urunid = (e.CommandArgument.ToString());
                    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnString"].ToString());
                    sqlconn.Open();
                    string komut = "exec SepeteEkleYeni " + Session["kullanici"].ToString() + "," + urunid;
                    SqlCommand newcom = new SqlCommand(komut, sqlconn);
                    newcom.ExecuteNonQuery();
                    Response.Redirect("Sepetim.aspx");
                }

            }

        }
    }
}