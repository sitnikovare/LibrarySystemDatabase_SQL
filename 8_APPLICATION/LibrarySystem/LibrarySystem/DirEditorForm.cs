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
    public partial class DirEditorForm : Form
    {
        public DirEditorForm()
        {
            InitializeComponent();
        }

        bool authorDir = false;
        bool genreDir = false;
        bool publishDir = false;
        bool bookDir = false;
        bool bookEdDir = false;
        bool readerhDir = false;

        private void showTable(object sender, EventArgs e) {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "";
            if (authorDir)
            {
                sqlExpression = "SELECT * FROM author";
            }
            if (genreDir)
            {
                sqlExpression = "SELECT * FROM genre";
            }
            if (publishDir)
            {
                sqlExpression = "SELECT * FROM publishing";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(sqlExpression, connection);
                    SqlDataReader reader = command.ExecuteReader();

                    string table = "";

                    if (reader.HasRows) // если есть данные
                    {
                        // выводим названия столбцов
                        table = reader.GetName(0) + "\t" + reader.GetName(1) + "\t" + reader.GetName(2) + "\n";

                        while (reader.Read()) // построчно считываем данные
                        {
                            object id = reader.GetValue(0);
                            object name = reader.GetValue(1);
                            object adr = reader.GetValue(2);

                            table += id + "\t" + name + "\t" + adr + "\t" +"\n";
                        }
                    }

                    TableViewer.Text = table;

                    reader.Close();
                }

                return;
            }
            if (bookDir)
            {
                sqlExpression = "SELECT * FROM book";

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
                            object id = reader.GetValue(0);
                            object name = reader.GetValue(1);
                            object auth = reader.GetValue(2);
                            object gen = reader.GetValue(3);

                            table += id + "\t" + name + "\t" + auth + "\t" + gen + "\n";
                        }
                    }

                    TableViewer.Text = table;

                    reader.Close();
                }

                return;
            }
            if (readerhDir)
            {
                sqlExpression = "SELECT * FROM reader";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(sqlExpression, connection);
                    SqlDataReader reader = command.ExecuteReader();

                    string table = "";

                    if (reader.HasRows) // если есть данные
                    {
                        // выводим названия столбцов
                        table = reader.GetName(0) + "\t" + reader.GetName(1) + reader.GetName(2) + "\t" + reader.GetName(3) + "\t" + reader.GetName(4) + "\t" + reader.GetName(5) + "\t" + reader.GetName(6) + "\n";

                        while (reader.Read()) // построчно считываем данные
                        {
                            object id = reader.GetValue(0);
                            object name = reader.GetValue(1);
                            object ph = reader.GetValue(2);
                            object add = reader.GetValue(3);
                            object work = reader.GetValue(4);
                            object pos = reader.GetValue(5);
                            object birth = reader.GetValue(6);

                            table += id + "\t" + name + "\t" + ph + "\t" + add + "\t" + work + "\t" + pos + "\t" + birth + "\n";
                        }
                    }

                    TableViewer.Text = table;

                    reader.Close();
                }

                return;
            }
            if (bookEdDir)
            {
                sqlExpression = "SELECT * FROM book_edition";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(sqlExpression, connection);
                    SqlDataReader reader = command.ExecuteReader();

                    string table = "";

                    if (reader.HasRows) // если есть данные
                    {
                        // выводим названия столбцов
                        table = reader.GetName(0) + "\t" + reader.GetName(1) + reader.GetName(2) + "\t" + reader.GetName(3) + "\t" + reader.GetName(4) + "\t" + reader.GetName(5) + "\t" + reader.GetName(6) + "\n";

                        while (reader.Read()) // построчно считываем данные
                        {
                            object id = reader.GetValue(0);
                            object bid = reader.GetValue(1);
                            object pid = reader.GetValue(2);
                            object en = reader.GetValue(3);
                            object am = reader.GetValue(4);
                            object doa = reader.GetValue(5);
                            object did = reader.GetValue(6);

                            table += id + "\t" + bid + "\t" + pid + "\t" + en + "\t" + am + "\t" + doa + "\t" + did + "\n";
                        }
                    }

                    TableViewer.Text = table;

                    reader.Close();
                }

                return;
            }

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

        private void DirEditorForm_Load(object sender, EventArgs e)
        {
            
        }

        private void AddToDir_Click(object sender, EventArgs e)
        {
            string str = "\'" + InputForDirEdit.Text + "\'";
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "";
            if (authorDir) {
                sqlExpression = "INSERT INTO author (author_name) VALUES (" + str + ")";
            }
            if (genreDir)
            {
                sqlExpression = "INSERT INTO genre (genre_name) VALUES (" + str + ")";
            }
            if (publishDir)
            {
                sqlExpression = "INSERT INTO publishing (publishing_name, address) VALUES (" + str + ")";
            }


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                try
                {
                    int number = command.ExecuteNonQuery();
                    showTable(sender, e);
                }
                catch (SqlException expr)
                {
                    TableViewer.Text = expr.Message;
                }
            }

            showTable(sender, e);
        }

        private void DeleteFromDir_Click(object sender, EventArgs e)
        {
            string str = InputForDirEdit.Text;
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "";
            if (authorDir)
            {
                sqlExpression = "DELETE FROM author WHERE author_name = " + "\'" + str + "\'";
            }
            if (genreDir)
            {
                sqlExpression = "DELETE FROM genre WHERE genre_name = " + "\'"+ str + "\'";
            }
            if (publishDir)
            {
                sqlExpression = "DELETE FROM publishing WHERE publishing_name = " + "\'" + str + "\'";
            }
            if (bookDir)
            {
                sqlExpression = "DELETE FROM book WHERE title = " + "\'" + str + "\'";
            }
            if (readerhDir)
            {
                sqlExpression = "DELETE FROM reader WHERE reader_name = " + "\'" + str + "\'";
            }
            if (bookEdDir)
            {
                sqlExpression = "DELETE FROM book_edtion WHERE book_edition_id = " + str;
            }


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                try
                {
                    int number = command.ExecuteNonQuery();
                    showTable(sender, e);
                }
                catch (SqlException expr)
                {
                    TableViewer.Text = expr.Message;
                }
            }

            showTable(sender, e);
        }

        private void Authors_Click(object sender, EventArgs e)
        {
            authorDir = true;
            genreDir = false;
            publishDir = false;
            bookDir = false;
            readerhDir = false;
            bookEdDir = false;
        }

        private void Genres_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = true;
            publishDir = false;
            bookDir = false;
            readerhDir = false;
            bookEdDir = false;
        }

        private void Publishings_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = true;
            bookDir = false;
            readerhDir = false;
            bookEdDir = false;
        }

        private void BookDir_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = false;
            bookDir = true;
            readerhDir = false;
            bookEdDir = false;

            Form book = new BookCard();
            book.Show();
        }

        private void ReaderDir_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = false;
            bookDir = false;
            readerhDir = true;
            bookEdDir = false;

            Form reader = new ReaderCard();
            reader.Show();

        }

        private void showReaders_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = false;
            bookDir = false;
            readerhDir = true;
            bookEdDir = false;

            showTable(sender, e);
        }

        private void showBookDir_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = false;
            bookDir = true;
            readerhDir = false;
            bookEdDir = false;

            showTable(sender, e);
        }

        private void BookEdDir_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = false;
            bookDir = true;
            readerhDir = false;
            bookEdDir = false;

            Form book = new BookEdCard();
            book.Show();
        }

        private void showEditDir_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = false;
            bookDir = false;
            readerhDir = false;
            bookEdDir = true;

            showTable(sender, e);
        }

        private void shAuth_Click(object sender, EventArgs e)
        {
            authorDir = true;
            genreDir = false;
            publishDir = false;
            bookDir = false;
            readerhDir = false;
            bookEdDir = false;

            showTable(sender, e);
        }

        private void shGen_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = true;
            publishDir = false;
            bookDir = false;
            readerhDir = false;
            bookEdDir = false;

            showTable(sender, e);
        }

        private void shPubl_Click(object sender, EventArgs e)
        {
            authorDir = false;
            genreDir = false;
            publishDir = true;
            bookDir = false;
            readerhDir = false;
            bookEdDir = false;

            showTable(sender, e);
        }
    }
}
