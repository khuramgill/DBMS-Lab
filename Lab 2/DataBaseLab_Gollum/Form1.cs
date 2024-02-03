using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataBaseLab_Gollum
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Insert into Table_1 values (@Name, @Reg, @Section)", con);
            cmd.Parameters.AddWithValue("@Name", (textBox1.Text));
            cmd.Parameters.AddWithValue("@Reg", textBox2.Text);
            cmd.Parameters.AddWithValue("@Section", textBox3.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Successfully saved");

        }

        private void button2_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select * from Table_1", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void button4_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("DELETE FROM Table_1 WHERE Name = @Name,AND Reg = @Reg,AND Section = @Sectio", con);
            cmd.Parameters.AddWithValue("@Name", (textBox1.Text));
            cmd.Parameters.AddWithValue("@Reg", textBox2.Text);
            cmd.Parameters.AddWithValue("@Section", textBox3.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Successfully Deleted");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("UPDATE Table_1 SET Name = @Name, Reg = @Reg, Section = @Section WHERE Reg = @Reg", con);
            cmd.Parameters.AddWithValue("@Name", (textBox1.Text));
            cmd.Parameters.AddWithValue("@Reg", textBox2.Text);
            cmd.Parameters.AddWithValue("@Section", textBox3.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Successfully Updated");
        }
    }
}
