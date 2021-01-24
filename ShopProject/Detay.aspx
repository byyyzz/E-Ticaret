<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Detay.aspx.cs" Inherits="ShopProject.Detay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="urunDetayCard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnString %>"></asp:SqlDataSource>
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Unnamed1_ItemCommand" >
    <ItemTemplate>

            
            <div class="movie_card" id="bright">
                <div class="info_section">
                    <div class="movie_header">
                        <img class="locandina" src=" <%# Eval("resim") %>" />
                        <h1><%#  Eval("urunAdi") %></h1>
                     
                        <span class="minutes"><%# Eval("urunFiyat") %> ₺</span>
                        <p class="type"><%# Eval("kategori") %></p>
                    </div>
                    <div class="movie_desc">
                        <p class="text">
                            <%# Eval("aciklama") %>
                        </p>
                       <asp:Button ID="SepetEkleButton" runat="server" Text="Sepete Ekle" CommandName="SepetEkle" CommandArgument='<%#  Eval("urunID") %>' CssClass="btn3" />
                    </div>




                </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
