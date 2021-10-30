using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls ;


namespace WebMusic
{
   
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            tablist_baihat.Visible = false;
        }

        protected void btn_User_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("DangNhap.aspx");
        }
        protected void btn_tongquan_Click(object sender, EventArgs e)
        {
            tab_active1.Visible = true;
        }
        protected void btn_baihat_Click(object sender, EventArgs e)
        {
            tab_active1.Visible = false;
           
            tablist_baihat.Visible = true;
        }
        protected void btn_playlist_Click(object sender, EventArgs e)
        {
            //tablist_active2.Visible = false;
        }

        protected void btn_nghesi_Click(object sender, EventArgs e)
        {

        }

        protected void btn__Click(object sender, EventArgs e)
        {

        }

        protected void btn_ablum_Click(object sender, EventArgs e)
        {

        }

        protected void btn_mv_Click(object sender, EventArgs e)
        {

        }

        protected void btn_tailen_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Xoa_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Sua_Click(object sender, EventArgs e)
        {

        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {

        }

        protected void btnSua_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Exit_Click(object sender, ImageClickEventArgs e)
        {
            if (Session != null)
            {
                Session.Clear();
                Response.Redirect("~/Home.aspx");
            }

        }
    }
}