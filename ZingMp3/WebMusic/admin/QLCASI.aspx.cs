using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace WebMusic.admin
{
    public partial class QLCASI : System.Web.UI.Page
    {
        private string conStr = @"Server=DESKTOP-CT5EN2H;Database=QLMUSIC;User ID=sa; Password=123";
        private SqlConnection con;
        private SqlCommand comm;
        protected void Page_Load(object sender, EventArgs e)
        {
            string hanhdong = null;
            if (Session["DangNhap"] == null)
                Response.Redirect("~/DangNhap.aspx");
            if (Request.QueryString.HasKeys())
            {
                hanhdong = Request.QueryString["Casi"].ToString();
            }
            switch (hanhdong)
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

        protected void btn_xoa_casi_Click(object sender, EventArgs e)
        {
            string xoa = txt_xoa_casi.Text;
            string Deletequery = "DELETE FROM CASI WHERE MaCS='" + xoa + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(Deletequery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Xóa Thành Công')</script>");
            Response.Redirect("QLCASI.aspx?Casi=Xem");
        }

        protected void btn_tim_casi_Click(object sender, EventArgs e)
        {
            string tim = txt_matim_casi.Text;
            string searchquery = "SELECT * FROM  CASI Where MaCS='" + tim + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(searchquery, con);
            SqlDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                txt_tencasi.Text = dr["TenCS"].ToString();
            }
        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            string tim = txt_macasi.Text;
            string TenCS = txt_TenCS.Text;
            string insertquery = "INSERT INTO CASI(MaCS,TenCS) VALUES ('" + tim + "',N'" + TenCS + "')";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(insertquery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Thêm Thể Loại Thành Công')</script>");
            Response.Redirect("QLCASI.aspx?Casi=Xem");
        }

        
        protected void btn_Update_Click(object sender, EventArgs e)
        {
            string macs = txt_matim_casi.Text;
            string tencs = txt_tencasi.Text;
            
            string updatequery = "UPDATE CASI SET TenCS=N'" + tencs + "' WHERE MaCS ='" + macs + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(updatequery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Cập Nhật Thành Công')</script>");
            Response.Redirect("QLCASI.aspx?Casi=Xem");
        }
    }
}