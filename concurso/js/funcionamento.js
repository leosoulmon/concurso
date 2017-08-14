$(function(){
	$(".button-collapse").sideNav();
	$('select').material_select();
	$('textarea#txtmensagem').characterCounter();
  	$('#txtmensagem').trigger('autoresize');
  	$(".titulo_palestra").click(function(){
  		var id = $(this).attr("id");
  		//$(".collection-item > ul").stop().slideUp();
  		$("."+id).stop().slideToggle();
  	});
  	$('.scrollspy').scrollSpy();
  	$('.fixed-action-btn').openFAB();
	$('.fixed-action-btn').closeFAB();
	$('.modal').modal();
	$(".sim").click(function(){
		var afirmativa = [];
		$("input[type=checkbox]:checked").each(function(){
			afirmativa.push(parseInt($(this).val()));
		});
		Materialize.toast('Vou registrar o seu teste então. Só um 1 segundo.', 500, "", function(){
			var eng_tec = [];
			var nat = [];
			var assis_serv = [];
			var soc_hum = [];
			var art_des = [];
			var cient = [];
			var neg_adm = [];
			for(var i = 0;i < afirmativa.length;i++){
				if(afirmativa[i] < 23){
					eng_tec.push(afirmativa[i]);
				}else if(afirmativa[i] >= 23 && afirmativa[i] < 43){
					nat.push(afirmativa[i]);
				}else if(afirmativa[i] >= 43 && afirmativa[i] < 64){
					assis_serv.push(afirmativa[i]);
				}else if(afirmativa[i] >= 163 && afirmativa[i] < 184){
					soc_hum.push(afirmativa[i]);
				}else if(afirmativa[i] >= 83 && afirmativa[i] < 104){
					art_des.push(afirmativa[i]);
				}else if(afirmativa[i] >= 103 && afirmativa[i] < 124){
					cient.push(afirmativa[i]);
				}else if(afirmativa[i] >= 123 && afirmativa[i] < 144){
					neg_adm.push(afirmativa[i]);
				};
			};

			$.post("/feira/classes/registrar_teste.asp", {et:eng_tec.length, nt:nat.length, ss:assis_serv.length, sh:soc_hum.length, ad:art_des.length, c:cient.length, na:neg_adm.length}, function(){
				//window.location = "http://www.jeanpiaget.g12.br/";
				window.location = "/feira/classes/resultado.asp";
			});

			//console.log("Todos: "+afirmativa);
			// console.log("tec: "+eng_tec);
			// console.log("nat: "+nat);
			// console.log("assis_serv: "+assis_serv);
			// console.log("soc_hum: "+soc_hum);
			// console.log("art_des: "+art_des);
			// console.log("cient: "+cient);
			// console.log("neg_adm: "+neg_adm);
		});
	});
	$(".nao").click(function(){
		Materialize.toast('OK, pode escolher outras opções se quiser.', 2000);
	});

  	jQuery(function($){
	   $("#cep").focusout(function(){
	      var cep_code = $(this).val();
	      $("#carregando").show();
	      if( cep_code.length <= 0 ) return;
	      $.get("http://apps.widenet.com.br/busca-cep/api/cep.json", { code: cep_code },
	         function(result){
	            if( result.status!=1 ){
	                Materialize.toast('CEP não encontrado.', 4000);
	      			$("#carregando").hide();
		            $("input#cidade").val("");
		            $("input#bairro").val("");
		            $("input#endereco").val("");
	               	return;
	            };
	            $("input#cep").val( result.code );
	            $("input#cidade").val( result.city );
	            $("input#bairro").val( result.district );
	            $("input#endereco").val( result.address );
	      		$("#carregando").hide();
	        });
	   	});
	});

	function limparRG(){
		var passo1 = 0;
		var passo2 = 0;
		var palavra = "";
		var compara = "-";
		var compara2 = ".";
		var resultado_teste = 0;
		var resultado_teste2 = 0;
		var str = document.getElementById('cd_rg').value;
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
		$("#cd_rg").val(palavra);
	};

	function gup( name, url ) {
		if (!url) url = location.href;
		name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
		var regexS = "[\\?&]"+name+"=([^&#]*)";
		var regex = new RegExp( regexS );
		var results = regex.exec( url );
		return results == null ? null : results[1];
	}
	var pagina = window.location;
	pagina = gup('id', pagina);
});


//$.post("registrar_teste.asp",
//{
//  id_usuario:id_bt
//},
//function(data){
//	//Materialize.toast('OK. Pode escolher outra se quiser.', 4000)
//    window.location = "classes/registrar_teste.asp";
//});