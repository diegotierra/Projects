<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Perfil" %>

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
            <asp:Label ID="error" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    <h2 style="text-align:center">Información Personal</h2>
    <br />
    <div>
        <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblLogin" runat="server" Text="" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtLogin" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblTel" runat="server" Text="" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtTel" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPob" runat="server" Text="" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtPob" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblDireccion" runat="server" Text="" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtDireccion" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblCp" runat="server" Text="" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtCp" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblDni" runat="server" Text="" CssClass="parte"></asp:Label>
            <asp:TextBox ID="txtDni" runat="server" Enabled="False"></asp:TextBox>
        </div>
        <br />
        <div style="text-align:center">
        <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-primary" OnClick="btnModificar_Click" />
        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" OnClick="btnActualizar_Click" Enabled="False" />
        </div>
      </div>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
</asp:Content>

