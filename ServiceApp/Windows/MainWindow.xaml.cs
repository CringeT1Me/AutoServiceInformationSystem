using System;
using CompanyCoreLib;
using MLModelLib;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media.Imaging;
using System.Data;

namespace ServiceApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class ProductsWindow : Window
    {
        MLModel.ModelInput modelInput;
        public string provider = "Microsoft SQL Server";
        string sort = "По ID";
        List<Product> products = new List<Product> { };
        List<string> manufacturers = new List<string> { };
        List<Item> items = new List<Item> { };
        List<Item> searchedItems = new List<Item> { };
        DataTable manufacturersTable;
        DataTable productsTable;
        DataTable categoryAndScoreTable;
        string originPath;
        string imageFolderPath;
        DataBaseClass dbc;
        public ProductsWindow()
        {
            InitializeComponent();
            originPath =(System.Reflection.Assembly.GetExecutingAssembly().Location); //получение расположения папки исполняемого файла
            originPath = System.IO.Path.GetDirectoryName(originPath);
            originPath = System.IO.Path.GetDirectoryName(originPath);
            originPath = System.IO.Path.GetDirectoryName(originPath);
            imageFolderPath = "\\Resources\\Images\\";
            BuildApplication();
            searchBox.TextChanged += searchBox_TextChanged;
            filterBox.SelectionChanged += filterBox_SelectionChanged;
        }
        private void BuildApplication()
        {
            try
            {
                dbc = new DataBaseClass(provider, originPath);
            }
            catch (Exception error)
            {
                MessageBox.Show(error.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                provider = "MySQL Server";
                dbc = new DataBaseClass(provider, originPath);
                return;
            }
            manufacturersTable = dbc.GetTable("Select Наименование From Производители");
            productsTable = dbc.GetTable();
            DataRow dataRow = productsTable.Rows[0];
            GetManufacturers();
            BuildItems();
            listView.ItemsSource = null;
            listView.ItemsSource = items;
            filterBox.ItemsSource = manufacturers;
            OrderByScore();
            countBlock.Text = $"{items.Count} из {items.Count}";
        }

        private void GetManufacturers()
        {
            manufacturers.Clear();
            foreach (DataRow dataRow in manufacturersTable.Rows)
            {
                manufacturers.Add(dataRow["Наименование"].ToString());
            }
            manufacturers = manufacturers.OrderBy(manufacturer => manufacturer).ToList();
            manufacturers.Insert(0, "Все элементы");
        }
        private void BuildItems()
        {
            products.Clear();
            items.Clear();
            searchedItems.Clear();
            int rowsCount = productsTable.Rows.Count;
            string categoryAndScoreString1 = string.Empty;
            string categoryAndScoreString2 = string.Empty;
            if (provider == "Microsoft Access" || provider == "Microsoft SQL Server")
            {
                categoryAndScoreString1 = "Select [категории товаров].Наименование as Категория, sum(Количество) as [Количество продаж] From ((Товары Inner Join [категории товаров] on [категории товаров].ID_Категории = Товары.Категория) Inner Join [история продаж] on [история продаж].ID_Товара = Товары.ID_Товара) where Товары.ID_Товара = ";
                categoryAndScoreString2 = " group by[категории товаров].Наименование";
            }
            else
            {
                categoryAndScoreString1 = "Select ifnull(`категории товаров`.Наименование, \"\") as 'Категория', sum(Количество) as 'Количество продаж' \r\nFrom Товары Inner Join `категории товаров` on `категории товаров`.ID_Категории = Товары.Категория Inner Join `история продаж` on `история продаж`.ID_Товара = Товары.ID_Товара where Товары.ID_Товара = ";
                categoryAndScoreString2 = " group by `категории товаров`.Наименование";
            }
            for (int index = 0; index <= rowsCount - 1; index++)
            {
                DataRow dataRow = productsTable.Rows[index];
                long _ID = Convert.ToInt64(dataRow["ID_Товара"]);
                string imagePathString = dataRow["ГлавноеИзображение"].ToString();
                string nameString = dataRow["НаименованиеТовара"].ToString();
                string _nameLabel = nameString;
                int _cost = Convert.ToInt32(dataRow["Стоимость"].ToString());
                string addictionalImages = dataRow["ВторичныеИзображения"].ToString();
                string check = dataRow["Активен?"].ToString();
                string addictionalProductsString = dataRow["ДополнительныеТовары"].ToString();
                string[] addictionalProductsArray = null;
                int[] _addictionalProductsArrayInt = null;
                int _addictionalProductsArrayCount = 0;
                string manufacturerID = dataRow["Производитель"].ToString();
                string _manufacturer = dbc.GetCell($"Select Наименование From Производители where ID_Производителя = {manufacturerID}");
                bool _activity;
                if (addictionalProductsString != "")
                {
                    _nameLabel += $" ({addictionalProductsString.Split(';').Length})";
                    addictionalProductsArray = addictionalProductsString.Split(';');
                    _addictionalProductsArrayInt = new int[addictionalProductsArray.Length];
                    _addictionalProductsArrayCount = addictionalProductsArray.Length;
                    for (int i = 0; i < addictionalProductsArray.Length; i++)
                    {
                        int.TryParse(addictionalProductsArray[i], out _addictionalProductsArrayInt[i]);
                    }
                }
                string[] _addictionalImagesPath;
                int _addictionalImagesCount;
                string _color;
                string _description = dataRow["Описание"].ToString();
                if (addictionalImages == "")
                {
                    _addictionalImagesCount = 0;
                    _addictionalImagesPath = new string[] { "" };
                }
                else
                {
                    _addictionalImagesPath = addictionalImages.Split(';');
                    _addictionalImagesCount = _addictionalImagesPath.Length;
                }
                List<RadioButton> _radioButtonList = new List<RadioButton> { };
                if (_addictionalImagesCount > 0)
                {
                    for (int i = 0; i <= _addictionalImagesCount; i++)
                    {
                        RadioButton radioButton = new RadioButton
                        {
                            IsHitTestVisible = false,
                            Focusable = false
                        };
                        if (i == 0)
                        {
                            radioButton.IsChecked = true;
                        }
                        _radioButtonList.Add(radioButton);
                    }
                }
                if (check == "нет")
                {
                    _color = "LightGray";
                    _activity = false;
                }
                else
                {
                    _color = "White";
                    _activity = true;
                }       
                
                if (_description == "")
                {
                    _description = "Описание отсутсвует";
                }
                string category;
                categoryAndScoreTable = dbc.GetTable(categoryAndScoreString1 + _ID + categoryAndScoreString2);
                if (categoryAndScoreTable.Rows.Count == 0)
                {
                    if (provider == "Microsoft Access" || provider == "Microsoft SQL Server")
                    {
                        category = dbc.GetCell($"Select [Категории товаров].Наименование From (Товары Inner Join [Категории товаров] on [Категории товаров].ID_Категории = Товары.Категория) where ID_Товара = {_ID}");
                    }
                    else
                    {
                        category = dbc.GetCell($"Select `Категории товаров`.Наименование From (Товары Inner Join `Категории товаров` on `Категории товаров`.ID_Категории = Товары.Категория) where ID_Товара = {_ID}");
                    }
                }
                else
                {
                    DataRow categoryAndScoreRow = categoryAndScoreTable.Rows[0];
                    category = categoryAndScoreRow["Категория"].ToString();
                }
                modelInput = new MLModel.ModelInput()
                {
                    Наименование_товара = nameString,
                    Категория = category,
                    Производитель = _manufacturer,
                    Стоимость = _cost,
                };
                double _score = MLModel.Predict(modelInput).Score;
                Product product = new Product() { ID = _ID, imagePath = originPath + imageFolderPath + imagePathString, name = nameString, 
                    cost = _cost, manufacturer = _manufacturer, addictionalProducts = _addictionalProductsArrayInt, 
                    addictionalImagesCount = _addictionalImagesCount, addictionalImagePaths = _addictionalImagesPath, 
                    description = _description, activity = _activity, score = _score };
                products.Add(product);
                Item item = new Item() { product = product, radioButtonList = _radioButtonList, color = _color, nameLabel = _nameLabel };
                items.Add(item);
            }
        }
        
        public void OrderByScore()
        {
            var sortItems = new List<Item>();
            sortItems = listView.Items.Cast<Item>().ToList();
            listView.ItemsSource = sortItems.OrderByDescending(item => item.product.score).ToList();
        }

        public class Product
        {
            public long ID { get; set; }
            public string imagePath { get; set; }
            public string name { get; set; }
            public int cost { get; set; }
            public string manufacturer { get; set; }
            public int[] addictionalProducts { get; set; }
            public int addictionalImagesCount { get; set; }
            public string[] addictionalImagePaths { get; set; }
            public string description { get; set; }
            public bool activity { get; set; }
            public double score { get; set; }
        }

        public class Item
        {
            public Product product { get; set; }
            public List<RadioButton> radioButtonList { get; set; }
            public string color { get; set; }
            public string nameLabel { get; set; }
        }

        private void SearchAndFilter()
        {
            searchedItems.Clear();
            if (searchedItems != null && filterBox != null)
            {
                string searchString = searchBox.Text.ToLower();
                string filterString = filterBox.SelectedItem.ToString();
                if (searchString == "поиск" && filterString == "Все элементы")
                {
                    listView.ItemsSource = searchedItems;
                    listView.ItemsSource = items;
                }
                else if (searchString == "поиск" && filterString != "Все элементы")
                {
                    foreach (Item item in items)
                    {
                        if (item.product.manufacturer == filterString)
                        {
                            searchedItems.Add(item);
                        }
                    }
                    listView.ItemsSource = items;
                    listView.ItemsSource = searchedItems;
                }
                else if (searchString != "поиск" && filterString == "Все элементы")
                {
                    foreach (Item item in items)
                    {
                        if (item.product.name.ToLower().Contains(searchString) || item.product.description.ToLower().Contains(searchString))
                        {
                            searchedItems.Add(item);
                        }
                    }
                    listView.ItemsSource = items;
                    listView.ItemsSource = searchedItems;
                }
                else
                {
                    foreach (Item item in items)
                    {
                        if ((item.product.name.ToLower().Contains(searchString) || item.product.description.ToLower().Contains(searchString)) && item.product.manufacturer == filterString)
                        {
                            searchedItems.Add(item);
                        }
                    }
                    listView.ItemsSource = items;
                    listView.ItemsSource = searchedItems;
                }
                countBlock.Text = $"{searchedItems.Count} из {items.Count}";
            }
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            SearchAndFilter();
        }

        private void filterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SearchAndFilter();
        }

        private void searchBox_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (searchBox.Text == "Поиск")
            {
                searchBox.Text = "";
            }
        }

        private void searchBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (searchBox.Text == "")
            {
                searchBox.Text = "Поиск";
            }
        }

        private void DeleteItem_Click(object sender, RoutedEventArgs e)
        {
            int errorsCount = 0;
            ConfirmWindow confirmWindow = new ConfirmWindow();
            bool? dialogResult = confirmWindow.ShowDialog();
            if (dialogResult == true)
            {
                string queryString;
                if (confirmWindow.result == "Только товар")
                {
                    foreach (Item item in listView.SelectedItems)
                    {
                        long ID = item.product.ID;
                        DataTable historyTable = new DataTable();
                        historyTable = dbc.GetTable($"Select * From `История продаж` where ID_Товара = {ID}");
                        if (historyTable.Rows.Count > 0)
                        {
                            errorsCount++;
                        }
                        else
                        {
                            queryString = $"Delete From Товары where ID_Товара = {ID}";
                            dbc.ExecuteComamnd(queryString);
                        }
                    }

                }
                else
                {
                    foreach (Item item in listView.SelectedItems)
                    {
                        if (!(item.product.addictionalProducts is null))
                        {
                            foreach (int addictionalID in item.product.addictionalProducts)
                            {
                                DataTable addictionalHistoryTable = new DataTable();
                                addictionalHistoryTable = dbc.GetTable($"Select * From `История продаж` where ID_Товара = {addictionalID}");
                                if (addictionalHistoryTable.Rows.Count > 0)
                                {
                                    errorsCount++;
                                }
                                else
                                {
                                    queryString = $"Delete From Товары where ID_Товара = {addictionalID}";
                                    dbc.ExecuteComamnd(queryString);
                                }
                            }
                        }
                        long ID = item.product.ID;
                        DataTable historyTable = new DataTable();
                        historyTable = dbc.GetTable($"Select * From `История продаж` where ID_Товара = {ID}");
                        if (historyTable.Rows.Count > 0)
                        {
                            errorsCount++;
                        }
                        else
                        {
                            queryString = $"Delete From Товары where ID_Товара = {ID}";
                            dbc.ExecuteComamnd(queryString);
                        }
                    }
                }
                if (errorsCount > 0)
                {
                    MessageBox.Show($"Не удалось удалить все товары, так как у товаров есть информация о продажах. Количество неудаленных товаров: {errorsCount}.", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
                productsTable = dbc.GetTable();
                BuildItems();
                SearchAndFilter();
                Sort();
            }
        }

        private void Sort()
        {
            var sortItems = new List<Item>();
            sortItems = listView.Items.Cast<Item>().ToList();
            if (sort == "По возрастанию")
            {
                listView.ItemsSource = sortItems.OrderBy(item => item.product.cost).ToList();
            }
            if (sort == "По убыванию")
            {
                listView.ItemsSource = sortItems.OrderByDescending(item => item.product.cost).ToList();
            }
        }

        private void sortCostLowToHight_Click(object sender, RoutedEventArgs e)
        {
            sort = "По возрастанию";
            Sort();
        }

        private void sortCostHightToLow_Click(object sender, RoutedEventArgs e)
        {
            sort = "По убыванию";
            Sort();
        }

        private void Image_MouseMove(object sender, MouseEventArgs e)
        {
            try
            {
                string[] cordsArray = e.GetPosition((IInputElement)sender).ToString().Split(';');
                double cords = Convert.ToDouble(cordsArray[0]) / 1000;
                Image image = sender as Image;
                Item item = image.DataContext as Item;
                if (item.product.addictionalImagesCount > 0)
                {
                    double step = image.Width / (item.product.addictionalImagesCount + 1);
                    double index = cords / step;
                    if (index <= 1.0)
                    {
                        BitmapImage img = new BitmapImage();
                        using (System.IO.FileStream stream = System.IO.File.OpenRead(item.product.imagePath))
                        {
                            img.BeginInit();
                            img.CacheOption = BitmapCacheOption.OnLoad;
                            img.StreamSource = stream;
                            img.EndInit();
                        }
                        image.Source = img;
                        foreach (RadioButton radioButton in item.radioButtonList)
                        {
                            radioButton.IsChecked = false;
                        }
                        item.radioButtonList[0].IsChecked = true;
                    }
                    else
                    {
                        try
                        {
                            BitmapImage img = new BitmapImage();
                            using (System.IO.FileStream stream = System.IO.File.OpenRead(originPath + imageFolderPath + item.product.addictionalImagePaths[(int)Math.Ceiling(index) - 2].ToString()))
                            {
                                img.BeginInit();
                                img.CacheOption = BitmapCacheOption.OnLoad;
                                img.StreamSource = stream;
                                img.EndInit();
                            }
                            image.Source = img;
                            foreach (RadioButton radioButton in item.radioButtonList)
                            {
                                radioButton.IsChecked = false;
                            }
                            item.radioButtonList[(int)Math.Ceiling(index) - 1].IsChecked = true;
                        }
                        catch { }
                    }
                }
            }
            catch { }
        }

        private void EditClick(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = (MenuItem)sender;
            Item item = menuItem.DataContext as Item;
            List<Item> addictionalItems = null;
            if (!(item.product.addictionalProducts is null))
            {
                addictionalItems = new List<Item>();
                foreach (long id in item.product.addictionalProducts)
                {
                    Item addictionalItem = items.Find(_item => _item.product.ID == id);
                    addictionalItems.Add(addictionalItem);
                }
            }
            AddAndEditWindow addAndEditWindow = new AddAndEditWindow(provider, "Редактирование", originPath, manufacturers, item, addictionalItems, items);
            addAndEditWindow.ShowDialog();
            productsTable = dbc.GetTable();
            BuildItems();
            SearchAndFilter();
            Sort();
        }

        private void AddProductClick(object sender, RoutedEventArgs e)
        {
            AddAndEditWindow addAndEditWindow = new AddAndEditWindow(provider, "Добавление", originPath, manufacturers, _allItems: items);
            bool? dialogResult = addAndEditWindow.ShowDialog();
            if (dialogResult == true)
            {
                productsTable = dbc.GetTable();
                BuildItems();
                SearchAndFilter();
                Sort();
            }
        }

        private void HistoryItemClick(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = sender as MenuItem;
            Item item = menuItem.DataContext as Item;
            SellHistoryWindow sellHistoryWindow = new SellHistoryWindow(provider, originPath, item.product.ID, item.product.name);
            sellHistoryWindow.ShowDialog();
        }

        private void filterBox_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {

        }

        private void ChangeDataBase(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = sender as MenuItem;
            if (menuItem.Header.ToString() != provider)
            {
                provider = menuItem.Header.ToString();
                BuildApplication();
                SearchAndFilter();
                Sort();
            }
        }
    }
}
