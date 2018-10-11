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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TestDiakont
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {


        public MainWindow()
        {
            InitializeComponent();
            
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {

            RateEdit RateEdt = new RateEdit();
            RateEdt.Show(); // открываем окно редактирования ставок

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
         
        }

        private void MenuItem_Click_1(object sender, RoutedEventArgs e)
        {
            PosInDep PsInDp = new PosInDep();
            PsInDp.Show(); // открываем окно редактирования должностей в отделе
        }

        private void MenuItem_Click_2(object sender, RoutedEventArgs e)
        {
            Report Rpt = new Report();
            Rpt.Show(); // открываем окно отчета

        }
    }
}
