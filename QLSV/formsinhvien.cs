using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QLSV
{
    public partial class formsinhvien : Form
    {
        private string connStr = @"Server=DESKTOP-CT5EN2H;Database=QLSV;User ID=sa; Password=123";
        private SqlConnection conn;
        private SqlCommand comm;
        private DataSet ds;
        private DataTable dt;
        public formsinhvien()
        {
            InitializeComponent();
        }
        private void LoadData()
        {
            conn = new SqlConnection(connStr);
            conn.Open();

            string sqlStr = "SELECT masv,hoten,lop,dtb,(CASE WHEN gioitinh='1' THEN N'Nam' ELSE N'Nữ' END) AS gioitinh,ngaysinh,ghichu FROM SinhVien2";
            SqlDataAdapter myAdapter = new SqlDataAdapter(sqlStr, conn);

            ds = new DataSet();
            myAdapter.Fill(ds, "SinhVien2");
            dt = ds.Tables["SinhVien2"];

            //dgvsv.AutoGenerateColumns = false;
            dgvsinhvien.DataSource = dt;

            conn.Close();
        }
        private void formsinhvien_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        private void btnthem_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            conn.Open();
            string sqlStr = "INSERT INTO SinhVien2(masv,hoten,lop,dtb,gioitinh,ngaysinh,ghichu) VALUES ( N'" + txtmasv.Text + "', N'" + txthoten.Text + "', N'" + txtlop.Text + "','" + txtdtb.Text + "', '" + (rbnnam.Checked ? 1 : 0).ToString() + "', '" + dtpngaysinh.Value.ToString("MM/dd/yyyy") + "', N'" + txtghichu.Text + "')";
            comm = new SqlCommand(sqlStr, conn);
            comm.ExecuteNonQuery();
            conn.Close();
            LoadData();
        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            conn.Open();
            string sqlStr = "UPDATE SinhVien2 SET hoten=N'" + txthoten.Text + "', lop=N'" + txtlop.Text + "',dtb = " + txtdtb.Text + ",gioitinh = " + (rbnnam.Checked ? 1 : 0).ToString() + ", ngaysinh='" + dtpngaysinh.Value.ToString("MM/dd/yyyy") + "',ghichu=N'" + txtghichu.Text + "'" +
                            " WHERE masv=N'" + txtmasv.Text + "'";
            comm = new SqlCommand(sqlStr, conn);
            comm.ExecuteNonQuery();
            conn.Close();
            LoadData();
        }


        private void btnxoa_Click(object sender, EventArgs e)
        {
            DialogResult res = MessageBox.Show("Bạn có chắc chắn xóa ?", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (res == DialogResult.Yes)
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                string sqlStr = "DELETE FROM SinhVien2 WHERE masv=N'" + txtmasv.Text + "'";
                comm = new SqlCommand(sqlStr, conn);
                comm.ExecuteNonQuery();
                conn.Close();
                LoadData();
            }
        }

        private void btnthoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void dgvsinhvien_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            txtmasv.Text = dt.Rows[row]["masv"].ToString();
            txthoten.Text = dt.Rows[row]["hoten"].ToString();
            txtlop.Text = dt.Rows[row]["lop"].ToString();
            txtdtb.Text = dt.Rows[row]["dtb"].ToString();
            txtghichu.Text = dt.Rows[row]["ghichu"].ToString();
            dtpngaysinh.Value = Convert.ToDateTime(dt.Rows[row]["ngaysinh"].ToString());
            if (dt.Rows[row]["gioitinh"].ToString() == "Nam")
                rbnnam.Checked = true;
            else
                rbnnu.Checked = true;
        }


    }
}