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
    public partial class ReadDirs : Form
    {
        public ReadDirs()
        {
            InitializeComponent();
        }

        private void Author_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT * FROM author";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                string table = "";

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    table = reader.GetName(0) + "\t" + reader.GetName(1) + "\n";

                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);

                        table += id + "\t" + name + "\n";
                    }
                }

                TableViewer.Text = table;

                reader.Close();
            }
        }

        private void Genres_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT * FROM genre";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                string table = "";

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    table = reader.GetName(0) + "\t" + reader.GetName(1) + "\n";

                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);

                        table += id + "\t" + name + "\n";
                    }
                }

                TableViewer.Text = table;

                reader.Close();
            }
        }

        private void Publish_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT * FROM publishing";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                string table = "";

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    table = reader.GetName(0) + "\t" + reader.GetName(1) + "\n";

                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);

                        table += id + "\t" + name + "\n";
                    }
                }

                TableViewer.Text = table;

                reader.Close();
            }
        }

        private void Books_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT book.book_id, title, author_name, genre_name, edition_number, publishing_name, amount FROM book INNER JOIN book_edition ON book.book_id = book_edition.book_id INNER JOIN author ON book.author_id = author.author_id INNER JOIN genre ON genre.genre_id = book.genre_id INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                string table = "";

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    table = reader.GetName(0) + "\t" + reader.GetName(1) + "\t" + reader.GetName(2) + "\t" + reader.GetName(3) + "\t" + reader.GetName(4) + "\t" + reader.GetName(5) + "\t" + reader.GetName(6) + "\n";

                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object title = reader.GetValue(1);
                        object aname = reader.GetValue(2);
                        object gname = reader.GetValue(3);
                        object enumb = reader.GetValue(4);
                        object pname = reader.GetValue(5);
                        object am = reader.GetValue(6);

                        table += id + "\t" + title + "\t" + aname + "\t" + gname + "\t" + enumb + "\t" + title + "\t" + pname + "\t" + am + "\n";
                    }
                }

                TableViewer.Text = table;

                reader.Close();
            }
        }

        private void Readers_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT * FROM reader";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                string table = "";

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    table = reader.GetName(0) + "\t" + reader.GetName(1) + "\t" + reader.GetName(2) + "\t" + reader.GetName(3) + "\t" + reader.GetName(4) + "\t" + reader.GetName(5) + "\t" + reader.GetName(6) + "\n";

                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);
                        object phone = reader.GetValue(2);
                        object address = reader.GetValue(3);
                        object work = reader.GetValue(4);
                        object position = reader.GetValue(5);
                        object dob = reader.GetValue(6);

                        table += id + "\t" + name + "\t" + phone + "\t" + address + "\t" + work + "\t" + position + "\t" + dob + "\n";
                    }
                }

                TableViewer.Text = table;

                reader.Close();
            }
        }
    }
}
