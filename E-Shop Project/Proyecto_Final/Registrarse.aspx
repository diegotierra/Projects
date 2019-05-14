<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrarse.aspx.cs" Inherits="Registrarse" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>OdysseyD</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="icon" type="image/png" href="Templates/Login/images/icons/favicon.ico"/>

	<link rel="stylesheet" type="text/css" href="Templates/Login/vendor/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="Templates/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="Templates/Login/vendor/animate/animate.css">
	
	<link rel="stylesheet" type="text/css" href="Templates/Login/vendor/css-hamburgers/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="Templates/Login/vendor/select2/select2.min.css">

	<link rel="stylesheet" type="text/css" href="Templates/Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="Templates/Login/css/main.css">
    <style>
        .loginform{
            text-align:center;
        }
    </style>

</head>
<body>   
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
					<span class="login100-form-title">
						Create New Account
					</span>                 
                    <form class="login100-form validate-form" runat="server">	                
                    <div style="text-align:center; width: 750px;">
					<asp:Label ID="lblMensajes" runat="server" Text=""></asp:Label>       
                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblNombre" runat="server"  Text="Nombre o Razón Social"></asp:Label></div>        
                        <input type="text" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtNombreUsu" required/>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblDirCli" runat="server" Text="Dirección"></asp:Label></div>        
                        <input type="text" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtDirCli" required/>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblLogin" runat="server" Text="Nombre de Usuario"></asp:Label></div>        
                        <input type="text" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtLogin" required/>
                    </div>
        
                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblPobCli" runat="server" Text="Población"></asp:Label></div>        
                        <input type="text" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtPobCli" required/>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblCpoCli" runat="server" Text="Código Postal"></asp:Label></div>        
                        <input type="text" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtCpoCli" required/>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblTelCli" runat="server" Text="Teléfono"></asp:Label></div>        
                        <input type="tel" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtTelCli" required/>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblCorCli" runat="server" Text="Correo Electrónico"></asp:Label></div>        
                        <input type="email" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtCorCli" required/>&nbsp;
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblDniNif" runat="server" Text="DNI o NIF"></asp:Label></div>        
                        <input type="text" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtDniNif" required/>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblPassword1" runat="server" Text="Contraseña"></asp:Label></div>        
                        <input type="password" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtPassword1" required/>
                    </div>

                    <div class="wrap-input100 validate-input">
                        <div class="parte2"><asp:Label ID="lblPassword2" runat="server" Text="Introduzca nuevamente la Contraseña"></asp:Label></div>        
                        <input type="password" style="background-color:#d3d3d3;opacity:0.8;border-radius: 15px 15px 15px 15px" runat="server" Id="txtPassword2" required/>
                    </div>                       
                        <br />
                    <div>
                    <asp:Button ID="btnInsertar" CssClass="btn-success align-middle" runat="server" Text="Registrarse" OnClick="btnInsertar_Click" />
                    </div>
                    <div class="text-center p-t-136">
						<a class="txt2" href="Identificarse.aspx">
							Sign In
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
                        <br />
                        <a class="txt2" href="Default.aspx">
							Home
							<i class="fa fa-long-arrow-left m-l-5" aria-hidden="true"></i>
						</a>
					</div>
			        </div>  
                    </div>
            </div>
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
	        </form>
		</div>
	</div>	   
	<script src="Templates/Login/vendor/jquery/jquery-3.2.1.min.js"></script>

	<script src="Templates/Login/vendor/bootstrap/js/popper.js"></script>
	<script src="Templates/Login/vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="Templates/Login/vendor/select2/select2.min.js"></script>

	<script src="Templates/Login/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script src="js/main.js"></script>

</body>
</html>

