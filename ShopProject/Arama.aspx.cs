using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopProject
{
    public partial class Arama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string aranak=Request.QueryString["aranan"];
            SqlDataSource1.SelectCommand = "select * from Urunler where urunAdi like '%" + aranak + "%'"; ;
            
        }
        protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var id = (e.CommandArgument.ToString());
            Response.Redirect("Detay.aspx?urun=" + id);
        }
    }
}