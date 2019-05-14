using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Registrarse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsertar_Click(object sender, EventArgs e)
    {
        lblMensajes.Text = "";
        if (txtPassword1.Value == txtPassword2.Value)
        {
            string strNombre, strPassword, strRol;
            string strDirCli, strPobCli, strCpoCli, strTelCli, strCorCli, strLogin, strdninif;
            strNombre = txtNombreUsu.Value;
            strPassword = txtPassword1.Value;
            strRol = "usuario";
            strDirCli = txtDirCli.Value;
            strLogin = txtLogin.Value;
            strPobCli = txtPobCli.Value;
            strdninif = txtDniNif.Value;
            strCpoCli = txtCpoCli.Value;
            strTelCli = txtTelCli.Value;
            strCorCli = txtCorCli.Value;
            string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";

            string strComandoSql_1 = "INSERT Usuarios " + "(login_usuario,contraseña,id_rol) VALUES (" + "'" + strLogin + "','"
                                     + strPassword + "','" + strRol + "');";

            string strComandoSql_2 = "INSERT Clientes " + "(nombre_cliente,login_usuario,email,telefono,poblacion,direccion,codigo_postal,dni_nif) VALUES (" + "'" +
                                    strNombre + "','" + strLogin + "','" + strCorCli + "','" + strTelCli + "','" + strPobCli + "','" +
                                    strDirCli + "','" + strCpoCli + "','" + strdninif + "');";

            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            conexion.Open();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            SqlTransaction tran = conexion.BeginTransaction();
            comando.Transaction = tran;

            try
            {
                comando.CommandText = strComandoSql_1;
                comando.ExecuteNonQuery();
                comando.CommandText = strComandoSql_2;
                comando.ExecuteNonQuery();
                tran.Commit();
                lblMensajes.Text = "Usuario registrado correctamente";

            }
            catch (SqlException ex)
            {
                tran.Rollback();
                string StrError = "<p>Se han producido errores durante el registro</p>";
                StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                lblMensajes.Text = StrError;
            }
            finally
            {
                conexion.Close();
            }
        }
        else
        {
            lblMensajes.Text = "Se ha producido un error. Valores de contraseña no coincidentes";
        }
    }
}