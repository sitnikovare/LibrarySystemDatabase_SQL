using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LibrarySystem
{
    public partial class Start : Form
    {
        bool asAdmin = false;

        public Start()
        {
            InitializeComponent();
        }

        private void Start_Load(object sender, EventArgs e)
        {

        }

        private void EnterAsAdmin_Click(object sender, EventArgs e)
        {
            asAdmin = true;
            Form Admin = new AdminForm();
            Admin.Show();
            //this.Hide();
        }

        private void EnterAsUser_Click(object sender, EventArgs e)
        {
            asAdmin = false;
            Form User = new UserForm();
            User.Show();
            //this.Hide();
        }
    }
}
