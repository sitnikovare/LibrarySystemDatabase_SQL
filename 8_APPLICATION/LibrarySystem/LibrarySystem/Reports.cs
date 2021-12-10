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
    public partial class Reports : Form
    {
        public Reports()
        {
            InitializeComponent();
        }

        private void getPublishings(object sender, EventArgs e) {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT publishing_name FROM publishing";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();


                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    

                    while (reader.Read()) // построчно считываем данные
                    {
                        object name = reader.GetValue(0);

                        comboPublish.Items.Add(name);
                    }
                }


            }
        }

        private void getAuthor(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT author_name FROM author";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();


                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов

                    while (reader.Read()) // построчно считываем данные
                    {
                        object name = reader.GetValue(0);

                        comboAuthor.Items.Add(name);
                    }
                }


            }
        }

        private void getStatus(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "SELECT status_name FROM fine_status";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();


                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов

                    while (reader.Read()) // построчно считываем данные
                    {
                        object name = reader.GetValue(0);

                        comboStatus.Items.Add(name);
                    }
                }


            }
        }

        private void PublAmount_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "Count_Books_From_Publishing";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                // параметр для ввода имени
                SqlParameter nameParam = new SqlParameter
                {
                    ParameterName = "@Publish_name",
                    Value = comboPublish.Text
                };
                // добавляем параметр
                command.Parameters.Add(nameParam);

                // определяем первый выходной параметр
                SqlParameter amount = new SqlParameter
                {
                    ParameterName = "@amount",
                    SqlDbType = SqlDbType.Int // тип параметра
                };
                // указываем, что параметр будет выходным
                amount.Direction = ParameterDirection.Output;
                command.Parameters.Add(amount);

                command.ExecuteNonQuery();

                OutReport.Text = "Книг данного издательства в системе: " + command.Parameters["@amount"].Value;
            }
        }

        private void AuthorAm_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "Count_Books_By_Author";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                // параметр для ввода имени
                SqlParameter nameParam = new SqlParameter
                {
                    ParameterName = "@Author_name",
                    Value = comboAuthor.Text
                };
                // добавляем параметр
                command.Parameters.Add(nameParam);

                // определяем первый выходной параметр
                SqlParameter amount = new SqlParameter
                {
                    ParameterName = "@amount",
                    SqlDbType = SqlDbType.Int // тип параметра
                };
                // указываем, что параметр будет выходным
                amount.Direction = ParameterDirection.Output;
                command.Parameters.Add(amount);

                command.ExecuteNonQuery();

                OutReport.Text = "Книг данного автора в системе: " + command.Parameters["@amount"].Value;
            }
        }

        static void connection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            // this gets the print statements (maybe the error statements?)
            var outputFromStoredProcedure = e.Message;
        }

        private void ExprReader_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "Overdue_Issues_By_Reader";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                // параметр для ввода имени
                SqlParameter nameParam = new SqlParameter
                {
                    ParameterName = "@Reader_id",
                    Value = ReaderName.Text
                };
                // добавляем параметр
                command.Parameters.Add(nameParam);

                string printOutput = "Просроченные заказы данного читателя:\n";

                // handle this event to receive the print output
                connection.InfoMessage += (object obj, SqlInfoMessageEventArgs ee) => {
                    printOutput += ee.Message;
                };

                command.ExecuteNonQuery();

                OutReport.Text = printOutput;
            }
        }

        private void ExpOrders_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "Info_About_Expired_Fines";

            string d = dateTimePicker.Value.ToString("dd-MM-yyyy");
            string[] str0 = d.Split(new char[] { '-' });
            string str = String.Concat(str0[2], "-", str0[1], '-', str0[0]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                // параметр для ввода имени
                SqlParameter dateParam = new SqlParameter
                {
                    ParameterName = "@afterDate",
                    Value = str
                };
                // добавляем параметр
                command.Parameters.Add(dateParam);

                SqlParameter statusParam = new SqlParameter
                {
                    ParameterName = "@statusName",
                    Value = comboStatus.Text
                };
                // добавляем параметр
                command.Parameters.Add(statusParam);

                string printOutput = "ID заказов, подходящие под критерии:\n";

                // handle this event to receive the print output
                connection.InfoMessage += (object obj, SqlInfoMessageEventArgs ee) => {
                    printOutput += ee.Message;
                };

                command.ExecuteNonQuery();

                OutReport.Text = printOutput;
            }
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            dateTimePicker.CustomFormat = "dd-MM-yyyy";
            
        }

        private void comboPublish_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Reports_Load(object sender, EventArgs e)
        {
            getAuthor(sender, e);
            getPublishings(sender, e);
            getStatus(sender, e);
        }
    }
}
