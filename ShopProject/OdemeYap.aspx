<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="OdemeYap.aspx.cs" Inherits="ShopProject.OdemeYap" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="OdemeEkranı.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script src="style/jquery-3.5.1.slim.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">


        function successalert() {
            swal({
                title: "Siparişi Tamamladınız!",
                text: "Ödeme İşleminiz Başarıyla Gerçekleştirildi.!",
                icon: "success",
                button: "OK!",
            }).then(function () {
                window.location = "Sepetim.aspx";
            });
        }

        

    </script>

       <script src="style/jquery-3.5.1.slim.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="popover"]').popover();

            $('#cvc').on('click', function () {
                if ($('.cvc-preview-container').hasClass('hide')) {
                    $('.cvc-preview-container').removeClass('hide');
                } else {
                    $('.cvc-preview-container').addClass('hide');
                }
            });

            $('.cvc-preview-container').on('click', function () {
                $(this).addClass('hide');
            });
        });
    </script>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href="Deneme.css" rel="stylesheet" />

<div class="container">
  <div id="Checkout" class="inline">
      <h1>Ödeme Ekranı</h1>
      <div class="card-row">
          <span class="visa"></span>
          <span class="mastercard"></span>
          <span class="amex"></span>
          <span class="discover"></span>
      </div>
     
          <div class="form-group">
              <label for="PaymentAmount">Ödenecek Tutar</label>
              <div class="amount-placeholder">
                  <asp:Label ID="TopFiyat" runat="server" Text=""></asp:Label>
                  
              </div>
          </div>
          <div class="form-group">
              <label for="NameOnCard">Kart Üstündeki İsim</label>
              <input id="NameOnCard" class="form-control" type="text" maxlength="255"  required/>
          </div>
          <div class="form-group">
              <label for="CreditCardNumber">Kart Numarası</label>
              <input id="CreditCardNumber" class="null card-image form-control" type="text"  required />
          </div>
          <div class="expiry-date-group form-group">
              <label for="ExpiryDate">Son Kullanma Tarihi</label>
              <input id="ExpiryDate" class="form-control" type="text" placeholder="MM / YY" maxlength="7"  required/>
          </div>
          <div class="security-code-group form-group">
              <label for="SecurityCode">CVV</label>
              <div class="input-container" >
                  <input id="SecurityCode" class="form-control" type="text"  required/>
                  <i id="cvc" class="fa fa-question-circle"></i>
              </div>
              <div class="cvc-preview-container two-card hide">
                  <div class="amex-cvc-preview"></div>
                  <div class="visa-mc-dis-cvc-preview"></div>
              </div>
          </div>
          <div class="zip-code-group form-group">
              <label for="ZIPCode">Posta Kodu</label>
              <div class="input-container">
                  <input id="ZIPCode" class="form-control" type="text" maxlength="10" />
                  <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="Enter the ZIP/Postal code for your credit card billing address."><i class="fa fa-question-circle"></i></a>
              </div>
          </div>
          <asp:Button ID="Button1" runat="server" cssClass="btn3" Text="Öde" OnClick="Button1_Click" Width="434px" />
          <br />
          <br />
      
  </div>
</div>
</asp:Content>
