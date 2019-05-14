using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Identificarse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";

        string StrComandoSql = "SELECT U.login_usuario, id_rol, id FROM Usuarios U INNER JOIN Clientes C ON U.login_usuario = C.login_usuario";

        StrComandoSql = StrComandoSql + " WHERE U.login_usuario='" + login1.UserName + "'";
        StrComandoSql = StrComandoSql + "AND contraseña='" + login1.Password + "';";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();

            if (reader.Read())
            {
                Session.Add("Nombre", reader.GetString(0));
                Session.Add("Rol", reader.GetString(1));
                Session.Add("Idcliente", reader.GetInt32(2));
                Session.Add("Id", "-1");
                e.Authenticated = true;
                reader.Close();
                comando.Dispose();
                conexion.Close();

                if (Convert.ToString(Session["Rol"]) == "administrador")
                    Response.Redirect("~/DefaultAdmin.aspx");
                if (Convert.ToString(Session["Rol"]) == "usuario")
                    Response.Redirect("~/Default.aspx");
            }
            else
            {
                e.Authenticated = false;
                reader.Close();
                comando.Dispose();
                conexion.Close();
            }
        }
        catch (SqlException ex)
        {
            string StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            lblError.Text = StrError;
            return;
        }
    }
}