using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
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

       
        string StrComandoSql2 = "SELECT nombre_producto,marca,precio,imagen,id" + " FROM Productos"
                                + " WHERE escaparate = 'True'";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql2, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {              
                while (reader.Read())
                {
                    Label1.Text += "<article>";
                    Label1.Text += "<a href='Detalles.aspx?idprod=" + Convert.ToString(reader.GetInt32(4)) + "' class='image featured'><img src='" + reader.GetString(3) +"' alt='Carrusel 1' /></a>";
                    Label1.Text += "<header>";
                    Label1.Text += "<h3><a href='Detalles.aspx?idprod=" + Convert.ToString(reader.GetInt32(4)) + "'>" + reader.GetString(0) + " - " + reader.GetString(1) + "</a></h3>";
                    Label1.Text += "</header>";
                    Label1.Text += "<p>" + string.Format("{0:C}", reader.GetValue(2)) + "</p>";
                    Label1.Text += "</article>";            
                }
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
            lblerror.Text = StrError;
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