<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Identificarse.aspx.cs" Inherits="Identificarse" %>

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
				<div style="margin:auto" class="js-tilt" data-tilt>
					<img src="Templates/Login/images/img-01.png" alt="IMG">
				</div>
                <br/>
					<span class="login100-form-title">
						User Login
					</span>
                    
                    <form class="login100-form validate-form" runat="server">
	                <asp:login ID="login1" CssClass="loginform" runat="server" OnAuthenticate="login1_Authenticate" Width="773px">
                    <LayoutTemplate>
                    <div class="loginform">
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<asp:TextBox CssClass="input100" ID="UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
                        <asp:TextBox CssClass="input100" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<br />
					<div>
						<asp:Button CssClass="btn-success align-middle" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="Registrarse.aspx">
							Sign Up
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
            </LayoutTemplate>
            </asp:login>
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
