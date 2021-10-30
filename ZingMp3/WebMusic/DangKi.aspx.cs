using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;


namespace WebMusic
{
    public partial class DangKi1 : System.Web.UI.Page
    {
        private string conStr = @"Server=DESKTOP-CT5EN2H;Database=QLMUSIC;User ID=sa; Password=123";
        private SqlConnection con;
        private SqlCommand comm;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_DangKi_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(conStr);
            string select = "SELECT TenDN from THANHVIEN where TenDN='" + txtUserName + "'";
            con.Open();
            comm = new SqlCommand(select, con);
            SqlDataReader datareader = comm.ExecuteReader();
            if (datareader.HasRows == false)
            {
                con.Close();
                string username = txtUserName.Text;
                string password = txtPassword.Text;
                string repassword = txtRepassword.Text;
                string ten = txtName.Text;
                string gioitinh = Drop_Gioitinh.SelectedValue.ToString();
                string email = txtEmail.Text;
                string maquyen = Drop_Maquyen.SelectedValue.ToString();
                String image = "Public/user_image/" + user_image.FileName;
                user_image.SaveAs(MapPath(image));
                if (password.Length >= 6)
                {
                    string insert = "INSERT INTO THANHVIEN (TenDN,HoTen,MatKhau,Email,Gioitinh,Maquyen,image) Values (N'" + username + "',N'" + ten + "'," + password + " ,'" + email + "' ,N'" + gioitinh + "',N'"+maquyen+"','"+image+"')";
                    con.Open();
                    comm = new SqlCommand(insert, con);
                    comm.ExecuteNonQuery();
                    con.Close();
                    Session.Add("DangKi", txtUserName.Text);
                    Response.Redirect("DangNhap.aspx");
                }
                else
                    Response.Write("<script>alert('Mật khẩu quá ngắn')</script>");
            }
            else
            {
                con.Close();
                Response.Write("<script>alert('Tài khoản đã tồn tại')</script>");
                txtUserName.Text = "";
            }

        }
        bool CheckFileType(string image)
        {
            string ext = Path.GetExtension(image);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }




    }


}