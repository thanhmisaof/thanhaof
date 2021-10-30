<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKi.aspx.cs" Inherits="WebMusic.DangKi1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="Public/Public1/fonts/icomoon/style.css">

    <link rel="stylesheet" href="Public/Public1/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="Public/Public1/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="<Public/Public1/css/style.css">

    <title>Sign Up #8</title>
</head>
<body>
    <form id="form" runat="server">
        <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6 order-md-2">
          <img src="Public/Public1/images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>Đăng kí</h3>
              <p class="mb-4">Điền thông tin ở bảng bên dưới </p>
            </div>
            <form1 action="#" method="post">
              <div class="form-group first">
                <label for="name">Họ Tên</label>
                
                  <asp:TextBox ID="txtName"  class="form-control" runat="server" placeholder="Nhập họ tên"></asp:TextBox>
              </div>
              <div class="form-group">
                <label for="lblEmail">Email</label>
              
                  <asp:TextBox ID="txtEmail"  class="form-control" runat="server" placeholder="Nhập Email"></asp:TextBox>
              </div>

                <div class="form-group">
                <label for="lblUserName">Tên đăng nhập</label>
                
                
                  <asp:TextBox ID="txtUserName" class="form-control" runat="server" placeholder="Nhập tên đăng nhập"></asp:TextBox>
              </div>

              <div class="form-group">
                <label for="lblPassword">Mật khẩu</label>
                
                
                  <asp:TextBox ID="txtPassword" type="password" class="form-control" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
              </div>
              <div class="form-group last mb-4">
                <label for="lblRepassword">Nhập lại mật khẩu</label>
               
                
                  <asp:TextBox ID="txtRepassword" type="password" class="form-control" runat="server" placeholder="Nhập lại mật khẩu"></asp:TextBox>
              </div>

                <div class="form-group last mb-4">
                <label for="ddlGender">Giới tính</label>
                <asp:DropDownList ID="Drop_Gioitinh" runat="server">
                    <asp:ListItem>Nam</asp:ListItem>
                    <asp:ListItem>Nữ</asp:ListItem>
                </asp:DropDownList>
              </div>

                <div class="form-group last mb-4">
                <label for="ddlMaquyen">Admin</label>
                <asp:DropDownList ID="Drop_Maquyen" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>0</asp:ListItem>
                </asp:DropDownList>
              </div>

                <div class="form-group last mb-4">
                <label for="userImage">Hình đại diện</label>
               <asp:FileUpload ID="user_image" runat="server" />
                                                 </div>
                                         
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Đồng ý với các điều khoản <a href="#">Quy định</a> và <a href="#">Bảo mật</a></span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control_indicator">
                      </div>
                </label>
                  
              </div>
                
              
                             
                <asp:Button ID="btn_DangKi" class="btn text-white btn-block btn-primary" runat="server" Text="Đăng kí" OnClick="btn_DangKi_Click"/>
              <span class="d-block text-left my-4 text-muted"> Hoặc đăng nhập bằng</span>
               <div class="social-login">
                <a href="#" class="facebook">
                  <span class="icon-facebook mr-3"></span> 
                </a>
                <a href="#" class="twitter">
                  <span class="icon-twitter mr-3"></span> 
                </a>
                <a href="#" class="google">
                  <span class="icon-google mr-3"></span> 
                </a>
              </div>
            </form1>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="Public/Public1js/jquery-3.3.1.min.js"></script>
    <script src="Public/Public1js/popper.min.js"></script>
    <script src="Public/Public1js/bootstrap.min.js"></script>
    <script src="Public/Public1js/main.js"></script>
        </form>
</body>
</html>
