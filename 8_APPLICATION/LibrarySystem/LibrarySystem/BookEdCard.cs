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
    public partial class BookEdCard : Form
    {
        public BookEdCard()
        {
            InitializeComponent();
        }

        private void addBookEd_Click(object sender, EventArgs e)
        {
            string bookId = "\'" + bookID.Text + "\'";
            string pubId = "\'" + publID.Text + "\'";
            string edn = "\'" + ednumb.Text + "\'";
            string am = "\'" + amount.Text + "\'";
            string doaE = "\'" + doa.Text + "\'";
            string dId = "\'" + depID.Text + "\'";

            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "INSERT INTO book_edition (book_id, publishing_id, edition_number, amount, date_of_arrival, department_id) VALUES (" + bookId + "," + pubId + "," + edn + "," + am + "," + doaE + "," + dId + ")";

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
