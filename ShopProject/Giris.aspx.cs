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
    public partial class Giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
                {
                    Response.Redirect("Anasayfa.aspx");
                }
         

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {

                string connectionString = ConfigurationManager.ConnectionStrings["MyConnString"].ToString();
                SqlConnection sqlconn = new SqlConnection(connectionString);
                try
                {
                    sqlconn.Open();
                    string str = "Select count(*) from Kullanici where email = @uname AND sifre = @pass";
                    SqlCommand comm = new SqlCommand(str, sqlconn);
                    comm.Parameters.AddWithValue("@uname", Server.HtmlEncode(mail.Text));
                    comm.Parameters.AddWithValue("@pass", Server.HtmlEncode(sifre.Text));

                    int status = Convert.ToInt32(comm.ExecuteScalar());
                    if (status == 1)
                    {
                        string OnlineStatusStr = "update Kullanici set status = 1 where email = @uname";
                        SqlCommand comm1 = new SqlCommand(OnlineStatusStr, sqlconn);
                        comm1.Parameters.AddWithValue("@uname", Server.HtmlEncode(mail.Text));
                        comm1.ExecuteNonQuery();
                        string kid = "Select*from Kullanici where email='"+mail.Text+"' and sifre='"+sifre.Text+"'";
                        SqlCommand newcom = new SqlCommand(kid, sqlconn);
                        int ids = Convert.ToInt32(newcom.ExecuteScalar());
                        Session.Add("kullanici",ids);
                      
                        Response.Redirect("Anasayfa.aspx");
                    }
                    else
                    {
                        Mesaj.Text = "Giriş Başarısız. Email yada şifre hatalı.";
                    }
                }
                catch (Exception ex)
                {
                    Mesaj.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
                    
                }
                finally
                {
                    sqlconn.Close();
                }
            }
        }
    }
}