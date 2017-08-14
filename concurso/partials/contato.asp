<script src="js/iniciar-material.js"></script>
<script>
	$('.button-collapse').sideNav('hide');
	$('.button-collapse').sideNav('destroy');
	$(".button-collapse").sideNav({
		closeOnClick: true
	});
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-102074940-1', 'auto');
  ga('send', 'pageview');

</script>
<h2 class="center titulo-pagina blue-text text-darken-4">CONTATO</h2>
<div class="conteudo-contato">
	<div class="container">
		<form id="formulario_contato" class="formulario_contato col l12 m12 s12" name="formulario_contato" method="post" action="../scripts/contato.asp" accept-charset="ISO-8859-1" style="margin-bottom:25px;">
			<p class="row">
				<div class="input-field">
					<input type="text" name="nome" class="txtnome" id="txtnome">
					<label for="txtnome">Nome</label>
				</div>
			</p>
			<p class="row">
				<div class="input-field">
					<input type="text" name="sobrenome" class="txtsobrenome" id="txtsobrenome">
					<label for="txtsobrenome">Sobrenome</label>
				</div>
			</p>
			<style>
				input[type=number]::-webkit-inner-spin-button, 
				input[type=number]::-webkit-outer-spin-button { 
				-webkit-appearance: none; 
				margin: 0; 
				}
			</style>
			<p class="row">
				<div class="input-field">
					<input type="number" name="fonefax" class="txttelefone" id="txttelefone">
					<label for="txttelefone">Telefone</label>
				</div>
			</p>
			<p class="row">
				<div class="input-field">
					<input type="email" name="email" class="txtemail" id="txtemail">
					<label for="txtemail">Email</label>
				</div>
			</p>
			<p class="row">
				<div class="input-field">
					<textarea id="txtmensagem" class="materialize-textarea txtmensagem" name="mensagem" data-length="120"></textarea>
					<label for="txtmensagem">Mensagem</label>
		        </div>
			</p>

			<input name="assunto" type="hidden" value="Formulário de Contato - Colégio Jean Piaget" >
    		<input name="destino" type="hidden" value="jeanpiaget@jeanpiaget.g12.br">

			<p class="row">
				<button type="submit" name="enviar" id="enviar" class="right btn waves-effect waves-teal right yellow darken-2" value="Enviar"> Enviar </button>
			</p>
		</form>
	</div>
</div>