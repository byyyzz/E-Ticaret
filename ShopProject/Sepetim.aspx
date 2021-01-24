<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Sepetim.aspx.cs" Inherits="ShopProject.Sepetim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="urunDetayCard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnString %>"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Sepetinizdeki Ürünler" Font-Bold="True" Font-Size="XX-Large" ForeColor="#FF6600"></asp:Label>
    <br />
    <br />
    <asp:Label ID="SepetBos" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#FF6600"></asp:Label>
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Unnamed1_ItemCommand">
        <ItemTemplate>

            <div class="movie_card" id="bright">
                <div class="info_section">
                    <div class="movie_header">
                        <img class="locandina" src=" <%# Eval("resim") %>" />
                        <h1><%#  Eval("urunAdi") %></h1>

                        <span class="minutes">
                            <h3><%# Eval("urunFiyat") %> ₺</h3>
                        </span>
                    
                    </div>
                    <asp:Button ID="SepetSil" runat="server" CssClass="btn-light" Text="Sepetten Sil" CommandName="Sil" CommandArgument='<%#  Eval("urunID") %>' />

                    </span>
                </div>
            </div>
        </ItemTemplate>

    </asp:Repeater>
    <br />
    <asp:Label ID="TopFiyat" runat="server" Font-Bold="True" style="float: right" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;<asp:Label ID="ToplamFiyat" runat="server" Text="Toplam Fiyat:" style="float: right" Font-Bold="True" Font-Size="Larger"></asp:Label><br />
     <br />
    <asp:Button ID="Odeme" CssClass="btn3" runat="server"  style="float: right" Text="Siparişi Tamamla" OnClick="Odeme_Click"/>
    <br />
     <br />
     <br />

</asp:Content>

