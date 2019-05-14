<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="Detalles.aspx.cs" Inherits="Detalles" %>

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
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    <asp:Label ID="error" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary text-center" Text="Añadir" OnClick="Button1_Click" />
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
</asp:Content>

