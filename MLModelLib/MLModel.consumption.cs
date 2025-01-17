﻿// This file was auto-generated by ML.NET Model Builder.
using Microsoft.ML;
using Microsoft.ML.Data;
using System;
using System.Linq;
using System.IO;
using System.Collections.Generic;
using System.Reflection;
namespace MLModelLib
{
    public partial class MLModel
    {
        /// <summary>
        /// model input class for MLModel.
        /// </summary>
        #region model input class
        public class ModelInput
        {
            [LoadColumn(0)]
            [ColumnName(@"Наименование товара")]
            public string Наименование_товара { get; set; }

            [LoadColumn(1)]
            [ColumnName(@"Категория")]
            public string Категория { get; set; }

            [LoadColumn(2)]
            [ColumnName(@"Производитель")]
            public string Производитель { get; set; }

            [LoadColumn(3)]
            [ColumnName(@"Стоимость")]
            public float Стоимость { get; set; }

            [LoadColumn(4)]
            [ColumnName(@"Оценка")]
            public float Оценка { get; set; }

        }

        #endregion

        /// <summary>
        /// model output class for MLModel.
        /// </summary>
        #region model output class
        public class ModelOutput
        {
            [ColumnName(@"Наименование товара")]
            public float[] Наименование_товара { get; set; }

            [ColumnName(@"Категория")]
            public float[] Категория { get; set; }

            [ColumnName(@"Производитель")]
            public float[] Производитель { get; set; }

            [ColumnName(@"Стоимость")]
            public float Стоимость { get; set; }

            [ColumnName(@"Оценка")]
            public float Оценка { get; set; }

            [ColumnName(@"Features")]
            public float[] Features { get; set; }

            [ColumnName(@"Score")]
            public float Score { get; set; }

        }

        #endregion

        private static string MLNetModelPath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + @"\MLModel.mlnet";

        public static readonly Lazy<PredictionEngine<ModelInput, ModelOutput>> PredictEngine = new Lazy<PredictionEngine<ModelInput, ModelOutput>>(() => CreatePredictEngine(), true);


        private static PredictionEngine<ModelInput, ModelOutput> CreatePredictEngine()
        {
            var mlContext = new MLContext();
            ITransformer mlModel = mlContext.Model.Load(MLNetModelPath, out var _);
            return mlContext.Model.CreatePredictionEngine<ModelInput, ModelOutput>(mlModel);
        }

        /// <summary>
        /// Use this method to predict on <see cref="ModelInput"/>.
        /// </summary>
        /// <param name="input">model input.</param>
        /// <returns><seealso cref=" ModelOutput"/></returns>
        public static ModelOutput Predict(ModelInput input)
        {
            var predEngine = PredictEngine.Value;
            return predEngine.Predict(input);
        }

    }
}
