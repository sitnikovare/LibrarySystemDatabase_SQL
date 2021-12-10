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
    public partial class DifcForm : Form
    {
        public DifcForm()
        {
            InitializeComponent();
        }

        private void findRows_Click(object sender, EventArgs e)
        {
            string readerID = readerid.Text;

            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT "
                                   + "issued_book.issued_book_id, book_edition_id, amount, date_of_issue, expired_book_id, fine.fine_id, date_of_fine, summ, status_name "
                                   + "FROM issued_book "
                                   + "INNER JOIN expired_book ON issued_book.issued_book_id = expired_book.issued_book_id "
                                   + "INNER JOIN fine ON expired_book.fine_id = fine.fine_id "
                                   + "INNER JOIN fine_status ON fine.status_id = fine_status.status_id "
                                   + "WHERE issued_book.reader_id = " + readerID;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                string table = "";

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    table = reader.GetName(0) + "\t" + reader.GetName(1) + reader.GetName(2) + "\t" + reader.GetName(3) 
                        + "\t" + reader.GetName(4) + "\t" + reader.GetName(5) + "\t" + reader.GetName(6) 
                        + "\t" + reader.GetName(7) + "\t" + reader.GetName(8) + "\n";

                    while (reader.Read()) // построчно считываем данные
                    {
                        object iid = reader.GetValue(0);
                        object bei = reader.GetValue(1);
                        object am = reader.GetValue(2);
                        object doi = reader.GetValue(3);
                        object exbi = reader.GetValue(4);
                        object fi = reader.GetValue(5);
                        object dof = reader.GetValue(6);
                        object sm = reader.GetValue(7);
                        object sn = reader.GetValue(8);

                        table += iid + "\t" + bei + "\t" + am + "\t" + doi + "\t" + exbi + "\t" + fi + "\t" + dof + "\t" + sm + "\t" + sn + "\n";
                    }
                }

                outResult.Text = table;

                reader.Close();
            }
        }

        private void DifcForm_Load(object sender, EventArgs e)
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

                readers.Text = table;

                reader.Close();
            }
        }
    }
}
