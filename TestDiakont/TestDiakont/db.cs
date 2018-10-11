using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Data.SqlClient;

namespace TestDiakont
{
    class db
    {
        // Получаем строку соединения
        //private string connectionString = Properties.Settings.Default.ConnectionString();
        // получаем строку подключения из app.config
      String  connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
     }




}
