<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminRegistro.aspx.cs" Inherits="AdminRegistro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="salir" Runat="Server">
    <asp:Button ID="salirusuario" runat="server" CssClass="btn btn-primary" Text="Salir" OnClick="salirusuario_Click"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" Runat="Server">
    <asp:Label ID="lblMensajes" runat="server" Text=""></asp:Label> 
    <h2 class="alert text-center">Registro de Administradores</h2>
    <br />
    <div class="container-fluid" style="margin-left:20%;">         
        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblNombre" runat="server"  Text="Nombre"></asp:Label></div>        
            <input type="text" runat="server" Id="txtNombreUsu" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblDirCli" runat="server" Text="Dirección"></asp:Label></div>        
            <input type="text" runat="server" Id="txtDirCli" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblLogin" runat="server" Text="Nombre de Usuario"></asp:Label></div>        
            <input type="text" runat="server" Id="txtLogin" required/>
        </div>
        
        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblPobCli" runat="server" Text="Población"></asp:Label></div>        
            <input type="text" runat="server" Id="txtPobCli" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblCpoCli" runat="server" Text="Código Postal"></asp:Label></div>        
            <input type="text" runat="server" Id="txtCpoCli" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblTelCli" runat="server" Text="Teléfono"></asp:Label></div>        
            <input type="tel" runat="server" Id="txtTelCli" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblCorCli" runat="server" Text="Correo Electrónico"></asp:Label></div>        
            <input type="email" runat="server" Id="txtCorCli" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblDniNif" runat="server" Text="DNI"></asp:Label></div>        
            <input type="text" runat="server" Id="txtDniNif" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblPassword1" runat="server" Text="Contraseña"></asp:Label></div>        
            <input type="password" runat="server" Id="txtPassword1" required/>
        </div>

        <div class="form-group">
            <div class="parte2"><asp:Label ID="lblPassword2" runat="server" Text="Introduzca nuevamente la Contraseña"></asp:Label></div>        
            <input type="password" runat="server" Id="txtPassword2" required/>
        </div>       
      </div>
        <div class="boton">
        <asp:Button ID="btnInsertar" CssClass="btn btn-primary" runat="server" Text="Registrarse" OnClick="btnInsertar_Click" />
        </div>
</asp:Content>

