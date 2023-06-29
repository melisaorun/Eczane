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
using System.Data.SqlClient;

namespace Eczane
{
    public partial class HastaBilgisi : Form
    {
        public HastaBilgisi()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection("Server=.;Database=Eczane;Trusted_Connection=True;");

        private void button5_Click(object sender, EventArgs e)
        {
            Menu sec=new Menu();
            sec.Show();
            this.Hide();
        }
        public void Listeleme()
        {

            SqlCommand komut = new SqlCommand();//sql komutu yazmamızı sağlayan class
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HListele";
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
            komut.CommandText = "HYenile";
            komut.Parameters.AddWithValue("HastaBilgiNo", textBox1.Tag);
            komut.Parameters.AddWithValue("KimlikBilgisi", textBox1.Text);
            komut.Parameters.AddWithValue("AdiSoyadi", textBox2.Text);
            komut.Parameters.AddWithValue("SosyalGuvencesi", textBox3.Text);
            komut.Parameters.AddWithValue("Adres", textBox4.Text);
            komut.Parameters.AddWithValue("Telefon", textBox5.Text);
            komut.Parameters.AddWithValue("İlacBarkod", textBox6.Text);
            komut.Parameters.AddWithValue("İlacKullanim", textBox7.Text);
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
            komut.CommandText = "HEkle";
            komut.Parameters.AddWithValue("KimlikBilgisi", textBox1.Text);
            komut.Parameters.AddWithValue("AdiSoyadi", textBox2.Text);
            komut.Parameters.AddWithValue("SosyalGuvencesi", textBox3.Text);
            komut.Parameters.AddWithValue("Adres", textBox4.Text);
            komut.Parameters.AddWithValue("Telefon", textBox5.Text);
            komut.Parameters.AddWithValue("İlacBarkod", textBox6.Text);
            komut.Parameters.AddWithValue("İlacKullanim", textBox7.Text);
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
            komut.CommandText = "HSil";
            komut.Parameters.AddWithValue("HastaBilgiNo", textBox1.Tag);
            komut.ExecuteNonQuery();
            conn.Close();
            Listeleme();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["HastaBilgiNo"].Value.ToString();
            textBox1.Text = satir.Cells["KimlikBilgisi"].Value.ToString();
            textBox2.Text = satir.Cells["AdiSoyadi"].Value.ToString();
            textBox3.Text=satir.Cells["SosyalGuvencesi"].Value.ToString();
            textBox4.Text = satir.Cells["Adres"].Value.ToString();
            textBox5.Text = satir.Cells["Telefon"].Value.ToString();
            textBox6.Text = satir.Cells["İlacBarkod"].Value.ToString();
            textBox7.Text = satir.Cells["İlacKullanim"].Value.ToString();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();//sql komutu yazmamızı sağlayan class
            komut.Connection = conn;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HAra";
            komut.Parameters.AddWithValue("KimlikBilgisi", textBox8.Text);
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }
    }
}
