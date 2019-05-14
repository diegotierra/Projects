using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class DefaultAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string StrError;
        string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";
        string StrComandoSql = "SELECT COUNT(id)" + " FROM Pedidos"
                                + " WHERE NOT confirmado ='*'";

        string StrComandoSql1 = "SELECT COUNT(id)" + " FROM Productos";

        string StrComandoSql2 = "SELECT COUNT(login_usuario)" + " FROM Usuarios"
                                + " WHERE NOT id_rol ='administrador'";

        string StrComandoSql3 = "SELECT COUNT(id)" + " FROM Pedidos"
                                + " WHERE NOT cobrado ='*'";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();

            SqlConnection conexion1 = new SqlConnection(StrCadenaConexion);
            SqlCommand comando1 = new SqlCommand(StrComandoSql1, conexion1);
            conexion1.Open();
            SqlDataReader reader1 = comando1.ExecuteReader();

            SqlConnection conexion2 = new SqlConnection(StrCadenaConexion);
            SqlCommand comando2 = new SqlCommand(StrComandoSql2, conexion2);
            conexion2.Open();
            SqlDataReader reader2 = comando2.ExecuteReader();

            SqlConnection conexion3 = new SqlConnection(StrCadenaConexion);
            SqlCommand comando3 = new SqlCommand(StrComandoSql3, conexion3);
            conexion3.Open();
            SqlDataReader reader3 = comando3.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Read();

                lblnumped.Text = Convert.ToString(reader.GetInt32(0));
            }
            reader.Close();
            comando.Dispose();
            conexion.Close();

            if (reader1.HasRows)
            {
                reader1.Read();

                lblnumprod.Text = Convert.ToString(reader1.GetInt32(0));
            }
            reader1.Close();
            comando1.Dispose();
            conexion1.Close();

            if (reader2.HasRows)
            {
                reader2.Read();

                lblnumcli.Text = Convert.ToString(reader2.GetInt32(0));
            }
            reader2.Close();
            comando2.Dispose();
            conexion2.Close();

            if (reader3.HasRows)
            {
                reader3.Read();

                lblnumpedpag.Text = Convert.ToString(reader3.GetInt32(0));
            }
            reader3.Close();
            comando3.Dispose();
            conexion3.Close();
        }
        catch (SqlException ex)
        {
            StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            error.Text = StrError;
            return;
        }
    }

    protected void salirusuario_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Default.aspx", false);
    }
}