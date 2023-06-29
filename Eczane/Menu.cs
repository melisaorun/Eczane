using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Eczane
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            HastaBilgisi sec=new HastaBilgisi();
            sec.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            İlacBilgileri sec1= new İlacBilgileri();
            sec1.Show();
            this.Hide();

        }

       // private void button3_Click(object sender, EventArgs e)
        //    HastaTakip sec2 = new HastaTakip();
         //   sec2.Show();
        //    this.Hide();

       // }
    }
}
