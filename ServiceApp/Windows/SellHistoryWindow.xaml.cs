using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data;

namespace ServiceApp
{
    /// <summary>
    /// Логика взаимодействия для SellHistoryWindow.xaml
    /// </summary>
    public partial class SellHistoryWindow : Window
    {
        DataBaseClass dbc;
        DataTable historyTable;
        string provider;
        string originPath;
        long productID;
        List<string> products = new List<string> { };
        string selectString = "";
        string whereString = "";
        public SellHistoryWindow(string _provider, string _originPath, long _productID = -1, string _name = "Все товары")
        {
            InitializeComponent();
            provider = _provider;
            originPath = _originPath;
            switch (provider)
            {
                case "Microsoft Access":
                    selectString = "SELECT Товары.ID_Товара as [ID товара], Товары.НаименованиеТовара as [Наименование товара], [Категории товаров].Наименование as [Категория товара], Производители.Наименование AS Производитель, Товары.Стоимость, Товары.Описание, Производители.Наименование, Товары.ДополнительныеТовары as [Дополнительные товары], [Активен?], [История продаж].ДатаИВремяПродажи as [Дата и время продажи], [История продаж].Количество " +
                            "FROM(((Товары " +
                            "INNER JOIN Производители ON Производители.ID_Производителя = Товары.Производитель) " +
                            "INNER JOIN[История продаж] ON [История продаж].ID_Товара = Товары.ID_Товара) " +
                            "INNER JOIN[Категории товаров] ON [Категории товаров].ID_Категории = Товары.Категория)";

                    break;
                case string str when str == "Microsoft SQL Server" || str == "MySQL Server":
                    selectString = "SELECT * From sell_history";
                    break;
            }
            try
            {
                dbc = new DataBaseClass(provider, originPath);
            }
            catch (Exception error)
            {
                MessageBox.Show(error.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            productID = _productID;
            DataTable productsTable = dbc.GetTable("Select НаименованиеТовара From Товары");
            foreach (DataRow dataRow in productsTable.Rows)
            {
                products.Add(dataRow["НаименованиеТовара"].ToString());
            }
            products.Sort();
            products.Insert(0, "Все товары");
            filterBox.ItemsSource = products;
            filterBox.SelectedItem = _name;
            if (productID != -1)
            {
                switch (provider)
                {
                    case "Microsoft Access":
                        whereString = $" where Товары.ID_Товара = {productID}";
                        break;
                    case "Microsoft SQL Server":
                        whereString = $" where sell_history.[ID Товара] = {productID}";
                        break;
                    case "MySQL Server":
                        whereString = $" where sell_history.`ID Товара` = {productID}";
                        break;
                }
            }
            historyTable = dbc.GetTable(selectString + whereString);
            historyGrid.ItemsSource = historyTable.DefaultView;
            filterBox.SelectionChanged += FilterChanged;
            this.WindowState = WindowState.Maximized;
        }

        private void FilterChanged(object sender, SelectionChangedEventArgs e)
        {
            string filter = filterBox.SelectedItem.ToString();
            if (filter == "Все товары")
            {
                whereString = "";
            }
            else
            {
                switch (provider)
                {
                    case "Microsoft Access":
                        whereString = $" where Товары.НаименованиеТовара = '{filter}'";
                        break;
                    case "Microsoft SQL Server":
                        whereString = $" where sell_history.[Наименование товара] = '{filter}'";
                        break;
                    case "My SQL Server":
                        whereString = $" where sell_history.`Наименование товара` = '{filter}'";
                        break;
                }
            }
            historyTable = dbc.GetTable(selectString + whereString);
            historyGrid.ItemsSource = historyTable.DefaultView;
        }
    }
}
