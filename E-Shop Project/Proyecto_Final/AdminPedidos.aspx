<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminPedidos.aspx.cs" Inherits="AdminPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="salir" Runat="Server">
    <asp:Button ID="salirusuario" runat="server" CssClass="btn btn-primary" Text="Salir" OnClick="salirusuario_Click"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" Runat="Server">
    <h2 class="alert text-center">Lista de Pedidos</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" SortExpression="id">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="id_cliente" HeaderText="Id Cliente" SortExpression="id_cliente">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="preparado" HeaderText="Preparado" SortExpression="preparado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="cobrado" HeaderText="Cobrado" SortExpression="cobrado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="confirmado" HeaderText="Confirmado" SortExpression="confirmado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="enviado" HeaderText="Enviado" SortExpression="enviado">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="recibido" HeaderText="Recibido" SortExpression="recibido">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Pedidos] WHERE [id] = @id" InsertCommand="INSERT INTO [Pedidos] ([id], [fecha], [id_cliente], [preparado], [cobrado], [confirmado], [enviado], [recibido]) VALUES (@id, @fecha, @id_cliente, @preparado, @cobrado, @confirmado, @enviado, @recibido)" SelectCommand="SELECT * FROM [Pedidos] ORDER BY [id]" UpdateCommand="UPDATE [Pedidos] SET [fecha] = @fecha, [id_cliente] = @id_cliente, [preparado] = @preparado, [cobrado] = @cobrado, [confirmado] = @confirmado, [enviado] = @enviado, [recibido] = @recibido WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="fecha" Type="String" />
            <asp:Parameter Name="id_cliente" Type="Int32" />
            <asp:Parameter Name="preparado" Type="String" />
            <asp:Parameter Name="cobrado" Type="String" />
            <asp:Parameter Name="confirmado" Type="String" />
            <asp:Parameter Name="enviado" Type="String" />
            <asp:Parameter Name="recibido" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="fecha" Type="String" />
            <asp:Parameter Name="id_cliente" Type="Int32" />
            <asp:Parameter Name="preparado" Type="String" />
            <asp:Parameter Name="cobrado" Type="String" />
            <asp:Parameter Name="confirmado" Type="String" />
            <asp:Parameter Name="enviado" Type="String" />
            <asp:Parameter Name="recibido" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Detalles] WHERE [id_pedido] = @id_pedido AND [id_producto] = @id_producto" InsertCommand="INSERT INTO [Detalles] ([id_pedido], [id_producto], [cantidad], [precio], [descuento]) VALUES (@id_pedido, @id_producto, @cantidad, @precio, @descuento)" SelectCommand="SELECT * FROM [Detalles] WHERE ([id_pedido] = @id_pedido) ORDER BY [id_producto]" UpdateCommand="UPDATE [Detalles] SET [cantidad] = @cantidad, [precio] = @precio, [descuento] = @descuento WHERE [id_pedido] = @id_pedido AND [id_producto] = @id_producto">
        <DeleteParameters>
            <asp:Parameter Name="id_pedido" Type="Int32" />
            <asp:Parameter Name="id_producto" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_pedido" Type="Int32" />
            <asp:Parameter Name="id_producto" Type="Int32" />
            <asp:Parameter Name="cantidad" Type="Int32" />
            <asp:Parameter Name="precio" Type="Decimal" />
            <asp:Parameter Name="descuento" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id_pedido" SessionField="idpedidoselec" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="cantidad" Type="Int32" />
            <asp:Parameter Name="precio" Type="Decimal" />
            <asp:Parameter Name="descuento" Type="Decimal" />
            <asp:Parameter Name="id_pedido" Type="Int32" />
            <asp:Parameter Name="id_producto" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_pedido,id_producto" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="80%" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id_pedido" HeaderText="Id Pedido" ReadOnly="True" SortExpression="id_pedido">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="id_producto" HeaderText="Id Producto" ReadOnly="True" SortExpression="id_producto">
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
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="Primero" LastPageText="Último" Mode="NumericFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>

