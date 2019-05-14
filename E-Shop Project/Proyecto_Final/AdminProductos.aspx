<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminProductos.aspx.cs" Inherits="AdminProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="salir" Runat="Server">
    <asp:Button ID="salirusuario" runat="server" CssClass="btn btn-primary" Text="Salir" OnClick="salirusuario_Click"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" Runat="Server">
    <h2 class="alert text-center">Lista de Productos</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" SortExpression="id">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="tipo_producto" HeaderText="Tipo Producto" SortExpression="tipo_producto">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="stock" HeaderText="Stock" SortExpression="stock">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="nombre_producto" HeaderText="Nombre Producto" SortExpression="nombre_producto">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="talla" HeaderText="Talla" SortExpression="talla">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="marca" HeaderText="Marca" SortExpression="marca">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="precio" DataFormatString="{0:c}" HeaderText="Precio" SortExpression="precio">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="escaparate" HeaderText="Escaparate" SortExpression="escaparate">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="imagen" HeaderText="Imagen" SortExpression="imagen">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Productos] WHERE [id] = @id" InsertCommand="INSERT INTO [Productos] ([id], [tipo_producto], [stock], [descripcion], [nombre_producto], [talla], [color], [marca], [precio], [escaparate], [imagen]) VALUES (@id, @tipo_producto, @stock, @descripcion, @nombre_producto, @talla, @color, @marca, @precio, @escaparate, @imagen)" SelectCommand="SELECT * FROM [Productos] ORDER BY [id]" UpdateCommand="UPDATE [Productos] SET [tipo_producto] = @tipo_producto, [stock] = @stock, [descripcion] = @descripcion, [nombre_producto] = @nombre_producto, [talla] = @talla, [color] = @color, [marca] = @marca, [precio] = @precio, [escaparate] = @escaparate, [imagen] = @imagen WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="tipo_producto" Type="String" />
            <asp:Parameter Name="stock" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="nombre_producto" Type="String" />
            <asp:Parameter Name="talla" Type="String" />
            <asp:Parameter Name="color" Type="String" />
            <asp:Parameter Name="marca" Type="String" />
            <asp:Parameter Name="precio" Type="Decimal" />
            <asp:Parameter Name="escaparate" Type="Boolean" />
            <asp:Parameter Name="imagen" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tipo_producto" Type="String" />
            <asp:Parameter Name="stock" Type="Int32" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="nombre_producto" Type="String" />
            <asp:Parameter Name="talla" Type="String" />
            <asp:Parameter Name="color" Type="String" />
            <asp:Parameter Name="marca" Type="String" />
            <asp:Parameter Name="precio" Type="Decimal" />
            <asp:Parameter Name="escaparate" Type="Boolean" />
            <asp:Parameter Name="imagen" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

