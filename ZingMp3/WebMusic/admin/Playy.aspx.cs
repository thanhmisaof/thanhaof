using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebMusic.admin
{
    public partial class Playy : System.Web.UI.Page
    {
        private string conStr = @"Server=DESKTOP-CT5EN2H;Database=QLMUSIC;User ID=sa; Password=123";
        private SqlConnection con;
        private SqlCommand comm;

        public static string InnerHtml { get; private set; }

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
                string sql = "select * from BAIHAT WHERE MaBH='" + M + "'";
                con = new SqlConnection(conStr);
                con.Open();
                comm = new SqlCommand(sql, con);
                SqlDataReader dr = comm.ExecuteReader();
                dr.Read();
                string tencakhuc = dr["TenBh"].ToString();
                string song_url = "Public/music/" + tencakhuc;
                con.Close();
                Playy.InnerHtml = "<audio preload='auto' controls><source src='" + song_url + "'></audio>	";
                Playy.InnerHtml += "<script src='Public/js/jquery.js'></script>";
                Playy.InnerHtml += "<script src='Public/js/audioplayer.js'></script>";
                Playy.InnerHtml += "<script>$(function () { $('audio').audioPlayer(); });</script>";
                
            }
        }

       
    }
}