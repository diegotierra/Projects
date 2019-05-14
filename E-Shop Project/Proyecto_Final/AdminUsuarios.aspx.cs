using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AdminUsuarios : System.Web.UI.Page
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
        Session["idlogin"] = GridView1.SelectedRow.Cells[3].Text;
        GridView1.DataBind();
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.DataBind();
    }
}