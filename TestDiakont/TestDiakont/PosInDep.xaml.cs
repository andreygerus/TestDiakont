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
    /// Interaction logic for PosInDep.xaml
    /// </summary>
    /// 




    public partial class PosInDep : Window
    {
    DCDataContext dc = new DCDataContext(
         Properties.Settings.Default.TestDiakontConnectionString);

        Glb glb=new Glb(); // Глобальный класс

        private void OpenTabBtn() // Метод открытия вкладки кнопок управления
        {
            tabControl.SelectedIndex = 1;
            tabControl.SelectedItem = TabBtn;
            TabBtn.IsSelected = true;
        }

        private void OpenTabEdt() // Метод открытия вкладки с элементами редактирования
        {
            tabControl.SelectedIndex = 0;
            tabControl.SelectedItem = TabEdt;
            TabEdt.IsSelected = true;
         }

        public PosInDep()
        {
            InitializeComponent();
            

            if (dc.DatabaseExists())
            {
                // Заполняем комбобокс отделами
                CbxDep.ItemsSource = dc.Deps;
                CbxDep.DisplayMemberPath = "NameDep";
                CbxDep.SelectedValuePath = "id_dep";


                // Заполняем комбобокс должностями
                CbxPos.ItemsSource = dc.Pos;
                CbxPos.DisplayMemberPath = "NamePos";
                CbxPos.SelectedValuePath = "id_pos";

               
            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            // Скрываем названия закладок
            TabEdt.Visibility = System.Windows.Visibility.Hidden;
            TabBtn.Visibility = System.Windows.Visibility.Hidden;
            OpenTabBtn();
            tabControl.Height = 131; // Восстанавливаем размер без названий закладок
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            OpenTabBtn(); // Открываем вкладку с кнопками
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            /*
             Условия добавления штатных единиц
             1) Добавлять штатные единицы можно только на следующий месяц от максимальной даты
             2) Если для выбраной должности нет штатных единиц, то можно выбирать любой месяц-год
             */
           
            if (glb.TestInt(TxtBxCount.Text) == false) // Проверка на корректность числа
            {
                MessageBox.Show("Введите корректно количество!");
                TxtBxCount.Focus(); // Перемещаем фокус на контрол
                if (TxtBxCount.Text != null) TxtBxCount.SelectAll(); // Выделяем в контроле текст
                return;
            }

            // Проверка корректности даты
            String DtIn;
            DtIn = "01-" + MonthCalendar.Text;


            DateTime dtOut;

            if (DateTime.TryParse(DtIn, out dtOut))
            {

            }
            else
            {
                //сообщение об ошибке
                MessageBox.Show("Введите корректно месяц и год!");
                MonthCalendar.Focus(); // Перемещаем фокус на контрол
                return;
            }



            // Запускаем SQL-процедуру обновления
            int ReturnCode = dc.AddPosInDep(Convert.ToInt32(CbxDep.SelectedValue.ToString()), Convert.ToInt32(CbxPos.SelectedValue.ToString()), dtOut, Convert.ToInt16(TxtBxCount.Text));

            if (ReturnCode == 0)
            {
                //сообщение об ошибке
                MessageBox.Show("Данный месяц уже занят!");
                MonthCalendar.Focus(); // Перемещаем фокус на контрол
                return;
            }


            // Перегружаем список в грид с должностями
            dataGridPosInDep.ItemsSource = dc.PosInDep(Convert.ToInt32(CbxDep.SelectedValue.ToString()));


            OpenTabBtn(); // Открываем вкладку с кнопками

        }

        private void CbxDep_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // Перегружаем список в грид с должностями
            dataGridPosInDep.ItemsSource = dc.PosInDep(Convert.ToInt32(CbxDep.SelectedValue.ToString()));

        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            OpenTabEdt();
        }
    }
}
