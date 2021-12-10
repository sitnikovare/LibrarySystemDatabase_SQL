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
    public partial class FindForm : Form
    {
        public FindForm()
        {
            InitializeComponent();
        }

        private void findBut_Click(object sender, EventArgs e)
        {
            string str = likeFilter.Text;
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT title, author_name, publishing_name, amount FROM book_edition INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id INNER JOIN book ON book_edition.book_id = book.book_id INNER JOIN author ON book.author_id = author.author_id WHERE book.title LIKE ";
            sqlExpression += str;
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                string table = "";

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    table = reader.GetName(0) + "\t" + reader.GetName(1) + reader.GetName(2) + "\t" + reader.GetName(3) + "\n";

                    while (reader.Read()) // построчно считываем данные
                    {
                        object title = reader.GetValue(0);
                        object aname = reader.GetValue(1);
                        object pname = reader.GetValue(2);
                        object amount = reader.GetValue(3);

                        table += title + "\t" + aname + "\t" + pname + "\t" + amount + "\n";
                    }
                }

                TableViewer.Text = table;
            }

        }
    }
}
