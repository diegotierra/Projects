using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Perfil : System.Web.UI.Page
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


        if (!IsPostBack)
        {
            string StrError;
            string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                        Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                        + ";Integrated Security = True";
            string StrComandoSql = "SELECT nombre_cliente,login_usuario,email,telefono,poblacion,direccion,codigo_postal,dni_nif" + " FROM Clientes"
                                    + " WHERE id = '" + Session["Idcliente"] + "'";

            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();

                    lblNombre.Text = "<b>Nombre/Razón Social: </b>";
                    txtNombre.Text = reader.GetString(0);
                    lblLogin.Text = "<b>Nombre de Usuario: </b>";
                    txtLogin.Text = reader.GetString(1);
                    lblEmail.Text = "<b>Email: </b>";
                    txtEmail.Text = reader.GetString(2);
                    lblTel.Text = "<b>Teléfono: </b>";
                    txtTel.Text = reader.GetString(3);
                    lblPob.Text = "<b>Población: </b>";
                    txtPob.Text = reader.GetString(4);
                    lblDireccion.Text = "<b>Dirección: </b>";
                    txtDireccion.Text = reader.GetString(5);
                    lblCp.Text = "<b>Código Postal: </b>";
                    txtCp.Text = Convert.ToString(reader.GetInt32(6));
                    lblDni.Text = "<b>DNI/NIF: </b>";
                    txtDni.Text = reader.GetString(7);
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
    }

    protected void btnActualizar_Click(object sender, EventArgs e)
    {
        error.Text = "";
        String strnombre, strlogin, stremail, strtelefono, strpoblacion, strdireccion, strcp, strdni;

        strnombre = txtNombre.Text;
        strlogin = txtLogin.Text;
        stremail = txtEmail.Text;
        strtelefono = txtTel.Text;
        strpoblacion = txtPob.Text;
        strdireccion = txtDireccion.Text;
        strcp = txtCp.Text;
        strdni = txtDni.Text;

        string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";

        string StrComandoSql = "UPDATE Clientes " + "SET nombre_cliente = " + "'" + strnombre + "'" + ",login_usuario = '" + strlogin + "'" + ",email = " + "'" + stremail + "'" + ",telefono = '" + strtelefono + "'" + ",poblacion = " + "'" + strpoblacion + "'" + ",direccion = " + "'" + strdireccion + "'" + ",codigo_postal = " + Convert.ToInt32(strcp) + ",dni_nif = " + "'" + strdni + "'" +
                               " WHERE id = '" + Session["Idcliente"] + "'";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            comando.Connection.Open();
            Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
            comando.Connection.Close();
            if (inRegistrosAfectados == 1)
                Label1.Text = "<div class='alert alert-success' role='alert'>Tus datos se han actualizado correctamente!</div>";
            else
                Label1.Text = "<div class='alert alert-danger' role='alert'>Tus datos no se han actualizado correctamente!</div>";


            txtNombre.Enabled = false;
            txtLogin.Enabled = false;
            txtEmail.Enabled = false;
            txtTel.Enabled = false;
            txtPob.Enabled = false;
            txtDireccion.Enabled = false;
            txtCp.Enabled = false;
            txtDni.Enabled = false;
            btnActualizar.Enabled = false;
            btnModificar.Enabled = true;

        }
        catch (SqlException ex)
        {
            string StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            error.Text = StrError + StrComandoSql;
            return;
        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        txtNombre.Enabled = true;
        txtLogin.Enabled = true;
        txtEmail.Enabled = true;
        txtTel.Enabled = true;
        txtPob.Enabled = true;
        txtDireccion.Enabled = true;
        txtCp.Enabled = true;
        txtDni.Enabled = true;
        btnActualizar.Enabled = true;
        btnModificar.Enabled = false;
    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Default.aspx", false);
    }
}