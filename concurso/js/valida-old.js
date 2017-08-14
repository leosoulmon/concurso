$(function(){
	$("#formulario_inscricao").each(function(){
		this.reset();
	});
	function limparRG(){
	  var passo1 = 0;
	  var passo2 = 0;
	  var palavra = "";
	  var compara = "-";
	  var compara2 = ".";
	  var resultado_teste = 0;
	  var resultado_teste2 = 0;
	  var str = document.getElementById('rg').value;
	  var tamanho_str = str.length; 
	  while(passo2 < tamanho_str){
	    var caminho = str.substr(passo2, 1);
	    passo2++;
	    resultado_teste = caminho.localeCompare(compara);
	    resultado_teste2 = caminho.localeCompare(compara2);
	    if(resultado_teste != 0 && resultado_teste2 != 0){
	      palavra += str.substr(passo1, 1);
	    };
	    passo1++;
	  };
	  $("#rg").val(palavra);
	};

	$('.data_nascimento').mask("99/99/9999");

	$(".formulario_teste_vocacional_part1").submit(function(){
		var nome = $("#nm_aluno").val();
		var sobrenome = $("#nm_sobrenome_aluno").val();
		var rg = $("#cd_rg_aluno").val();
		var email = $("#ds_email_aluno").val();
		if(nome == ""){
			Materialize.toast("Digite seu nome.", 2000)
			return false;
		}else if(sobrenome == ""){
			Materialize.toast("Digite seu sobrenome.", 2000)
			return false;
		}else if(rg == ""){
			Materialize.toast("Digite o RG.", 2000)
			return false;
		}else if(email == ""){
			Materialize.toast("Digite seu email.", 2000)
			return false;
		}else{
			return true;
		}
	});

	$(".formulario_teste_vocacional_part2").submit(function(){
		var afirmativa = [];
		$("input[type=checkbox]:checked").each(function(){
			afirmativa.push($(this).val());
		});
		if(afirmativa.length == 0){
			Materialize.toast("Você não selecionou nada.", 2000, "", function(){
				Materialize.toast("Selecione o que tem mais haver com você.", 2000, "",  function(){
					Materialize.toast("Assim poderei registrar seu teste.", 2000,"",function(){
						Materialize.toast("Ok?", 2000)
					});
				});
			});
		}else{
			$('#confirma').modal('open');
		};
		return false;
	});

	$("#formulario_inscricao").submit(function(){
		limparRG();
		var ano = $("#ano").val();
		var nome = $("#nome").val();
		var sobrenome = $("#sobrenome").val();
		var rg = $("#rg").val();
		var responsavel = $("#responsavel").val();
		var data_nascimento = $("#data_nascimento").val();
		var escola = $("#escola").val();
		var cep = $("#cep").val();
		var endereco = $("#endereco").val();
		var numero = $("#numero").val();
		var complemento = $("#complemento").val();
		var bairro = $("#bairro").val();
		var cidade = $("#cidade").val();
		var telefone = $("#telefone").val();
		var email = $("#email").val();
		var horarioA = $('input[name="HorarioA"]:checked').val();
		var horarioB = $('input[name="HorarioB"]:checked').val();
		var horarioC = $('input[name="HorarioC"]:checked').val();
		var concordo = $("#termo").prop("checked");

		if(ano == "" || ano == 0 || ano == null){
			Materialize.toast('Informe o ano que você está cursando atualmente.', 4000);
            return false;
		}else if(nome == ""){
            Materialize.toast('Digite seu nome.', 4000);
            return false;
		}else if(sobrenome == ""){
            Materialize.toast('Digite seu sobrenome.', 4000);
            return false;
		}else if(data_nascimento == ""){
            Materialize.toast('Digite sua data de nascimento.', 4000);
            return false;
		}else if(escola == "1"){
            Materialize.toast('Informe sua escola de origem.', 4000);
            return false;
		}else if(rg == ""){
            Materialize.toast('Digite seu rg.', 4000);
            return false;
		}else if(responsavel == ""){
            Materialize.toast('Digite o nome do seu responsável.', 4000);
            return false;
		}else if(cep == ""){
            Materialize.toast('Digite seu CEP.', 4000);
            return false;
		}else if(endereco == ""){
            Materialize.toast('Digite seu endereço.', 4000);
            return false;
		}else if(numero == ""){
            Materialize.toast('Digite seu número.', 4000);
            return false;
		}else if(bairro == ""){
            Materialize.toast('Digite o nome do seu bairro.', 4000);
            return false;
		}else if(cidade == ""){
            Materialize.toast('Digite o nome da sua cidade.', 4000);
            return false;
		}else if(telefone == ""){
            Materialize.toast('Digite seu telefone.', 4000);
            return false;
		}else if(email == ""){
            Materialize.toast('Digite seu email.', 4000);
            return false;
		}else if(horarioA == undefined && horarioB == undefined && horarioC == undefined){
            Materialize.toast('Nenhuma palestra foi selecionada.', 4000);
            return false;
		}else if(concordo == false){
            Materialize.toast('Você não concordou com os termos.', 4000);
            return false;
		}else{
			return true;
		}
	});

	$("#formulario_contato").submit(function(){
		var nome = $("#txtnome").val();
		var sobrenome = $("#txtsobrenome").val();
		var telefone = $("#txttelefone").val();
		var email = $("#txtemail").val();
		var mensagem = $("#txtmensagem").val();
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
			Materialize.toast('Digite seu mensagem.', 4000);
			return false;
		}else{
			return true;
		}
	});	
});