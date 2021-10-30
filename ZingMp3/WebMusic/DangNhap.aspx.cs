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
    public partial class DangNhap : System.Web.UI.Page
    {
        private string conStr = @"Server=DESKTOP-CT5EN2H;Database=QLMUSIC;User ID=sa; Password=123";
        private SqlConnection con;
        private SqlCommand comm;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_DangKi_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dangki.aspx");
        }

        protected void btn_DangNhap_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text;
            string pass = txtPass.Text;
            string select = "SELECT * from THANHVIEN WHERE TenDN='" + user + "' AND MatKhau='" + pass + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(select, con);
            SqlDataReader dr = comm.ExecuteReader();
            dr.Read();
            if (dr.HasRows == false)
            {
                Response.Write("<script>alert('Tài khoản này không tồn tại. Bạn nên kiểm tra lại')</script>");
            }
            else
            {
                string quyen = null;
                quyen = dr["MaQuyen"].ToString();
                string maQ = "1";
                if (quyen != maQ)
                {
                    Session.Add("DangNhap", txtUser.Text);
                    Response.Redirect("admin/Home.aspx");
                }
                else
                {
                    Session.Add("DangNhap", txtUser.Text);
                    Response.Redirect("admin/QLMuSic.aspx");
                }
            }

            con.Close();
        }


    }
}