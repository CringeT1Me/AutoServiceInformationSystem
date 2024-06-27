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

namespace ServiceApp
{
    /// <summary>
    /// Логика взаимодействия для EditAddictionalProductsWindow.xaml
    /// </summary>
    public partial class EditAddictionalProductsWindow : Window
    {
        List<ProductsWindow.Item> notAddedProducts;
        List<ProductsWindow.Item> addedProducts;
        List<ProductsWindow.Item> allProducts;
        public List<string> addictionalProductsID = new List<string>();
        public EditAddictionalProductsWindow(List<ProductsWindow.Item> _addedProducts, List<ProductsWindow.Item> _allProducts)
        {
            InitializeComponent();
            addedProducts = _addedProducts;
            allProducts = _allProducts;
            notAddedProducts = allProducts; 
            if (!(addedProducts is null))
            {
                foreach (ProductsWindow.Item item in addedProducts)
                {
                    notAddedProducts.Remove(item);
                }
            }
            else
            {
                addedProducts = new List<ProductsWindow.Item>();
            }
            notAddedListView.ItemsSource = notAddedProducts;
            addedListView.ItemsSource = addedProducts;
        }

        private void AddAddictionalProduct(object sender, RoutedEventArgs e)
        {
            foreach (ProductsWindow.Item item in notAddedListView.SelectedItems)
            {
                addedProducts.Add(item);
                notAddedProducts.Remove(item);
            }
            addedListView.ItemsSource = null;
            notAddedListView.ItemsSource = null;
            addedListView.ItemsSource = addedProducts;
            notAddedListView.ItemsSource = notAddedProducts;
        }

        private void RemoveAddictionalProduct(object sender, RoutedEventArgs e)
        {
            foreach (ProductsWindow.Item item in addedListView.SelectedItems)
            {
                notAddedProducts.Add(item);
                addedProducts.Remove(item);
            }
            addedListView.ItemsSource = null;
            notAddedListView.ItemsSource = null;
            addedListView.ItemsSource = addedProducts;
            notAddedListView.ItemsSource = notAddedProducts;
        }

        private void ApplyButton(object sender, RoutedEventArgs e)
        {
            if (addedProducts != null)
            {
                foreach(ProductsWindow.Item item in addedProducts)
                {
                    addictionalProductsID.Add(item.product.ID.ToString());
                }
            }
            this.DialogResult = true;
        }

        private void CloseButton(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
        }
    }
}
