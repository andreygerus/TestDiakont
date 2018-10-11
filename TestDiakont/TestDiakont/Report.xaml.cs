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

namespace TestDiakont
{
    /// <summary>
    /// Interaction logic for Report.xaml
    /// </summary>
    public partial class Report : Window
    {

        DCDataContext dc = new DCDataContext(Properties.Settings.Default.TestDiakontConnectionString);

       


        public Report()
        {
            InitializeComponent();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            // Проверка корректности даты
            String DtIn;
            DtIn = "01-" + MonthCalendarFrom.Text;


            DateTime dtFROM;

            if (DateTime.TryParse(DtIn, out dtFROM))
            {

            }
            else
            {
                //сообщение об ошибке
                MessageBox.Show("Введите корректно месяц и год!");
                MonthCalendarFrom.Focus(); // Перемещаем фокус на контрол
                return;
            }


            // Проверка корректности даты
            DateTime dtTO;
            DtIn = "01-" + MonthCalendarTo.Text;


          

            if (DateTime.TryParse(DtIn, out dtTO))
            {

            }
            else
            {
                //сообщение об ошибке
                MessageBox.Show("Введите корректно месяц и год!");
                MonthCalendarTo.Focus(); // Перемещаем фокус на контрол
                return;
            }

            // Перегружаем список в грид 
            //  dataGridReport.ItemsSource = dc.SSandBetwRateDate(1, dtFROM, dtTO);
            dataGridReport.ItemsSource = dc.SSandBetwRateDate(1, Convert.ToDateTime("01-01-2015"), Convert.ToDateTime("06-01-2015"));


        }
    }
}
