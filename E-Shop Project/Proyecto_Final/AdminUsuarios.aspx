<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminUsuarios.aspx.cs" Inherits="AdminUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="salir" Runat="Server">
    <asp:Button ID="salirusuario" runat="server" CssClass="btn btn-primary" Text="Salir" OnClick="salirusuario_Click"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" Runat="Server">
    <h2 class="alert text-center">Lista de Clientes</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="nombre_cliente" HeaderText="Nombre/Razón Social" SortExpression="nombre_cliente">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="login_usuario" HeaderText="Login Usuario" SortExpression="login_usuario">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="telefono" HeaderText="Teléfono" SortExpression="telefono">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="poblacion" HeaderText="Población" SortExpression="poblacion">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="codigo_postal" HeaderText="Código Postal" SortExpression="codigo_postal">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="dni_nif" HeaderText="DNI/NIF" SortExpression="dni_nif">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Clientes] WHERE [id] = @id" InsertCommand="INSERT INTO [Clientes] ([nombre_cliente], [login_usuario], [email], [telefono], [poblacion], [direccion], [codigo_postal], [dni_nif]) VALUES (@nombre_cliente, @login_usuario, @email, @telefono, @poblacion, @direccion, @codigo_postal, @dni_nif)" SelectCommand="SELECT * FROM [Clientes] ORDER BY [id]" UpdateCommand="UPDATE [Clientes] SET [nombre_cliente] = @nombre_cliente, [login_usuario] = @login_usuario, [email] = @email, [telefono] = @telefono, [poblacion] = @poblacion, [direccion] = @direccion, [codigo_postal] = @codigo_postal, [dni_nif] = @dni_nif WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre_cliente" Type="String" />
            <asp:Parameter Name="login_usuario" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="poblacion" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="codigo_postal" Type="Int32" />
            <asp:Parameter Name="dni_nif" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre_cliente" Type="String" />
            <asp:Parameter Name="login_usuario" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="poblacion" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="codigo_postal" Type="Int32" />
            <asp:Parameter Name="dni_nif" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Usuarios] WHERE ([login_usuario] = @login_usuario) ORDER BY [login_usuario]" DeleteCommand="DELETE FROM [Usuarios] WHERE [login_usuario] = @login_usuario" InsertCommand="INSERT INTO [Usuarios] ([login_usuario], [contraseña], [id_rol]) VALUES (@login_usuario, @contraseña, @id_rol)" UpdateCommand="UPDATE [Usuarios] SET [contraseña] = @contraseña, [id_rol] = @id_rol WHERE [login_usuario] = @login_usuario">
        <DeleteParameters>
            <asp:Parameter Name="login_usuario" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="login_usuario" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="id_rol" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="login_usuario" SessionField="idlogin" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="id_rol" Type="String" />
            <asp:Parameter Name="login_usuario" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server"><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="login_usuario" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="40%" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="login_usuario" HeaderText="Login Usuario" ReadOnly="True" SortExpression="login_usuario">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="contraseña" HeaderText="Contraseña" SortExpression="contraseña">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="id_rol" HeaderText="Rol" SortExpression="id_rol">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView></asp:Panel>
</asp:Content>

