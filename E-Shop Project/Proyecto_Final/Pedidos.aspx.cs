using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Pedidos : System.Web.UI.Page
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

        string StrComandoSql = "SELECT COUNT(id)" + " FROM Pedidos"
                                + " WHERE NOT confirmado ='*' AND id_cliente=" + Session["Idcliente"];

        string StrComandoSql1 = "SELECT COUNT(id)" + " FROM Pedidos"
                                 + " WHERE NOT cobrado ='*'AND id_cliente=" + Session["Idcliente"];

        string StrComandoSql2 = "SELECT COUNT(id)" + " FROM Pedidos"
                                 + " WHERE id_cliente=" + Session["Idcliente"];

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

                lblnumpedpag.Text = Convert.ToString(reader1.GetInt32(0));
            }
            reader1.Close();
            comando1.Dispose();
            conexion1.Close();

            if (reader2.HasRows)
            {
                reader2.Read();

                lblnumpedtotal.Text = Convert.ToString(reader2.GetInt32(0));
            }
            reader2.Close();
            comando2.Dispose();
            conexion2.Close();

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
        Session["Id"] = -1;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["idpedidoselec"] = GridView1.SelectedRow.Cells[1].Text;

        if (GridView1.SelectedRow.Cells[6].Text == "&nbsp;")
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

        // string strfecha = DateTime.Now.ToOADate();
        string strfecha = Convert.ToString(DateTime.Now);
        string strComandoSql_1 = "UPDATE Pedidos " + " SET confirmado='" + strfecha + "' WHERE id ='" + Convert.ToString(Session["idpedidoselec"]) + "'";

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
            Panel1.Visible = false;
            GridView1.DataBind();
            lblnumped.DataBind();
            lblnumpedpag.DataBind();
            lblnumpedtotal.DataBind();
        }
        catch (SqlException ex)
        {
            tran.Rollback();
            string StrError = "<p>Se han producido errores </p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            error.Text = StrError;
        }
        finally
        {
            conexion.Close();
        }
    }
}