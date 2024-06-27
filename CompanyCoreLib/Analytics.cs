using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompanyCoreLib
{
    public class Analytics
    {
        public List<DateTime> PopularMonths(List<DateTime> dates)
        {
            List<DateTime> sortedDates = new List<DateTime>();
            if (dates is null) 
            {
                return sortedDates;
            }
            if (dates.Count == 0)
            {
                return sortedDates;
            }
            int year = dates[0].Year;
            List<int> sortedMonths = new List<int>();
            List<DateTime> resultDates = new List<DateTime>();
            Dictionary<int, int> monthsCount = new Dictionary<int, int>
            {
                [1] = 0,   //Январь
                [2] = 0,   //Февраль
                [3] = 0,   //Март
                [4] = 0,   //Апрель
                [5] = 0,   //Май
                [6] = 0,   //Июнь
                [7] = 0,   //Июль
                [8] = 0,   //Август
                [9] = 0,   //Сентябрь
                [10] = 0,  //Октябрь
                [11] = 0,  //Ноябрь
                [12] = 0   //Декабрь
            };
            foreach (DateTime date in dates)
            {
                monthsCount[date.Month] += 1;
                if (year != date.Year)
                {
                    return sortedDates;
                }
            }
            while(monthsCount.Count > 0)
            {
                var items = monthsCount.Where(month => month.Value == monthsCount.Values.Max()).ToDictionary(i => i.Key, i => i.Value);
                items.OrderBy(item => item.Value);

                foreach ( var item in items)
                {
                    if (item.Value != 0)
                    {
                        sortedMonths.Add(item.Key);
                    }
                    monthsCount.Remove(item.Key);
                }
            }
            foreach (int month in sortedMonths)
            {
                resultDates.Add(Convert.ToDateTime($"{year} - {month} - 01 00:00"));
            }
            return resultDates;
        }
    }
}
