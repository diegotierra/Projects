using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class CarroCompra : System.Web.UI.Page
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

        if (Convert.ToString(Session["Id"]) == "-1")
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
        else
        {
            Panel1.Visible = false;
            Panel2.Visible = true;

            decimal strTotal;
            string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                        Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                        + ";Integrated Security = True";

            string StrComandoSql = "SELECT SUM(dbo.[Detalles].precio * dbo.[Detalles].cantidad *(1 - dbo.[Detalles].descuento / 100))" + " FROM Detalles"
                                    + " WHERE id_pedido = " + Convert.ToInt32(Session["Id"]);

            try
            {
                SqlConnection conex = new SqlConnection(StrCadenaConexion);
                SqlCommand comand = new SqlCommand(StrComandoSql, conex);
                conex.Open();
                strTotal = Convert.ToDecimal(comand.ExecuteScalar());
                lblTotal.Text = Convert.ToString(strTotal);
                comand.Dispose();
                conex.Close();
                lblTotal.DataBind();
            }
            catch (SqlException ex)
            {
                string StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
                StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                lblMensajes.Text = StrError;
                return;
            }

        }
    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Default.aspx", false);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["Id"]) == "-1" || GridView1.SelectedRow.Cells[1].Text == "&nbsp;")
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
    }

    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";

        string strfecha = Convert.ToString(DateTime.Now);
        string strComandoSql_1 = "UPDATE Pedidos " + " SET confirmado ='" + strfecha + "' WHERE id = '" + Session["Id"] + "'";

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
            tran.Commit();

            Session["Id"] = "-1";

            Label1.Text = "<div class='alert alert-success' role='alert'>";
            Label1.Text = Label1.Text + "Tu pedido se ha confirmado correctamente";
            Label1.Text = Label1.Text + "</div>";
            Panel1.Visible = true;
            Panel2.Visible = false;
            GridView1.DataBind();

        }
        catch (SqlException ex)
        {
            tran.Rollback();
            string StrError = "<p>Se han producido errores </p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            lblMensajes.Text = StrError;
        }
        finally
        {
            conexion.Close();
        }
    }
}