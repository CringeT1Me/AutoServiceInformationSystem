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
using Microsoft.Win32;

namespace ServiceApp
{
    /// <summary>
    /// Логика взаимодействия для AddAndEditWindow.xaml
    /// </summary>
    public partial class AddAndEditWindow : Window
    {
        DataBaseClass dbc;
        ProductsWindow.Item item;
        List<ProductsWindow.Item> addictictionalItems;
        List<ProductsWindow.Item> allItems;
        List<string> manufacturers;
        string provider;
        string originPath;
        string mode;
        string filePath = "";
        string addictionalProductsString = "";
        public AddAndEditWindow(string _provider, string _mode, string _originPath, List<string> _manufacturers, ProductsWindow.Item _item = null, List<ProductsWindow.Item> _addictictionalItems = null, List<ProductsWindow.Item> _allItems = null)
        {
            InitializeComponent();
            provider = _provider;
            originPath = _originPath;
            try
            {
                dbc = new DataBaseClass(provider, originPath);
            }
            catch (Exception error)
            {
                MessageBox.Show(error.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            item = _item;
            addictictionalItems = _addictictionalItems;
            allItems = _allItems;
            manufacturers = _manufacturers;
            manufacturers.Remove("Все элементы");
            manufacturersComboBox.ItemsSource = manufacturers;
            mode = _mode;
            listView.ItemsSource = addictictionalItems;
            if (mode == "Добавление")
            {
                applyButton.Content = "Добавить товар";
                imageMenuItem.Header = "Добавить изображение";
                image.Source = this.Icon;
                manufacturersComboBox.SelectedIndex = 0;
                idLabel.Visibility = Visibility.Collapsed;
                idTextBox.Visibility = Visibility.Collapsed;
            }
            else
            {
                try
                {
                    idTextBox.Text = item.product.ID.ToString();
                    nameTextBox.Text = item.product.name;
                    costTextBox.Text = item.product.cost.ToString();
                    manufacturersComboBox.SelectedItem = item.product.manufacturer;
                    descriptionTextBox.Text = item.product.description;
                    try
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
                    }catch
                    {
                        image.Source = this.Icon;
                    }
                    activityCheckBox.IsChecked = item.product.activity;
                }catch { }
            }
        }


        private void applyButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                List<string> addictItemsList = new List<string>();
                string queryString = "";
                string fileName;
                string manufacturer = dbc.GetCell($"Select ID_Производителя From Производители where Наименование = '{manufacturersComboBox.Text}'");
                string activity = "да";
                string imagePath = "";
                string imageFolder = "Товары автосервиса\\\\";
                
                if (listView.Items.Count > 0)
                {
                    foreach (ProductsWindow.Item addictItem in listView.Items)
                    {
                        addictItemsList.Add(addictItem.product.ID.ToString());
                    }
                    addictionalProductsString = String.Join(";", addictItemsList.ToArray());
                }
                if (activityCheckBox.IsChecked == false)
                {
                    activity = "нет";
                }
                string cost = costTextBox.Text.Replace(',', '.');
                if (cost.Contains("-"))
                {
                    MessageBox.Show("Стоимость не должна быть отрицательной", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }
                if (mode == "Редактирование")
                {
                    imagePath = imageFolder + item.product.imagePath.Split('\\').Last();
                    if (filePath != "")
                    {
                        fileName = imageFolder + filePath.Split('\\').Last();
                        System.IO.File.Copy(filePath, originPath + fileName, true);
                        imagePath = fileName;
                    }
                    switch (provider)
                    {
                        case "MySQL Server":
                            imagePath = imagePath.Replace("\\", "\\\\");
                            queryString = $"Update Товары Set НаименованиеТовара = '{nameTextBox.Text}', Стоимость = '{cost}', Описание = '{descriptionTextBox.Text}', ГлавноеИзображение = '{imagePath}', Производитель = '{manufacturer}', `Активен?` = '{activity}', ДополнительныеТовары = '{addictionalProductsString}' where ID_Товара = {item.product.ID}";
                            break;
                        case string str when str == "Microsoft SQL Server" || str == "Microsoft Access":
                            queryString = $"Update Товары Set НаименованиеТовара = '{nameTextBox.Text}', Стоимость = '{cost}', Описание = '{descriptionTextBox.Text}', ГлавноеИзображение = '{imagePath}', Производитель = '{manufacturer}', [Активен?] = '{activity}', ДополнительныеТовары = '{addictionalProductsString}' where ID_Товара = {item.product.ID}";
                            break;

                    }
                }
                else
                {
                    if (filePath != "")
                    {
                        fileName = imageFolder + filePath.Split('\\').Last();
                        System.IO.File.Copy(filePath, originPath + fileName, true);
                        imagePath = fileName;
                    }
                    switch (provider)
                    {
                        case "MySQL Server":
                            imagePath = imagePath.Replace("\\", "\\\\");
                            queryString = $"Insert Into Товары(Категория, НаименованиеТовара, Стоимость, Описание, ГлавноеИзображение, Производитель, `Активен?`, ДополнительныеТовары) Values(1, '{nameTextBox.Text}', '{cost}', '{descriptionTextBox.Text}', '{imagePath}', '{manufacturer}', '{activity}', '{addictionalProductsString}')";
                            break;
                        case string str when str == "Microsoft SQL Server" || str == "Microsoft Access":
                            queryString = $"Insert Into Товары(Категория, НаименованиеТовара, Стоимость, Описание, ГлавноеИзображение, Производитель, [Активен?], ДополнительныеТовары) Values(1, '{nameTextBox.Text}', '{cost}', '{descriptionTextBox.Text}', '{imagePath}', '{manufacturer}', '{activity}', '{addictionalProductsString}')";
                            break;

                    }
                }
                if (string.IsNullOrEmpty(imagePath))
                {
                    MessageBox.Show("Изображение не выбрано", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }
                dbc.ExecuteComamnd(queryString);
                this.DialogResult = true;
            }
            catch(Exception error)
            {
                MessageBox.Show(error.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
        }

        private void ChangeImage(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image files (*.png;*.jpeg)|*.png;*.jpeg",
                InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyPictures)
            };
            if (openFileDialog.ShowDialog() == true)
            {
                filePath = (string)openFileDialog.FileName;
                imageMenuItem.Header = "Изменить изображение";
                BitmapImage img = new BitmapImage();
                using (System.IO.FileStream stream = System.IO.File.OpenRead(filePath))
                {
                    img.BeginInit();
                    img.CacheOption = BitmapCacheOption.OnLoad;
                    img.StreamSource = stream;
                    img.EndInit();
                }
                image.Source = img;
            }
        }

        private void ImageLeftClick(object sender, MouseButtonEventArgs e)
        {
            Image img = sender as Image;
            ProductsWindow.Item item = img.DataContext as ProductsWindow.Item;
            List<ProductsWindow.Item> anotherAddictionalItems = null;
            if (!(item.product.addictionalProducts is null))
            {
                anotherAddictionalItems = new List<ProductsWindow.Item>();
                foreach (long id in item.product.addictionalProducts)
                {
                    ProductsWindow.Item addictionalItem = allItems.Find(_item => _item.product.ID == id);
                    anotherAddictionalItems.Add(addictionalItem);
                }
            }
            AddAndEditWindow addAndEditWindow = new AddAndEditWindow(provider, "Редактирование", originPath, manufacturers, item, anotherAddictionalItems, allItems);
            addAndEditWindow.ShowDialog();
        }

        private void EditAddictionalProducts(object sender, RoutedEventArgs e)
        {
            List<ProductsWindow.Item> allItemsExcepted = allItems;
            try
            {
                allItemsExcepted.Remove(item);
            }
            catch { }
            allItemsExcepted = allItemsExcepted.FindAll(_item => _item.product.activity == true);
            EditAddictionalProductsWindow editAddictionalProductsWindow = new EditAddictionalProductsWindow(addictictionalItems, allItemsExcepted);
            bool? dialogResult = editAddictionalProductsWindow.ShowDialog();
            if (dialogResult == true)
            {
                string[] addictionalProductsIDArrray = editAddictionalProductsWindow.addictionalProductsID.ToArray();
                addictionalProductsString = String.Join(";", addictionalProductsIDArrray);
                addictictionalItems = new List<ProductsWindow.Item>();
                if (addictionalProductsIDArrray.Count() > 0)
                {
                    foreach (string id in addictionalProductsIDArrray)
                    {
                        ProductsWindow.Item findItem = allItems.Find(_item => _item.product.ID == Convert.ToInt64(id));
                        addictictionalItems.Add(findItem);
                    }
                    listView.ItemsSource = null;
                    listView.ItemsSource = addictictionalItems;
                }
            }
        }
    }
}
