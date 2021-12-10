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
    public partial class InputFromView : Form
    {
        public InputFromView()
        {
            InitializeComponent();
        }

        private void showTable(object sender, EventArgs e)
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

                showTableRich.Text = table;

                reader.Close();
            }
        }

        private void InputInTable_Click(object sender, EventArgs e)
        {
            string str = "\'" + InputAuthorName.Text + "\'";
            string connectionString = @"Data Source=ILLAPTOP\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True";
            string sqlExpression = "INSERT INTO View2_auhorD_CHECK (author_name) VALUES (" + str + ")";
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                try {
                    int number = command.ExecuteNonQuery();
                    showTable(sender, e);
                }
                catch (SqlException expr) {
                    showTableRich.Text = expr.Message;
                }
                
            }
        }

        private void InputFromView_Load(object sender, EventArgs e)
        {
            showTable(sender, e);
        }
    }
}
