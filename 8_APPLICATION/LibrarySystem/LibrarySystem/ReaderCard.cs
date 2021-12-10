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

namespace LibrarySystem
{
    public partial class ReaderCard : Form
    {
        public ReaderCard()
        {
            InitializeComponent();
        }

        private void AddReader_Click(object sender, EventArgs e)
        {
            string nameR = "\'" + name.Text + "\'";
            string phoneR = "\'" + phone.Text + "\'";
            string addressR = "\'" + address.Text + "\'";
            string workR = "\'" + work.Text + "\'";
            string posR = "\'" + pos.Text + "\'";
            string birthR = "\'" + birth.Text + "\'";

            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "INSERT INTO reader (reader_name, reader_phone, reader_address, work, position, date_of_birth) VALUES (" + nameR + "," + phoneR + "," + addressR + "," + workR + "," + posR + "," + birthR + ")";
           
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                int number = command.ExecuteNonQuery();
            }

            this.Close();
        }
    }
}
