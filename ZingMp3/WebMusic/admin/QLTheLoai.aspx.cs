using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
namespace WebMusic.admin
{
    public partial class QLTheLoai : System.Web.UI.Page
    {
       
        private string conStr = @"Server=DESKTOP-CT5EN2H;Database=QLMUSIC;User ID=sa; Password=123";
        private SqlConnection con;
        private SqlCommand comm;
        protected void Page_Load(object sender, EventArgs e)
        {
            string hd = null;
            if (Session["DangNhap"] == null)
                Response.Redirect("~/DangNhap.aspx");
            if (Request.QueryString.HasKeys())
            {
                hd = Request.QueryString["Theloai"].ToString();
            }
            switch (hd)
            {
                case "Xem":
                    MultiView1.ActiveViewIndex = 0;
                    break;

                case "Sua":
                    MultiView1.ActiveViewIndex = 1;
                    break;

                case "Them":
                    MultiView1.ActiveViewIndex = 2;
                    break;

                default:
                    break;
            }

        }

        protected void btn_xoa_theloai_Click(object sender, EventArgs e)
        {
            string xoa = txt_xoa_theloai.Text;
            string Deletequery = "DELETE FROM THELOAI WHERE maTL='" + xoa+ "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(Deletequery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Xóa Thành Công')</script>");
            Response.Redirect("QLTheLoai.aspx?Theloai=Xem");
        }

        protected void btn_tim_theloai_Click(object sender, EventArgs e)
        {
            string tim = txt_matim_theloai.Text;
            string searchquery = "SELECT * FROM  THELOAI Where MaTL='" + tim + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(searchquery, con);
            SqlDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                txt_tentheloai.Text = dr["TenTL"].ToString();
                
            }
        }
        protected void btn_Update_theloai_Click1(object sender, EventArgs e)
        {
            string tentl = txt_tentheloai.Text;
            string matl = txt_matim_theloai.Text;
            string updatequery = "UPDATE THELOAI SET TenTL=N'" + tentl + "' WHERE MaTL ='" + matl + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(updatequery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Cập Nhật Thành Công')</script>");
            Response.Redirect("QLTheLoai.aspx?TheLoai=Xem");
           
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            string tim = txt_matheloai.Text;
            string TenTL = txt_TenTL.Text;
            string insertquery = "INSERT INTO THELOAI(MaTL,TenTL) VALUES ('" + tim + "',N'" + TenTL + "')";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(insertquery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Thêm Thể Loại Thành Công')</script>");
            Response.Redirect("QLTheLoai.aspx?TheLoai=Xem");
            
        }
    }
}