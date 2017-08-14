$(function(){
	$('.button-collapse').sideNav('hide');
	$('.button-collapse').sideNav('destroy');
	$(".button-collapse").sideNav({
		closeOnClick: true
	});

	//$('select').material_select();
	$('.dt_nascimento').mask("99/99/9999");

	$("#cep").focusout(function(){
		var cep_code = $(this).val();
		if( cep_code.length <= 0 ) return;
		$.get("http://apps.widenet.com.br/busca-cep/api/cep.json", { code: cep_code },
		 function(result){
		    if( result.status != 1 ){
		        Materialize.toast('CEP não encontrado.', 4000);
		        $("input#bairro").val("");
		        $("input#endereco").val("");
		       	return;
		    };
		    $("input#cep").val( result.code );
		    $("input#bairro").val( result.district );
		    $("input#cidade").val( result.city );
		    $("input#endereco").val( result.address );
		    $("input#bairro").focus();
			$("input#cidade").focus();
			$("input#endereco").focus();
			$("input#numero").focus();
		});
	});

	$("#escola_origem").change(function(){
		var escola_origem = $(".escola_origem").val(); 
		if(escola_origem == "1"){
			$(".contem_escola_origem").slideDown();
		}else{
			$(".contem_escola_origem").slideUp();
		};
	});

	$("#como_soube").change(function(){
		var como_soube = $(".como_soube").val(); 
		if(como_soube == "1"){
			$(".contem_como_outro").slideDown();
		}else{
			$(".contem_como_outro").slideUp();
		};
	});


	$(".formulario_contato").submit(function(){
		var nome = $(".txtnome").val();
		var sobrenome = $(".txtsobrenome").val();
		var telefone = $(".txttelefone").val();
		var email = $(".txtemail").val();
		var mensagem = $(".txtmensagem").val();
		if(nome == ""){
			Materialize.toast('Digite seu nome.', 4000);
			return false;
		}else if(sobrenome == ""){
			Materialize.toast('Digite seu sobrenome.', 4000);
			return false;
		}else if(telefone == ""){
			Materialize.toast('Digite seu telefone.', 4000);
			return false;
		}else if(email == ""){
			Materialize.toast('Digite seu email.', 4000);
			return false;
		}else if(mensagem == "" || mensagem.length < 2){
			Materialize.toast('Digite sua mensagem.', 4000);
			return false;
		}else{
			return true;
		}

	});

	$(".formulariocadastro").submit(function(){
		var nome = $(".nome").val();
		var sobrenome = $(".sobrenome").val();
		var dt_nascimento = $(".dt_nascimento").val();
		var nm_reponsavel = $(".nm_reponsavel").val();
		var escola_origem = $(".escola_origem").val();
		var outra_escola = $(".outra_escola").val();
		var rg = $(".rg").val();
		var cep = $(".cep").val();
		var endereco = $(".endereco").val();
		var numero = $(".numero").val();
		var cidade = $(".cidade").val();
		var bairro = $(".bairro").val();
		var telefone = $(".telefone").val();
		var email = $(".email").val();
		var como_soube = $(".como_soube").val();
		var como_outro = $(".como_outro").val();
		var termo = $("#termo").prop("checked");

		if(nome == ""){
			Materialize.toast('Digite seu nome.', 4000);
			return false;
		}else if(sobrenome == ""){
			Materialize.toast('Digite seu sobrenome.', 4000);
			return false;
		}else if(dt_nascimento == ""){
			Materialize.toast('Digite sua data de nascimento.', 4000);
			return false;
		}else if(nm_reponsavel == ""){
			Materialize.toast('Digite o nome do seu responsável.', 4000);
			return false;
		}else if(escola_origem == null){
			Materialize.toast('Escolha sua escola de origem.', 4000);
			return false;
		}else if(escola_origem == "1" && outra_escola == ""){
			Materialize.toast('Digite sua escola de origem.', 4000);
			return false;
		}else if(rg == ""){
			Materialize.toast('Digite seu RG.', 4000);
			return false;
		}else if(cep == ""){
			Materialize.toast('Digite seu CEP.', 4000);
			return false;
		}else if(endereco == ""){
			Materialize.toast('Digite seu endereço.', 4000);
			return false;
		}else if(numero == ""){
			Materialize.toast('Digite o número do seu endereço.', 4000);
			return false;
		}else if(bairro == ""){
			Materialize.toast('Digite seu bairro.', 4000);
			return false;
		}else if(cidade == ""){
			Materialize.toast('Digite seu cidade.', 4000);
			return false;
		}else if(telefone == ""){
			Materialize.toast('Digite seu telefone.', 4000);
			return false;
		}else if(email == ""){
			Materialize.toast('Digite seu email.', 4000);
			return false;
		}else if(como_soube == null){
			Materialize.toast('Informe como soube do concurso.', 4000);
			return false;
		}else if(como_soube == "1" && como_outro == ""){
			Materialize.toast('Digite como soube do concurso.', 4000);
			return false;
		}else if(termo == false){
			Materialize.toast('Você não concordou com os termos do concurso.', 4000);
			return false;
		}else{
			return true; // verdadeiro	
		}		
	});
});
