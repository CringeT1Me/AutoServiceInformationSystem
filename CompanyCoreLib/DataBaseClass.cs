using MySql.Data.MySqlClient;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;


namespace ServiceApp
{
    class DataBaseClass
    {
        private IDbConnection connection;
        private string connectionString;
        public DataBaseClass(string provider, string originPath)
        {
            switch (provider)
            {
                case "Microsoft Access":
                    connectionString = originPath;
                    connection = new OleDbConnection(connectionString);
                    connection.Open();
                    connection.Close();
                    break;
                case "MySQL Server":
                    connectionString = "server=C13625814;user=student;password=student123456;database='isip41_nekrasov_samodelkin';sslmode=none;charset=utf8mb4;";
                    connection = new MySqlConnection(connectionString);
                    connection.Open();
                    connection.Close();
                    break;
                case "Microsoft SQL Server":
                    connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=isip41_nekrasov_samodelkin;Integrated Security=True";
                    connection = new SqlConnection(connectionString);
                    connection.Open();
                    connection.Close();
                    break;
            }
        }


        public DataTable GetTable(string queryString = "Select * From Товары")
        {
            connection.Open();
            IDbCommand command = connection.CreateCommand();
            command.CommandText = queryString;
            DataTable dataTable = new DataTable();
            IDataReader dataReader = command.ExecuteReader();
            dataTable.Load(dataReader);
            connection.Close();
            return dataTable;
        }

        public string GetCell(string queryString)
        {
            return GetTable(queryString).Rows[0][0].ToString();
        }

        public void ExecuteComamnd(string queryString)
        {
            connection.Open();
            IDbCommand command = connection.CreateCommand();
            command.CommandText = queryString;
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}
