using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPedidos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void salirusuario_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Default.aspx", false);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
        Session["idpedidoselec"] = GridView1.SelectedRow.Cells[1].Text;
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.DataBind();
    }
}