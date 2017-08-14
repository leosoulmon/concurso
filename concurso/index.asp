<%@LANGUAGE="VBSCRIPT"%> 
<!DOCTYPE html>
<html lang="pt-br" ng-app="concurso">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> Concurso de Bolsas - Colégio Jean Piaget <%=YEAR(DATE)%> </title>
	<link href="lib/materialize/css/materialize.min.css" rel="stylesheet" media="screen,print">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="css/css.css" rel="stylesheet">
	<script src="lib/jquery.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="lib/angular/angular.min.js"></script>
	<script src="lib/main.js"></script>
	<script src="lib/materialize/js/materialize.min.js"></script>
	<script src="lib/mascara.js"></script>
	<script src="https://use.fontawesome.com/6a6867f07c.js"></script>
	<script src="lib/angular/angular-route.min.js"></script>
	<script src="lib/angular/angular-animate.min.js"></script>
	<script src="js/iniciar-material.js"></script>
	<script>
		$('.button-collapse').sideNav('hide');
		$('.button-collapse').sideNav('destroy');
		$(".button-collapse").sideNav({
			closeOnClick: true
		});
	</script>
	<!-- Facebook Pixel Code -->
	<script>
	!function(f,b,e,v,n,t,s)
	{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
	n.callMethod.apply(n,arguments):n.queue.push(arguments)};
	if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
	n.queue=[];t=b.createElement(e);t.async=!0;
	t.src=v;s=b.getElementsByTagName(e)[0];
	s.parentNode.insertBefore(t,s)}(window,document,'script',
	'https://connect.facebook.net/en_US/fbevents.js');
	 fbq('init', '351350055283771'); 
	fbq('track', 'PageView');
	</script>
	<noscript>
	 <img height="1" width="1" 
	src="https://www.facebook.com/tr?id=351350055283771&ev=PageView
	&noscript=1"/>
	</noscript>
<!-- End Facebook Pixel Code -->
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-102074940-1', 'auto');
		ga('send', 'pageview');
	</script>
</head>
<body> 
	<header>
		<nav class="nav-wrapper blue darken-4 menu-tamanho">
			<div class="container">
				<div class="brand-logo left">
					<a href="http://www.jeanpiaget.g12.br/" target="_blank">
						<img src="img/logo_branco.png" class="responsive-img logo" id="logo" style="max-width:150px;">
					</a>
				</div>
				<div class="right menu-tamanho">
					<ul id="nav-mobile" class="hide-on-med-and-down">
						<li>
							<a href="#/home">Home</a>
						</li>
						<li>
							<a href="#/sobre">Sobre</a>
						</li>
						<li>
							<a href="#/inscricoes">Inscrições</a>
						</li>
						<li>
							<a href="#/regulamento">Regulamento</a>
						</li>
						<li>
							<a href="#/ensinomedio">Ensino Médio</a>
						</li>
						<li>
							<a href="#/contato">Contato</a>
						</li>
					</ul>
				</div>
				<a data-activates="mobile-demo" class="button-collapse right bt-menu-mobile" >
					<i class="large material-icons btn-menu">menu</i>
				</a>
				<ul class="menu_close side-nav" id="mobile-demo">
					<li>
						<a href="#/home" class="menu_close">Home</a>
					</li>
					<li>
						<a href="#/sobre" class="menu_close">Sobre</a>
					</li>
					<li>
						<a href="#/inscricoes" class="menu_close">Inscrições</a>
					</li>
					<li>
						<a href="#/regulamento" class="menu_close">Regulamento</a>
					</li>
					<li>
						<a href="#/ensinomedio" class="menu_close">Ensino Médio</a>
					</li>
					<li>
						<a href="#/contato" class="menu_close">Contato</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<main class="principal">
		<ng-view></ng-view>
	</main>
	<footer class="page-footer blue darken-4 rodape">
		<div class="container">
			<div class="row">
			  <div class="col l5 m12 s12">
			    <h5 class="white-text ccb" style="font-size:1.4rem;">Concurso de bolsas <%=year(now())%></h5>
			    <ul>
			      <li><a class="grey-text text-lighten-3 menu_close" href="#/home">Home</a></li>
			      <li><a class="grey-text text-lighten-3 menu_close" href="#/sobre">Sobre</a></li>
			      <li><a class="grey-text text-lighten-3 menu_close" href="#/inscricoes">Inscrições</a></li>
			      <li><a class="grey-text text-lighten-3 menu_close" href="#/regulamento">Regulamento</a></li>
			      <li><a class="grey-text text-lighten-3 menu_close" href="#/ensinomedio">Ensino Médio</a></li>
			      <li><a class="grey-text text-lighten-3 menu_close" href="#/contato">Contato</a></li>
			    </ul>
			  </div>
			  <div class="col l5 s12">
			  <h5 class="white-text" style="font-size:1.4rem;">Redes Sociais</h5>
			    <ul>
			      <li>
				      <a class="grey-text text-lighten-3" href="https://www.instagram.com/jeanpiagetsantos/" target="_blank" style="padding-right: 15px;">
				      	<i class="fa fa-instagram small" aria-hidden="true"></i>
				      </a>

				      <a class="grey-text text-lighten-3" href="https://www.facebook.com/jeanpiagetsantos/" target="_blank" style="padding-right: 15px;">
						<i class="fa fa-facebook-official small" aria-hidden="true"></i>
				      </a>

				      <a class="grey-text text-lighten-3" href="https://www.youtube.com/user/JeanPiagetSantos" target="_blank">
						<i class="fa fa-youtube-play small" aria-hidden="true"></i>
				      </a>
			      </li>
			    </ul>
			  </div>
			  <div class="col l2 m3 s6 ">
				<h5 class="white-text">
					<a class="grey-text text-lighten-3" href="http://www.jeanpiaget.g12.br/" target="_blank">
						<img src="img/logo_branco.png" class="responsive-img">
					</a>
				</h5>

			  </div>
			</div>
		</div>
		<div class="footer-copyright blue darken-4">
			<div class="container">
				&copy; 2017 Copyright Colégio Jean Piaget
			</div>
		</div>
	</footer>
</body>