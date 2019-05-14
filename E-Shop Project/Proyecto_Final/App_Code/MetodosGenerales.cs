using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de MetodosGenerales
/// </summary>
namespace Metodosgenerales
{
    public class MetodosGenerales
    {
        public MetodosGenerales()
        {
            //
            // TODO: Agregar aquí la lógica del constructor
            //
        }

        public static string FnComaPorPunto(decimal Numero)
        {
            string StrNumero = Convert.ToString(Numero);
            string stNumeroConPunto = String.Format("{0}", StrNumero.Replace(',', '.'));
            return (stNumeroConPunto);
        }

    }
}