<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebMusic.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Đăng nhập vào website</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/fontawesome-free-5.10.2-web/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="Public/css/login.css" rel="stylesheet" type="text/css"/>
      <style type="text/css">
          .auto-style3 {
              margin-top: 1px;
          }
      </style>
      </head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
              
            </div>
        </header>
        <main>
            <div class="container">
            <div class="login-form">
                <form1 action="" method="post">
                    <h1>Đăng nhập vào website</h1>
                    <div class="input-box">
                       
                        <asp:TextBox ID="txtUser" runat="server" placeholder="Nhập username"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <i ></i>
                     
                         <asp:TextBox ID="txtPass" type="password" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
                    </div>
                    <div class="btn-box">
                        </div>
                     <div class="btn-box1">
                        <button type="submit" class="btn-box">
                           
                            <asp:Button ID="btn_DangNhap" runat="server" Text="Đăng nhập" BackColor="#009999" BorderStyle="None" Font-Bold="True" ForeColor="White" Height="20px" OnClick="btn_DangNhap_Click" Width="98px"/>
                        </button>
                        <button type="submit" class="btn-box">
                            
                            <asp:Button ID="btn_DangKi" runat="server" Text="Đăng kí" BackColor="#009999" BorderStyle="None" Font-Bold="True" ForeColor="White" Height="20px" OnClick="btn_DangKi_Click" Width="98px"/>
                       </button>
                         <br />
                    </div>
                       
                </form1>
            </div>
            </div>
        </main>
        <footer>
            <div class="container">
         
            </div>
        </footer>
    </form>
</body>
</html>
