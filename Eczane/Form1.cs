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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection("Server=.;Database=Eczane;Trusted_Connection=True;");

       
        private void button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            int? id = null;
            SqlCommand command = new SqlCommand("Select * from Kullanıcılar where username='" + txtGirisUserName.Text + "' and password='" + txtGirisPassword.Text + "'", conn);
            
            // int result = command.ExecuteNonQuery();
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    id = Convert.ToInt32(reader["id"]);
                }
            }

            conn.Close();
            if (id != null)
            {
                this.Hide();
                Menu mn = new Menu();
                mn.Show();
            }
        }

        private void btnKayit_Click(object sender, EventArgs e)
        {
            conn.Open();
            int? id = null;
            SqlCommand command = new SqlCommand("insert into Kullanıcılar (username,password,telefon,mail) values ('" + txtkayitKullanici.Text + "','" + txtKayitSifre.Text + "','" + txtKayitTel.Text + "','" + txtKayitMail.Text + "')", conn);
            var result = command.ExecuteReader();
            conn.Close();

            MessageBox.Show("Kayıt olundu");
            groupBox1.Visible = true;
            groupBox2.Visible = false; 
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
            groupBox2.Visible = true;
        }
    }
}
