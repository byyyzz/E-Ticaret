<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="UyeOl.aspx.cs" Inherits="ShopProject.UyeOl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="style/jquery-3.5.1.slim.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">


        function successalert() {
            swal({
                title: "Hoşgeldiniz!",
                text: " İşleminiz Başarıyla Gerçekleştirildi.Şimdi lütfen giriş yapın.",
                icon: "success",
                button: "OK!",
            }).then(function () {
                window.location = "Giris.aspx";
            });
        }

        

    </script>
    <br />
    <br />
    <div class="giris" style="text-align: center">
        Üye olmak için aşağıdaki alanları doldurunuz.
        <br />
        <br />
        <asp:Label ID="lblAd" runat="server" Text="Ad:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ad" runat="server" CssClass="TextBox"></asp:TextBox>
        <br />
        <asp:Label ID="lblSoyad" runat="server" Text="Soyad:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;
        <asp:TextBox ID="soyad" runat="server" CssClass="TextBox"></asp:TextBox>
        <br />
        <asp:Label ID="lblAdres" runat="server" Text="Adres:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="adres" runat="server" CssClass="TextBox" ></asp:TextBox>
        <br />
        <asp:Label ID="lbltel" runat="server" Text="Telefon"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="telefon" runat="server" CssClass="TextBox"></asp:TextBox>
        <br />
        <asp:Label ID="lblMail" runat="server" Text="E-mail:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="email" runat="server" CssClass="TextBox"></asp:TextBox>

        <br />
        <asp:Label ID="lblSifre1" runat="server" Text="Şifre:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="Sifre1" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="lblSifre2" runat="server" Text="Şifre Tekrar:"></asp:Label>
        &nbsp;
&nbsp;<asp:TextBox ID="Sifre2" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox>
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="alert-danger" ErrorMessage="Both password should be same" ControlToCompare="sifre1" ControlToValidate="sifre2"></asp:CompareValidator>

        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" CssClass="alert-danger" ErrorMessage="Enter a valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" CssClass="alert-danger" ErrorMessage="Email is requried"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="btn3" Text="Üye Ol" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="Mesaj" runat="server" ForeColor="Red"></asp:Label>

    </div>

</asp:Content>
