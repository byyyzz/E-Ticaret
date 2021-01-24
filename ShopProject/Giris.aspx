<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="ShopProject.Giris" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="giris" style="text-align: center">
        &nbsp;<asp:Label ID="lblmail" runat="server" Font-Size="Large" Text="E-mail:"></asp:Label>
        &nbsp;<asp:TextBox ID="mail" runat="server" CssClass="TextBox"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mail" CssClass="alert-danger" ErrorMessage="Email is requried"></asp:RequiredFieldValidator>
        <br />

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mail" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />

        <asp:Label ID="lblsifre" runat="server" Font-Size="Large" Text="Şifre:"></asp:Label>
        &nbsp;&nbsp;&nbsp;
   
    <asp:TextBox ID="sifre" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox>
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" CssClass="btn3" Text="Giriş Yap" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:CheckBox ID="RememberMeCheckBox" runat="server" Text="Remember Me" CssClass="checkbox" />
        <br />
        
        <asp:Label ID="Mesaj" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <a href="UyeOl.aspx">Hesabınız yok mu? Kaydolmak için tıklayınız.</a>

    </div>
</asp:Content>
