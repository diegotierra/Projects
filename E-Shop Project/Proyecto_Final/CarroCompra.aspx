<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="CarroCompra.aspx.cs" Inherits="CarroCompra" %>

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
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Panel ID="Panel1" runat="server">
    <h1 style="text-align:center;">Tu Carrito de la Compra está vacío :(</h1><br />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
    <h1 style="text-align:center;">Articulos de tu carrito de la compra ;)</h1><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_pedido,id_producto" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="90%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" VerticalAlign="Middle" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="id_pedido" HeaderText="Order ID" ReadOnly="True" SortExpression="id_pedido">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="id_producto" HeaderText="Product ID" ReadOnly="True" SortExpression="id_producto">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="nombre_producto" HeaderText="Product Name" SortExpression="nombre_producto" ReadOnly="True">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="cantidad" HeaderText="Quantity" SortExpression="cantidad">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="precio" HeaderText="Prize" ReadOnly="True" SortExpression="precio" DataFormatString="{0:c}">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="descuento" DataFormatString="{0:c}" HeaderText="Discount" SortExpression="descuento" ReadOnly="True">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Precio con descuento" HeaderText="Prize with Discount" ReadOnly="True" SortExpression="Precio con descuento" DataFormatString="{0:c}" >
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="Primero" LastPageText="Último" NextPageText="Siguiente" PreviousPageText="Anterior" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <div style="text-align:right;margin-right:150px;">TOTAL: <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></div><br />
    <div class="text-center"><asp:Button CssClass="btn btn-success" ID="btnConfirmar" runat="server" Text="Confirm" OnClick="btnConfirmar_Click" /></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [Detalles] WHERE [id_pedido] = @id_pedido AND [id_producto] = @id_producto" SelectCommand="SELECT 
	dbo.[Detalles].id_pedido,
	dbo.[Detalles].id_producto,
	dbo.[Productos].nombre_producto,
	dbo.[Detalles].cantidad,
	dbo.[Detalles].precio,
	dbo.[Detalles].descuento,
	dbo.[Detalles].precio * dbo.[Detalles].cantidad *(1 - dbo.[Detalles].descuento / 100) as [Precio con descuento]
	FROM dbo.[Detalles] INNER JOIN dbo.Productos ON dbo.[Detalles].id_producto = dbo.Productos.id
WHERE ([id_pedido] = @id_pedido)" 
        UpdateCommand="UPDATE [Detalles] SET [cantidad] = @cantidad WHERE [id_pedido] = @id_pedido AND [id_producto] = @id_producto">
        <DeleteParameters>
            <asp:Parameter Name="id_pedido" Type="Int32" />
            <asp:Parameter Name="id_producto" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_pedido" SessionField="Id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cantidad" Type="Int32" />
            <asp:Parameter Name="id_pedido" Type="Int32" />
            <asp:Parameter Name="id_producto" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </asp:Panel>
    <br />
    <div class="text-center">
         <asp:Button ID="Button3" CssClass="btn btn-info" PostBackUrl="~/Default.aspx" Text="Home" runat="server"/>
    </div>
    <asp:Label ID="lblMensajes" runat="server" Text=""></asp:Label>
</asp:Content>

