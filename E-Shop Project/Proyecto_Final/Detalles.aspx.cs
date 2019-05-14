using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Metodosgenerales;

public partial class Detalles : System.Web.UI.Page
{
    public string stridpedido, strcantidad, strfecha, strprecio, strdescuento, stridcliente, idproducto;

    protected void Page_Load(object sender, EventArgs e)
    {

        idproducto = Request.QueryString["idprod"];
        if (!IsPostBack)
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
            string StrComandoSql = "SELECT nombre_producto,marca,precio,imagen,talla,color,descripcion" + " FROM Productos"
                                    + " WHERE id = '" + idproducto + "'";

            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();

                    Label1.Text += "<div class='col'>";
                    Label1.Text = Label1.Text + "<br/><br/>";
                    Label1.Text += "<div class='col-4 my-4'>";
                    Label1.Text += "<img class='card-img-top' src='" + reader.GetString(3) + "' alt=''>";
                    Label1.Text += "</div>";
                    Label1.Text += "<div class='card-body'>";
                    Label1.Text += "<h3 class='card-title'>" + reader.GetString(0) + " <br/> " + reader.GetString(1) + "</h3>";
                    Label1.Text += "<h4>" + string.Format("{0:C}", reader.GetValue(2)) + "</h4>";
                    Label1.Text += "<p class='card-text'>" + reader.GetString(6) + "</p>";
                    Label1.Text += "<p class='card-text'>Color: " + reader.GetString(5) + "</p>";
                    Label1.Text += "<p class='card-text'>Talla: " + reader.GetString(4) + "</p>";
                    Label1.Text += "<span class='text-warning'>&#9733; &#9733; &#9733; &#9733; &#9734;</span>";
                    Label1.Text += "4.0 Estrellas";
                    Label1.Text += "<br/><br/>";
                    Label1.Text += "</div>";

                    Label3.Text += "<div class='card card-outline-secondary my-4'>";
                    Label3.Text += "<div class='card-header'>";
                    Label3.Text += "Opiniones del Producto";
                    Label3.Text += "</div>";
                    Label3.Text += "<div class='card-body'>";
                    Label3.Text += "<p>Me encanta, la calidad y el precio son muy buenos.</p>";
                    Label3.Text += "<small class='text-muted'>Publicado por Laura el 29/01/18</small>";
                    Label3.Text += "<hr>";
                    Label3.Text += "<p>El envio es muy rapido y la atención es excelente.</p>";
                    Label3.Text += "<small class='text-muted'>Publicado por Manu el 06/11/17</small>";
                    Label3.Text += "<hr>";
                    Label3.Text += "<a href='' class='btn btn-success'>Déjanos tu Opinión</a>";
                    Label3.Text += "</div>";
                    Label3.Text += "</div>";
                    Label3.Text += "</div>";
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["Rol"]) == "" && Convert.ToString(Session["Nombre"]) == "")
        {
            Response.Redirect("~/Identificarse.aspx");
        }
        else
        {
            string StrCadenaConexion = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=" +
                                    Server.MapPath("~/App_Data/Proyecto_DB.mdf")
                                    + ";Integrated Security = True";

            string StrComandoSql = "SELECT precio" + " FROM Productos"
                                    + " WHERE id = '" + idproducto + "'";

            SqlConnection conex = new SqlConnection(StrCadenaConexion);
            SqlCommand comand = new SqlCommand(StrComandoSql, conex);
            conex.Open();
            SqlDataReader reader = comand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                strprecio = MetodosGenerales.FnComaPorPunto(reader.GetDecimal(0));
            }

            reader.Close();
            comand.Dispose();
            conex.Close();

            strfecha = Convert.ToString(DateTime.Now);
            strdescuento = "0";
            strcantidad = "1";
            stridcliente = Convert.ToString(Session["Idcliente"]);

            string ultimopedido = "SELECT MAX(id) FROM Pedidos;";

            SqlConnection conexion1 = new SqlConnection(StrCadenaConexion);
            SqlCommand comando1 = new SqlCommand(ultimopedido, conexion1);
            conexion1.Open();
            Int32 res = Convert.ToInt32(comando1.ExecuteScalar());

            if (res == 0)
            {
                stridpedido = Convert.ToString(1);
            }
            else
            {
                stridpedido = Convert.ToString(res + 1);
            }

            if (Convert.ToString(Session["Id"]) == "-1")
            {

                string strComandoSql_1 = "INSERT Pedidos " + "(id,fecha,id_cliente) VALUES (" + stridpedido + ",'" + strfecha + "'," + stridcliente + ");";

                string strComandoSql_2 = "INSERT Detalles " + "(id_pedido,id_producto,cantidad,precio,descuento) VALUES (" + stridpedido + "," + idproducto + "," + strcantidad + "," + strprecio + ",'" + strdescuento + "');";

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
                    Session["Id"] = stridpedido;


                    Label2.Text = "<div class='alert alert-success mt-5' role='alert'>";
                    Label2.Text = Label2.Text + "El artículo se ha añadido a tu carrito de la compra";
                    Label2.Text = Label2.Text + "</div>";


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

            else
            {
                stridpedido = Convert.ToString(Convert.ToInt32(stridpedido) - 1);

                string strComandoSql_1 = "INSERT Detalles " + "(id_pedido,id_producto,cantidad,precio,descuento) VALUES (" + stridpedido + "," + idproducto + "," + strcantidad + "," + strprecio + ",'" + strdescuento + "');";

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

                    Label2.Text = "<div class='alert alert-success' role='alert'>";
                    Label2.Text = Label2.Text + "El artículo se ha añadido a tu carrito de la compra";
                    Label2.Text = Label2.Text + "</div>";
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
    }


    protected void btnSalir_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Default.aspx", false);
    }
}