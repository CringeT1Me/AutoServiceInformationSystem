using ServiceApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompanyCoreLib
{
    public class DeletingProducts
    {
        DataBaseClass dbc;
        public DeletingProducts()
        {
            dbc = new DataBaseClass("Microsoft Access", "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=G:\\AutoService\\CompanyCoreLib\\DataBases\\TestDataBase.mdb");
            string insertQuery = "INSERT INTO Products(ДополнительныеТовары) Values(\"3;5\");";

            dbc.ExecuteComamnd(insertQuery);
            insertQuery = "INSERT INTO Products(ДополнительныеТовары) Values(\"\");";
            dbc.ExecuteComamnd(insertQuery);

            insertQuery = "INSERT INTO Products(ДополнительныеТовары) Values(\"4\");";
            dbc.ExecuteComamnd(insertQuery);

            insertQuery = "INSERT INTO Products(ДополнительныеТовары) Values(\"\");";
            dbc.ExecuteComamnd(insertQuery);

            insertQuery = "INSERT INTO Products(ДополнительныеТовары) Values(\"\");";
            dbc.ExecuteComamnd(insertQuery);

            string truncateQuery = "Delete From Products;";
            dbc.ExecuteComamnd(truncateQuery);

            truncateQuery = "ALTER TABLE Products ALTER Column ID_Товара INT;";
            dbc.ExecuteComamnd(truncateQuery);

            truncateQuery = "ALTER TABLE Products ALTER Column ID_Товара AUTOINCREMENT;";
            dbc.ExecuteComamnd(truncateQuery);

        }
    }
}
