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
    public partial class UyeOl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.UI.ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {

                switch (IsUserAndEmailExists( Server.HtmlEncode(email.Text)))
                {
                    case 0:
                        AddUser();                      
                        break;
                    
                    case 1:
                        Mesaj.Text = "<p style = 'color:red'>Email Exists<p>";
                        break;
                    default:
                        Mesaj.Text = "<p style = 'color:red'>Something went wrong!! Please Try again later<p>";
                        break;
                }

            }
            else
            {
               
            }
        }
        protected void AddUser()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnString"].ToString();
            SqlConnection sqlConnect = new SqlConnection(connectionString);

            try
            {

                sqlConnect.Open();

                string SQLCommand = "Insert into Kullanici (adi,soyadi,telefon,email,sifre,adres) values(@adi,@soyadi,@telefon,@email,@sifre,@adres)";
                SqlCommand sqlcommand = new SqlCommand(SQLCommand, sqlConnect);

                sqlcommand.Parameters.AddWithValue("@adi", Server.HtmlEncode(ad.Text));
                sqlcommand.Parameters.AddWithValue("@soyadi", Server.HtmlEncode(soyad.Text));
                sqlcommand.Parameters.AddWithValue("@telefon", Server.HtmlEncode(telefon.Text));
                sqlcommand.Parameters.AddWithValue("@adres", Server.HtmlEncode(adres.Text));
                sqlcommand.Parameters.AddWithValue("@email", Server.HtmlEncode(email.Text));
                sqlcommand.Parameters.AddWithValue("@sifre", Server.HtmlEncode(Sifre1.Text));

                sqlcommand.ExecuteNonQuery();
                sqlConnect.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);

            }
            catch (Exception ex)
            {
                Mesaj.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
            }
            finally
            {
                sqlConnect.Close();
            }

        }


        protected int IsUserAndEmailExists(string email)
        {
            string stringconnection = ConfigurationManager.ConnectionStrings["MyConnString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(stringconnection);

            try
            {
                sqlconn.Open();

                string command_string = "ProcIsUserExist @EId";
                SqlCommand sqlcom = new SqlCommand(command_string, sqlconn);                
                sqlcom.Parameters.AddWithValue("@EId", email);                              
                int n = Convert.ToInt32(sqlcom.ExecuteScalar());
                sqlconn.Close();
                return n;
            }
            catch (Exception ex)
            {
                Mesaj.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
                return -5;
            }
            finally
            {
                sqlconn.Close();
            }
        }
    }
}