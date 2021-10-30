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
    public partial class QLMuSic : System.Web.UI.Page
    {
        private string conStr = @"Server=DESKTOP-CT5EN2H;Database=QLMUSIC;User ID=sa; Password=123";
        private SqlConnection con;
        private SqlCommand comm;
        protected void Page_Load(object sender, EventArgs e)
        {
            string act = null;
            if (Session["DangNhap"] == null)
                Response.Redirect("~/DangNhap.aspx");
            if (Request.QueryString.HasKeys())
            {
                act = Request.QueryString["MS"].ToString();
            }
            switch (act)
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


        protected void SqlMusic_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string Deletequery = "DELETE FROM BAIHAT WHERE maBH='" + txt_xoa.Text + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(Deletequery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Xóa Thành Công')</script>");
            Response.Redirect("QLMusic.aspx?Ms=Xem");
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            string updatequery = "UPDATE BAIHAT SET TenBH=N'" + txt_tenbaihat.Text + "',URLBaiHat='" + txt_linkurl.Text + "',MaCasi='" + txt_casi.Text + "',Matheloai='" + txt_matheloai.Text + "',Casi=N'" + txt_tencasi.Text + "',NoiDung=N'" + txt_noidung.Text + "',Image=N'" + FileUp_hinh.FileName + "' Where MaBH =" + txtTim.Text + "";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(updatequery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Redirect("QLMusic.aspx?Ms=Xem");
        }

        protected void btn_Them_Click(object sender, EventArgs e)
        {
            String filePath = "~/Public/image" + FileUp_image.FileName;
            FileUp_image.SaveAs(MapPath(filePath));
            string insertquery = "INSERT INTO BAIHAT(MaBH,TenBh,URLBaiHat,MaCaSi,Matheloai,Casi,NoiDung,Image) VALUES ('"+ txtMabh.Text + "',N'" + txtTenbh.Text + "','" + txtUrl.Text + "','" + txtMacasi.Text + "','" + txtTheloai.Text + "',N'" + txtCasi.Text + "',N'" + txtNoidung.Text + "','" + FileUp_image.FileName + "')";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(insertquery, con);
            comm.ExecuteNonQuery();
            con.Close();
            Response.Redirect("QLMusic.aspx?Ms=Xem");
        }

        protected void btn_Tim_Click(object sender, EventArgs e)
        {
            string tim = txtTim.Text;
            string searchquery = "SELECT * FROM  BAIHAT Where MaBH='" + tim + "'";
            con = new SqlConnection(conStr);
            con.Open();
            comm = new SqlCommand(searchquery, con);
            SqlDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                txt_tenbaihat.Text = dr["TenBH"].ToString();
                txt_linkurl.Text = dr["URLBaiHat"].ToString();
                
                txt_matheloai.Text = dr["Matheloai"].ToString();
                txt_tencasi.Text = dr["CaSi"].ToString();
                txt_noidung.Text = dr["NoiDung"].ToString();
                
            }
        }
       
    }
}