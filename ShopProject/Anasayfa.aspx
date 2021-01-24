<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="ShopProject.Anasayfa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheet2.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnString %>" SelectCommand="SELECT * FROM [Urunler]"></asp:SqlDataSource>

     <asp:Repeater runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Unnamed1_ItemCommand">
        <ItemTemplate>

            <ul id="gallery">

                <li>
                    <img src="<%# Eval("resim") %>" />
                    <span>
                        <h3><%#Eval("urunAdi")%></h3>
                        <h3><%# Eval("urunFiyat") %> ₺</h3>
                        <asp:Button ID="Button1" runat="server" Text="ürün detay için tıklayın" CommandName="Detay" CommandArgument='<%#  Eval("urunID") %>' />
                        <asp:ImageButton ID="sepetButon" runat="server" ImageUrl="~/appim/sepet2.jpg"  CommandName="SepetEkle" CommandArgument='<%#  Eval("urunID") %>' />
                    </span>
                </li>
            </ul>



        </ItemTemplate>
    </asp:Repeater>


</asp:Content>


