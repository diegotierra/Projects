using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Galeria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["Rol"]) == "" && Convert.ToString(Session["Nombre"]) == "")
        {
            lblUserInfo.Text += "<a class='nav-link' href='Identificarse.aspx'> Sign In </a>";
            lblUserInfo.Text += "<a class='nav-link' href='Registrarse.aspx'> Sign Up </a>";
        }
        else
        {
            lblUserInfo.Text += "<a class='nav-link' href='Perfil.aspx'> My Account </a>";
            lblUserInfo.Text += "<a class='nav-link' href='Pedidos.aspx'> My Orders </a>";

            lblRolNombreUsuario.Text = "Hi " + Convert.ToString(Session["Nombre"]) + "! - Rol: " + Convert.ToString(Session["Rol"]);
            btnSalir.Visible = true;
        }



        string categoria = Request.QueryString["cat"];
        string StrError;
        string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";
        string StrComandoSql = "SELECT nombre_producto,marca,precio,imagen,id" + " FROM Productos P INNER JOIN Tipo_Producto T ON P.tipo_producto = T.tipo_producto"
                                + " WHERE P.tipo_producto = '" + categoria + "'";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                Label1.Text = "<h2 style='text-align:center;'>" + categoria + "..." + "</h2>";
                Label1.Text += "</br>";
                Label1.Text += "<div class='row'>";
                while (reader.Read())
                {
                    Label1.Text += "<article class='4u 12u(mobile) special'>";
                    Label1.Text += "<a href='Detalles.aspx?idprod=" + Convert.ToString(reader.GetInt32(4)) + "' class='image featured'><img src='" + reader.GetString(3) + "' alt='' /></a>";
                    Label1.Text += "<header>";
                    Label1.Text += "<h3><a href='Detalles.aspx?idprod=" + Convert.ToString(reader.GetInt32(4)) + "'>" + reader.GetString(0) + " - " + reader.GetString(1) + "</a></h3>";
                    Label1.Text += "</header>";
                    Label1.Text += "<div style='text-align:center'>";
                    Label1.Text += "<h4>" + string.Format("{0:C}", reader.GetValue(2)) + "</h4>";                   
                    Label1.Text += "</div>";
                    Label1.Text += "</article>";
                }
                Label1.Text = Label1.Text + "</div>";
            }
            reader.Close();
            comando.Dispose();
            conexion.Close();
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

    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Default.aspx", false);
    }
}