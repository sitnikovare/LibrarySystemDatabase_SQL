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
    public partial class AdminForm : Form
    {
        public AdminForm()
        {
            InitializeComponent();
        }

        private void DirEditor_Click(object sender, EventArgs e)
        {
            Form DirEditor = new DirEditorForm();
            DirEditor.Show();
            //this.Hide();
        }

        private void AdminForm_Load(object sender, EventArgs e)
        {
 
        }

        private void Reports_Click(object sender, EventArgs e)
        {
            Form repRead = new Reports();
            repRead.Show();
        }

        private void InputFromView_Click(object sender, EventArgs e)
        {
            Form viewInp = new InputFromView();
            viewInp.Show();
        }

        private void findFormBut_Click(object sender, EventArgs e)
        {
            Form find = new FindForm();
            find.Show();
        }

        private void dFormBut_Click(object sender, EventArgs e)
        {
            Form dform = new DifcForm();
            dform.Show();
        }
    }
}
