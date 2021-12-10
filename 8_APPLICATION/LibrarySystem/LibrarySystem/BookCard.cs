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
    public partial class BookCard : Form
    {
        public BookCard()
        {
            InitializeComponent();
        }

        private void AddBook_Click(object sender, EventArgs e)
        {
            string titleB = "\'" + title.Text + "\'";
            string authorB = "\'" + authorID.Text + "\'";
            string genreB = "\'" + genreID.Text + "\'";
            
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "INSERT INTO book (title, author_id, genre_id) VALUES (" + titleB + "," + authorB + "," + genreB + ")";

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
