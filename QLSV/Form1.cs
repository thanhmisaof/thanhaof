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
    public partial class frmLop_Load : Form
    {
        private string connStr = @"Server=DESKTOP-CT5EN2H;Database=QLSV;User ID=sa; Password=123";
        private SqlConnection conn;
        private SqlCommand comm;
        private DataSet ds;
        private DataTable dt;
        public frmLop_Load()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            LoadData();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            conn.Open();
            string sqlStr = "INSERT INTO LOP(malop,tenlop) VALUES (N'"+txtMaLop.Text+"',N'"+txtTenLop.Text+"')";
            comm = new SqlCommand(sqlStr, conn);
            comm.ExecuteNonQuery();
            conn.Close();
            LoadData();
        }
        private void LoadData()
        {
            conn = new SqlConnection(connStr);
            conn.Open();

            string sqlStr = "SELECT * FROM Lop";
            SqlDataAdapter myAdapter = new SqlDataAdapter(sqlStr, conn);

            ds = new DataSet();
            myAdapter.Fill(ds, "Lop");
            dt = ds.Tables["Lop"];

            dgvLop.AutoGenerateColumns = false;
            dgvLop.DataSource = dt;

            conn.Close(); 
        }

        private void dgvLop_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            txtMaLop.Text =dt.Rows[row]["malop"].ToString();
            txtTenLop.Text =dt.Rows[row]["tenlop"].ToString();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            conn.Open();
            string sqlStr = "UPDATE LOP SET TenLop=N'" + txtTenLop.Text + "' WHERE MaLop=N'" + txtMaLop.Text + "'";
            comm = new SqlCommand(sqlStr, conn);
            comm.ExecuteNonQuery();
            conn.Close();
            LoadData();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            DialogResult res = MessageBox.Show("Bạn có chắc chắn xóa ?", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (res==DialogResult.Yes)
            {
                conn = new SqlConnection(connStr);
                conn.Open();
                string sqlStr = "DELETE FROM Lop WHERE malop=N'" + txtMaLop.Text + "'";
                comm = new SqlCommand(sqlStr, conn);
                comm.ExecuteNonQuery();
                conn.Close();
                LoadData();
            }
        }
    }
}
