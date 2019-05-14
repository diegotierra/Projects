<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>OdysseyD</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="Templates/main_template/assets/css/main.css" />
	    <style type="text/css">
            .newStyle1 {
                color: #FFFFFF;
            }
            .newStyle2 {
                color: #FFFFFF;
            }
            .newStyle3 {
                color: #FFFFFF;
            }
            #map {
            height: 400px;
            width: 100%;
           }
            .newStyle4 {
                font-size: x-small;
            }
            .newStyle5 {
                font-size: small;
                font-weight: bold;
                top: 0px;
                left: -15px;
                width: 60px;
            }
            .newStyle6 {
                padding: 0px;
                margin: 0px;
                position: absolute;
            }
            .newStyle7 {
                padding: 0px;
                margin: 0px;
            }
        </style>
	</head>
	<body class="homepage">
		<div id="page-wrapper">
            <form method="post" action="#" runat="server">
			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="Default.aspx" id="logo">SPRING-SUMMER 2018</a></h1>
								<hr />
								<p>The new season has already arrived, What are you waiting for?</p>
							</header>
							<footer>
								<a href="#banner" class="button circled scrolly">Shop Now!</a>
							</footer>
						</div>

					<!-- Nav -->
						<nav id="nav">
                            <h1><a href="Default.aspx" id="logo">OdysseyD</a></h1>
							<ul>
								<li><a href="Default.aspx">Home</a></li>
								<li>
									<a href="#">Categories</a>
									<ul>
                                        <asp:Label ID="lblCategorias" runat="server" Text=""></asp:Label>
									</ul>
								</li>
								<li>
                                    <a href="#"><i class="fas fa-user"></i></a>
                                    <ul>
                                        <asp:Label ID="lblUserInfo" runat="server" Text=""></asp:Label>                                      
									</ul>
								</li>
								<li><a href=""><i class="fas fa-shopping-cart"></i></a></li>
                                <li><asp:Label ID="lblRolNombreUsuario" runat="server" Text=""></asp:Label></li>
                                <li><asp:Button ID="btnSalir" runat="server" Text="Exit" Visible="False"  OnClick="btnSalir_Click" CssClass="newStyle7" /></li>
							</ul>
						</nav>
				</div>
			<!-- Banner -->
				<section id="banner">
					<header>
                        <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
						<h2>Welcome to <strong>OdysseyD</strong>!!</h2>
						<p>
							These are our lastest news, don´t miss them!!
						</p>
					</header>
				</section>

			<!-- Carousel -->
				<section class="carousel">
					<div class="reel">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
					</div>
				</section>

			<!-- Main -->
				<div class="wrapper style2">
                    <br />
                    <br />
					<article id="main" class="container special">
						<a href="#" class="image featured"><img src="Templates/main_template/images/pic06.jpg" alt="" /></a>
						<header>
							<h2>About us</h2>
						</header>
						<p>
							OdysseyD aim to offer our customers a variety of the latest fashion items. We’ve come a long way, so we know exactly which direction 
                            to take when supplying you with high quality yet budget friendly products. We offer all of this while providing excellent customer service
                            and friendly support.
                            We always keep an eye on the latest trends,so we put our customers’ wishes first. 
                            That is why we have satisfied customers all over the world, and are thrilled to be a part of the fashion industry.
                            The interests of our customers are always the top priority for us, so we hope you will enjoy our products as much as we enjoy making them available to you.
						</p>
					</article>

				</div>

			<!-- Features -->
				<div class="wrapper style1">

					<section id="features" class="container special">
						<header>
							<h2>Why are we different from the rest?</h2>
							<p>At OdysseyD we consider ourselves innovative with our new marketing methods</p>
						</header>
						<div class="row">
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="Templates/main_template/images/pic07.jpg" alt="" /></a>
								<header>
									<h3>Many items to choose</h3>
								</header>
								<p>
									Explore our store and choose from thousands of available items. We have several brands, 
                                    fabrics and colors, so you will not run out of choices.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="Templates/main_template/images/pic08.jpg" alt="" /></a>
								<header>
									<h3>Secure Payment</h3>
								</header>
								<p>
									Pay quietly, this site is safe. In addition, we have several payment options, such as Paypal, credit cards, bank transfer, etc, so you can choose the one that best suits you.
								</p>
							</article>
							<article class="4u 12u(mobile) special">
								<a href="#" class="image featured"><img src="Templates/main_template/images/pic09.jpg" alt="" /></a>
								<header>
									<h3>Fast Delivery</h3>
								</header>
								<p>
									The shipment of your items is fast and safe, besides that we provide you at all times an excellent after-sales service.
								</p>
							</article>
						</div>
					</section>

				</div>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">						
                                <section class="5u 12u(mobile)">
											<h3>Do you need help? Contact us</h3>
                                            <p>We are at your disposal to answer and solve all your questions</p>									  
                                        
									    <div>
										    <label for="name" class="newStyle1">Name</label>
										    <input type="text" name="name" id="name" />
									    </div>
									    <div>
										    <label for="email" class="newStyle2">Email</label>
										    <input type="email" name="email" id="email"/>
									    </div>
									    <div>
										    <label for="message" class="newStyle3">Message</label>
										    <textarea name="message" id="message" rows="4" ></textarea>
									    </div>
                                        <br/>
									    <div class="actions" style="text-align:center">
										    <input type="submit" value="Send Message" class="special" />
										    <input type="reset" value="Reset" />
									    </div>
								        </form>
                                </section>
                                <section class="3u 12u(mobile)">
                                </section>
                                <section class="4u 12u(mobile)">
							        <h2>Where are we?</h2>
							        <dl class="alt">
								        <dt>Address</dt>
								        <dd>23 Maisonnave Ave &bull; Alicante,03003 &bull; Spain</dd>
								        <dt>Phone</dt>
								        <dd>(+34) 000 00 00 00</dd>
								        <dt>Email</dt>
								        <dd><a href="#">odysseydinfo@gmail.com</a></dd>
							        </dl>
                                    <div id="map"></div>
                                    <script>
                                      function initMap() {
                                        var uluru = {lat: 38.343578, lng: -0.491513};
                                        var map = new google.maps.Map(document.getElementById('map'), {
                                          zoom: 15,
                                          center: uluru
                                        });
                                        var marker = new google.maps.Marker({
                                          position: uluru,
                                          map: map
                                        });
                                      }
                                    </script>
                                    <script async defer
                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBG3NZuLaXny-wKpXutr5Vshr26nSh7T34&callback=initMap">
                                   </script>
						       </section>
						</div>
						<hr />
						<div class="row">
							<div class="12u">

								<!-- Contact -->
									<section class="contact">
										<header>
											<h3>You can follow us in the following social networks</h3>
										</header>										
										<ul class="icons">
											<li><a href="https://twitter.com/" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
											<li><a href="https://es-la.facebook.com/" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
											<li><a href="https://www.instagram.com" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
											<li><a href="https://www.pinterest.es/" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
											<li><a href="https://dribbble.com/" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
											<li><a href="https://www.linkedin.com" class="icon fa-linkedin"><span class="label">Linkedin</span></a></li>
										</ul>
									</section>

								<!-- Copyright -->
									<div class="copyright">
										<ul class="menu">
											<li>&copy; OdysseyD 2018. All rights reserved.</li><li>Designed by Diego Tierra Díaz</li>
										</ul>
									</div>

							</div>

						</div>
					</div>
				</div>
		</div>

		<!-- Scripts -->
			<script src="Templates/main_template/assets/js/jquery.min.js"></script>
			<script src="Templates/main_template/assets/js/jquery.dropotron.min.js"></script>
			<script src="Templates/main_template/assets/js/jquery.scrolly.min.js"></script>
			<script src="Templates/main_template/assets/js/jquery.onvisible.min.js"></script>
			<script src="Templates/main_template/assets/js/skel.min.js"></script>
			<script src="Templates/main_template/assets/js/util.js"></script>
			<script src="Templates/main_template/assets/js/main.js"></script>
            <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
    </body>
</html>