using System;
using CompanyCoreLib;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CompanyCoreLibTest
{
    [TestClass]
    public class AnalyticsUnitTests
    {
        [TestMethod]
        public void PopularMonths_SimpleTest()
        {
            List<DateTime> unsortedDates = new List<DateTime> { Convert.ToDateTime("2019 - 12 - 01 15:05"), Convert.ToDateTime("2019 - 11 - 04 09:01"), Convert.ToDateTime("2019 - 12 - 12 14:43") };
            Analytics analytics = new Analytics();
            List<DateTime> expectedDates = new List<DateTime> { Convert.ToDateTime("2019-12-01 00:00"), Convert.ToDateTime("2019 - 11 - 01 00:00") };
            List<DateTime> realDates = analytics.PopularMonths(unsortedDates);
            CollectionAssert.AreEqual(expectedDates, realDates);
        }
        [TestMethod]
        public void PopularMonths_NullList()
        {
            List<DateTime> unsortedDates = null;
            Analytics analytics = new Analytics();
            List<DateTime> expectedDates = new List<DateTime>();
            List<DateTime> realDates = analytics.PopularMonths(unsortedDates);
            CollectionAssert.AreEqual(expectedDates, realDates);
        }
        [TestMethod]
        public void PopularMonths_EmptyList()
        {
            List<DateTime> unsortedDates = new List<DateTime>();
            Analytics analytics = new Analytics();
            List<DateTime> expectedDates = new List<DateTime>();
            List<DateTime> realDates = analytics.PopularMonths(unsortedDates);
            CollectionAssert.AreEqual(expectedDates, realDates);
        }
        [TestMethod]
        public void PopularMonths_SeveralPopularMonths()
        {
            List<DateTime> unsortedDates = new List<DateTime> { Convert.ToDateTime("2019 - 12 - 01 15:05"), Convert.ToDateTime("2019 - 11 - 04 09:01"), Convert.ToDateTime("2019 - 12 - 12 14:43"), Convert.ToDateTime("2019 - 11 - 15 14:23"), Convert.ToDateTime("2019 - 5 - 2 10:43"), Convert.ToDateTime("2019 - 5 - 19 4:30"), Convert.ToDateTime("2019 - 2 - 12 14:43") };
            Analytics analytics = new Analytics();
            List<DateTime> expectedDates = new List<DateTime> { Convert.ToDateTime("2019 - 5 - 01 00:00"), Convert.ToDateTime("2019-11-01 00:00"), Convert.ToDateTime("2019 - 12 - 01 00:00"), Convert.ToDateTime("2019 - 2 - 01 00:00") };
            List<DateTime> realDates = analytics.PopularMonths(unsortedDates);
            CollectionAssert.AreEqual(expectedDates, realDates);
        }
        [TestMethod]
        public void PopularMonths_SeveralYears()
        {
            List<DateTime> unsortedDates = new List<DateTime> { Convert.ToDateTime("2019 - 12 - 01 15:05"), Convert.ToDateTime("2019 - 11 - 04 09:01"), Convert.ToDateTime("2018 - 12 - 12 14:43"), Convert.ToDateTime("2019 - 11 - 15 14:23"), Convert.ToDateTime("2019 - 5 - 2 10:43"), Convert.ToDateTime("2019 - 5 - 19 4:30"), Convert.ToDateTime("2019 - 2 - 12 14:43") };
            Analytics analytics = new Analytics();
            List<DateTime> expectedDates = new List<DateTime>();
            List<DateTime> realDates = analytics.PopularMonths(unsortedDates);
            CollectionAssert.AreEqual(expectedDates, realDates);
        }
    }
}