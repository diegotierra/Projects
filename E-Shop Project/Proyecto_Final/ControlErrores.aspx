<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="ControlErrores.aspx.cs" Inherits="ControlErrores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="infouser" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nombrerol" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="signout" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contenido" Runat="Server">
         <div style="text-align:center; font-family: Arial, Helvetica, sans-serif;">
        <h3>Aplicación Web OdisseyD. Error en tiempo de ejecución</h3>
    </div>
    <div style="border:1px solid black;margin-right:400px;margin-left:400px">
        <br />
        Error ASP.NET:
        <br />
        <asp:Label ID="lblErrorASP" runat="server" Text="[lblErrorASP]" ForeColor="Red"></asp:Label>
        <br />
        <br />
        Error ADO.NET:
        <br />
        <asp:Label ID="lblErrorADO" runat="server" Text="[lblErrorADO]" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>

