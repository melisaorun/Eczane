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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Data.SqlClient;


namespace Eczane
{
    public partial class İlacBilgileri : Form
    {
        public İlacBilgileri()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection("Server=.;Database=Eczane;Trusted_Connection=True;");
        private void button5_Click(object sender, EventArgs e)
        {
            Menu sec = new Menu();
            sec.Show();
            this.Hide();
        }
        public void Listeleme()
        {

            SqlCommand komut = new SqlCommand();//sql komutu yazmamızı sağlayan class
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HListele1";
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Listeleme();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HYenile1";
            komut.Parameters.AddWithValue("İlacNo", textBox1.Tag);
            komut.Parameters.AddWithValue("İlacBarkod", textBox1.Text);
            komut.Parameters.AddWithValue("İlacinAdi", textBox2.Text);
            komut.Parameters.AddWithValue("KutuSayisi", textBox3.Text);   
            komut.Parameters.AddWithValue("Fiyati", textBox4.Text);
            komut.Parameters.AddWithValue("KullanimAmaci", textBox5.Text);
            komut.Parameters.AddWithValue("YanEtkileri", textBox6.Text);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HEkle1";
            komut.Parameters.AddWithValue("İlacBarkod", textBox1.Text);
            komut.Parameters.AddWithValue("İlacinAdi", textBox2.Text);
            komut.Parameters.AddWithValue("KutuSayisi", textBox3.Text);
            komut.Parameters.AddWithValue("Fiyati", textBox4.Text);
            komut.Parameters.AddWithValue("KullanimAmaci", textBox5.Text);
            komut.Parameters.AddWithValue("YanEtkileri", textBox6.Text);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HSil1";
            komut.Parameters.AddWithValue("İlacNo", textBox1.Tag);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["İlacNo"].Value.ToString();
            textBox1.Text = satir.Cells["İlacBarkod"].Value.ToString();
            textBox2.Text = satir.Cells["İlacinAdi"].Value.ToString();
            textBox3.Text = satir.Cells["KutuSayisi"].Value.ToString();
            textBox4.Text = satir.Cells["Fiyati"].Value.ToString();
            textBox5.Text = satir.Cells["KullanimAmaci"].Value.ToString();
            textBox6.Text = satir.Cells["YanEtkileri"].Value.ToString();
            
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();//sql komutu yazmamızı sağlayan class
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HAra1";
            komut.Parameters.AddWithValue("İlacBarkod", textBox7.Text);
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }
    }
    }

