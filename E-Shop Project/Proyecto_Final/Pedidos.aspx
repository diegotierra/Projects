<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Pedidos.aspx.cs" Inherits="Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="infouser" Runat="Server">
    <asp:Label ID="lblUserInfo" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nombrerol" Runat="Server">
    <asp:Label ID="lblRolNombreUsuario" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="signout" Runat="Server">
    <asp:Button ID="btnSalir" runat="server" Text="Exit" Visible="False"  OnClick="btnSalir_Click" CssClass="newStyle7" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contenido" Runat="Server">
            <div class="row m-auto" style="margin-top:10px";>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="mr-5"><asp:Label ID="lblnumped" runat="server" Text=""></asp:Label> Pedidos Confirmados!</div>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="mr-5"><asp:Label ID="lblnumpedpag" runat="server" Text=""></asp:Label> Pedidos Pagados!</div>
            </div>
          </div>
        </div>
         <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="mr-5"><asp:Label ID="lblnumpedtotal" runat="server" Text=""></asp:Label> Pedidos Realizados!</div>
            </div>
          </div>
        </div>
      </div>

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <h1 style="text-align:center;">Tus pedidos realizados</h1><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="80%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="Id Pedido" ReadOnly="True" SortExpression="id">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="Fecha" SortExpression="fecha">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="id_cliente" HeaderText="Id Cliente" SortExpression="id_cliente">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="preparado" DataFormatString="{0:d}" HeaderText="Preparado" SortExpression="preparado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="cobrado" DataFormatString="{0:d}" HeaderText="Cobrado" SortExpression="cobrado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="confirmado" DataFormatString="{0:d}" HeaderText="Confirmado" SortExpression="confirmado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="enviado" DataFormatString="{0:d}" HeaderText="Enviado" SortExpression="enviado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="recibido" DataFormatString="{0:d}" HeaderText="Recibido" SortExpression="recibido">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="Primero" LastPageText="Último" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br /><br />
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_pedido,id_producto" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="80%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_pedido" HeaderText="Id Pedido" ReadOnly="True" SortExpression="id_pedido">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="id_producto" HeaderText="Id Producto" ReadOnly="True" SortExpression="id_producto">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="nombre_producto" HeaderText="Nombre" SortExpression="nombre_producto">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="precio" DataFormatString="{0:c}" HeaderText="Precio" SortExpression="precio">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="descuento" DataFormatString="{0:c}" HeaderText="Descuento (%)" SortExpression="descuento">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Precio con descuento" DataFormatString="{0:c}" HeaderText="Precio con descuento" ReadOnly="True" SortExpression="Precio con descuento">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="Primero" LastPageText="Último" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <asp:Panel ID="Panel1" runat="server" Visible="False"><asp:Button ID="btnConfirmar" style="margin-left:50%" runat="server" CssClass="btn btn-success" Text="Confirm" OnClick="btnConfirmar_Click"/></asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 
	dbo.[Detalles].id_pedido,
	dbo.[Detalles].id_producto,
	dbo.[Productos].nombre_producto,
	dbo.[Detalles].cantidad,
	dbo.[Detalles].precio,
	dbo.[Detalles].descuento,
	dbo.[Detalles].precio * dbo.[Detalles].cantidad *(1 - dbo.[Detalles].descuento / 100) as [Precio con descuento]
	FROM dbo.[Detalles] INNER JOIN dbo.Productos ON dbo.[Detalles].id_producto = dbo.Productos.id
WHERE ([id_pedido] = @id_pedido)">
        <SelectParameters>
            <asp:SessionParameter Name="id_pedido" SessionField="idpedidoselec" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Pedidos] WHERE ([id_cliente] = @id_cliente)">
        <SelectParameters>
            <asp:SessionParameter Name="id_cliente" SessionField="Idcliente" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="error" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <div class="text-center">
         <asp:Button ID="Button3" CssClass="btn btn-info" PostBackUrl="~/Default.aspx" Text="Home" runat="server"/>
    </div>
</asp:Content>



