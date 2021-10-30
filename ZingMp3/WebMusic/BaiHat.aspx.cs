using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace WebMusic
{
    public partial class BaiHat : System.Web.UI.Page
    {
        private string conStr = @"Server=DESKTOP-CT5EN2H;Database=QLMUSIC;User ID=sa; Password=123";
        private SqlConnection con;
        private SqlCommand comm;
        private static string InnerHtml;

        protected void Page_Load(object sender, EventArgs e)
        {
            playnhac();

        }
        public void playnhac()
        {
            string M = null;
            if (Request.QueryString.HasKeys())
            {
                M = Request.QueryString["M"].ToString();
                string sql = "select * from BAIHAT where MaBH='" + M + "'";
                con = new SqlConnection(conStr);
                con.Open();
                comm = new SqlCommand(sql, con);
                SqlDataReader dr = comm.ExecuteReader();
                dr.Read();
                string tenBh = dr["URLBaiHat"].ToString();
                string songs = "Public/music" + tenBh;
                con.Close();
                BaiHat.InnerHtml = "<audio preload='auto' controls><source src='" + songs + "'></audio>	";

            }
        }
    }
}
