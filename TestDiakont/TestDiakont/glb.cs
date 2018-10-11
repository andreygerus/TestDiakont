using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestDiakont
{
    class Glb
    {
        public Boolean TestInt(String Text) // Проверка входной строки на корректность Int
        {
            if ((System.Text.RegularExpressions.Regex.IsMatch(Text, "[^0-9]")) // Проверка на число
                         || (Text.Length == 0))
            {
                return false; // Не корректно
            }
            return true; // Корректно
        }
    }
}
