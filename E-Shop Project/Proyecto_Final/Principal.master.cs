using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Principal : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string StrError;
        string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";
        string StrComandoSql = "SELECT tipo_producto" + " FROM Tipo_Producto";

        if (!IsPostBack)
        {
            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lblCategorias.Text += "<a href = 'Galeria.aspx?cat=" + reader.GetString(0) + "' class='list-group-item list-group-item-action'>" + reader.GetString(0) + "</a>";
                    }
                }
                reader.Close();
                comando.Dispose();
                conexion.Close();
            }
            catch (Exception ex)
            {
                StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
                StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                lblerror.Text = StrError;
                return;
            }
        }
    }
}
