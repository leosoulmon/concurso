<!--#include file="../../../Connections/formulario_bolsadeestudos.asp" -->
<!--COMANDO PARA CONTAR INSCRITOS -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-102074940-1', 'auto');
  ga('send', 'pageview');

</script>
<%
if request("a")="" then
ano = Year(Now())
else
ano = request("a")
end if
%>
<%
if request("diadoaluno") = "sim" then
  query_auxiliar = " AND cd_confirmacao_diadoaluno = true "
  titulo_relatorio = "<font color=red>, inscritos para Dia do Aluno.</font>"
elseif request("diadoaluno") = "nao" then
  query_auxiliar = " AND cd_confirmacao_diadoaluno = false "
  titulo_relatorio = "<font color=blue>, não inscritos para Dia do Aluno.</font>"
elseif request("diadoaluno") = "" then
  query_auxiliar = ""
  titulo_relatorio = ""
end if
%>
<%
    Set candidatos_1EM = Server.CreateObject("ADODB.RecordSet")
    candidatos_1EM.ActiveConnection = MM_formulario_bolsadeestudos_STRING
  MM_editQuery_1EM = "SELECT * FROM candidatos WHERE cd_ano_EM = 1 AND YEAR(dt_postagem) = " & ano & "" & query_auxiliar & " ORDER BY nm_aluno, dt_postagem"
  'MM_editQuery_1EM = "SELECT * FROM candidatos WHERE cd_ano_EM = 1 AND YEAR(dt_postagem) = " & ano & "" & query_auxiliar & " and cd_confirmacao_diadoaluno = true and cd_confirmacao_diadoaluno2 = 1 ORDER BY nm_aluno, dt_postagem"
    candidatos_1EM.Source = MM_editQuery_1EM
  candidatos_1EM.CursorType = 0
  candidatos_1EM.CursorLocation = 3 'CursorLocation tipo 3 indica que o cursor vai rodar no cliente adUseClient
  candidatos_1EM.LockType = 3
  candidatos_1EM.Open()
  total_candidatos_1EM = candidatos_1EM.RecordCount
%>
<%
    Set candidatos_3EM = Server.CreateObject("ADODB.RecordSet")
    candidatos_3EM.ActiveConnection = MM_formulario_bolsadeestudos_STRING
  'MM_editQuery_3EM = "SELECT * FROM candidatos WHERE cd_ano_EM = 1 AND YEAR(dt_postagem) = " & ano & "" & query_auxiliar & " ORDER BY nm_aluno, dt_postagem"
  MM_editQuery_3EM = "SELECT * FROM candidatos WHERE cd_ano_EM = 1 AND YEAR(dt_postagem) = " & ano & "" & query_auxiliar & " and cd_confirmacao_diadoaluno = true and cd_confirmacao_diadoaluno2 = 1 ORDER BY nm_aluno, dt_postagem"
    candidatos_3EM.Source = MM_editQuery_3EM
  candidatos_3EM.CursorType = 0
  candidatos_3EM.CursorLocation = 3 'CursorLocation tipo 3 indica que o cursor vai rodar no cliente adUseClient
  candidatos_3EM.LockType = 3
  candidatos_3EM.Open()
  total_candidatos_3EM = candidatos_3EM.RecordCount
%>
<SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>
function DoDateTime(str, nNamedFormat, nLCID)
  dim strRet
  dim nOldLCID

  strRet = str
  If (nLCID > -1) Then
    oldLCID = Session.LCID
  End If

  On Error Resume Next

  If (nLCID > -1) Then
    Session.LCID = nLCID
  End If

  If ((nLCID < 0) Or (Session.LCID = nLCID)) Then
    strRet = FormatDateTime(str, nNamedFormat)
  End If

  If (nLCID > -1) Then
    Session.LCID = oldLCID
  End If

  DoDateTime = strRet
End Function
</SCRIPT>
<!--COMANDO PARA CONTAR INSCRITOS -->
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
<h2 class="center titulo-pagina blue-text text-darken-4">INSCRIÇÕES</h2>
<div class="conteudo-inscricoes">
	<div class="container">
	<% if total_candidatos_1EM < 300 then %>
		<form name="formulariocadastro" accept-charset="ISO-8859-1" id="formulariocadastro" class="formulariocadastro row" method="post" action="/scripts/contato_bolsadeestudos_novo.asp">
	    	<div class="row">
				<div class="input-field col l6 m6 s12">
		          	<input id="nome" type="text" class="nome" name="nome">
		          	<label for="first_name">Nome</label>
		    	</div>
				<div class="input-field col l6 m6 s12">
		          	<input id="sobrenome" type="text" class="sobrenome" name="sobrenome">
		          	<label for="first_name">Sobrenome</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="dt_nascimento" type="text" class="dt_nascimento" name="dt_nascimento">
		          	<label for="dt_nascimento">Data de nascimento</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="nm_reponsavel" type="text" class="nm_reponsavel" name="nm_reponsavel">
		          	<label for="nm_reponsavel">Nome do responsável</label>
		    	</div>
	    	</div>

	    	<div class="row">
	    		<label class="col l12 m12 s12">Escola onde estuda</label>
				<div class="input-field col l12 m12 s12">
					<select class="browser-default escola_origem" id="escola_origem" name="escola_origem">
						<option value="0" disabled selected>Escolha a escola onde estuda</option>
						<option value="1º DE MAIO">1º DE MAIO</option>
						<option value="ABRAHÃO JACOB LAFER">ABRAHÃO JACOB LAFER</option>
						<option value="ADELAIDE PATROCÍNIO DOS SANTOS">ADELAIDE PATROCÍNIO DOS SANTOS</option>
						<option value="ADÉLIA CAMARGO CORRÊA">ADÉLIA CAMARGO CORRÊA</option>
						<option value="ADVENTISTA DE SANTOS">ADVENTISTA DE SANTOS</option>
						<option value="AFONSO NUNES">AFONSO NUNES</option>
						<option value="AFONSO PENA">AFONSO PENA</option>
						<option value="AFONSO SCHMIT">AFONSO SCHMIT</option>
						<option value="ALBERT EINSTEIN">ALBERT EINSTEIN</option>
						<option value="ALBINO LUIZ CALDAS">ALBINO LUIZ CALDAS</option>
						<option value="ALEXANDRINA SANTIAGO NETO">ALEXANDRINA SANTIAGO NETO</option>
						<option value="ALFA">ALFA</option>
						<option value="ALZIRA MARTINS LICHTS">ALZIRA MARTINS LICHTS</option>
						<option value="AMERICANA DE SANTOS">AMERICANA DE SANTOS</option>
						<option value="AMERICO DIAS">AMERICO DIAS</option>
						<option value="ANGLO">ANGLO</option>
						<option value="ANJO DA GUARDA">ANJO DA GUARDA</option>
						<option value="ANTARES">ANTARES</option>
						<option value="ANTONIO DE LISBOA">ANTONIO DE LISBOA</option>
						<option value="ANTONIO MOREIRA COELHO">ANTONIO MOREIRA COELHO</option>
						<option value="ANTONIO NUNES LOPES DA SILVA">ANTONIO NUNES LOPES DA SILVA</option>
						<option value="ANTONIO ORTEGA DOMINGUES">ANTONIO ORTEGA DOMINGUES</option>
						<option value="ARCZAK">ARCZAK</option>
						<option value="ARI DE SÁ CAVALCANTI">ARI DE SÁ CAVALCANTI</option>
						<option value="ARISTÓTELES DE MENEZES">ARISTÓTELES DE MENEZES</option>
						<option value="ARISTOTELES FERREIRA">ARISTOTELES FERREIRA</option>
						<option value="ARLINDO DO A. GOMES">ARLINDO DO A. GOMES</option>
						<option value="ARMANDO BELEGARDE">ARMANDO BELEGARDE</option>
						<option value="ARMANDO COELHO">ARMANDO COELHO</option>
						<option value="ARMANDO VICTORIO BEI">ARMANDO VICTORIO BEI</option>
						<option value="ARMINDO RAMOS">ARMINDO RAMOS</option>
						<option value="ATENEU SANTISTA">ATENEU SANTISTA</option>
						<option value="ATENEU SAO VICENTE">ATENEU SAO VICENTE</option>
						<option value="AUGUSTO PAES DE AVILA">AUGUSTO PAES DE AVILA</option>
						<option value="AYRTON SENNA DA SILVA">AYRTON SENNA DA SILVA</option>
						<option value="AZEVEDO JÚNIOR">AZEVEDO JÚNIOR</option>
						<option value="BANDEIRANTES">BANDEIRANTES</option>
						<option value="BARAO DE JUNDIAI">BARAO DE JUNDIAI</option>
						<option value="BARAO DO RIO BRANCO">BARAO DO RIO BRANCO</option>
						<option value="BARNABÉ">BARNABÉ</option>
						<option value="BARTOLOMEU DE GUSMÃO">BARTOLOMEU DE GUSMÃO</option>
						<option value="BENEDITO CALIXTO">BENEDITO CALIXTO</option>
						<option value="BENEDITO DE CUNHA NETO">BENEDITO DE CUNHA NETO</option>
						<option value="BENEVENUTO MADUREIRA">BENEVENUTO MADUREIRA</option>
						<option value="BERNARDO JOSE MARIA DE LORENA">BERNARDO JOSE MARIA DE LORENA</option>
						<option value="BONI CONSILLI">BONI CONSILLI</option>
						<option value="BORB">BORB</option>
						<option value="BORBA GATO">BORBA GATO</option>
						<option value="BRAS CUBAS">BRAS CUBAS</option>
						<option value="BRASILIA">BRASILIA</option>
						<option value="CAIÇARA">CAIÇARA</option>
						<option value="CANADA">CANADA</option>
						<option value="CANDIDO PORTINARI">CANDIDO PORTINARI</option>
						<option value="CARMO">CARMO</option>
						<option value="CAROLINA DANTAS">CAROLINA DANTAS</option>
						<option value="CEFAM">CEFAM</option>
						<option value="CEFET">CEFET</option>
						<option value="CELLULA MATER">CELLULA MATER</option>
						<option value="CELTAS(VOTUP)">CELTAS(VOTUP)</option>
						<option value="CELULA MATER">CELULA MATER</option>
						<option value="CENÁCULO">CENÁCULO</option>
						<option value="CESARIO BASTOS">CESARIO BASTOS</option>
						<option value="CESMA">CESMA</option>
						<option value="CHRISTUS">CHRISTUS</option>
						<option value="CIDADE DE SANTOS">CIDADE DE SANTOS</option>
						<option value="CIDADES IRMAS">CIDADES IRMAS</option>
						<option value="CLEOBULO AMAZONAS DUARTE">CLEOBULO AMAZONAS DUARTE</option>
						<option value="COC">COC</option>
						<option value="COMERCIAL ÁLVARES PENTEADO">COMERCIAL ÁLVARES PENTEADO</option>
						<option value="COMPANHIA DE MARIA">COMPANHIA DE MARIA</option>
						<option value="CORAÇÃO DE MARIA">CORAÇÃO DE MARIA</option>
						<option value="DAGOBERTO FERREIRA DA COSTA">DAGOBERTO FERREIRA DA COSTA</option>
						<option value="DEGRAU">DEGRAU</option>
						<option value="DINIS MARTINS">DINIS MARTINS</option>
						<option value="DIVINO SALVADOR DE ITÚ">DIVINO SALVADOR DE ITÚ</option>
						<option value="DOM BOSCO SANTISTA">DOM BOSCO SANTISTA</option>
						<option value="DOMINGOS DE MORAES">DOMINGOS DE MORAES</option>
						<option value="DOMINGOS DE SOUZA">DOMINGOS DE SOUZA</option>
						<option value="DON DOMÊNICO">DON DOMÊNICO</option>
						<option value="DOS ANDRADAS">DOS ANDRADAS</option>
						<option value="DR. ANTONIO ABLAS FILHO">DR. ANTONIO ABLAS FILHO</option>
						<option value="DR. LOBERTO AMAURY GALLIERA">DR. LOBERTO AMAURY GALLIERA</option>
						<option value="DUQUE DE CAXIAS">DUQUE DE CAXIAS</option>
						<option value="EDMEA LADEVIG">EDMEA LADEVIG</option>
						<option value="EDMEA LADEVIG">EDMEA LADEVIG</option>
						<option value="EDUARDO GOMES">EDUARDO GOMES</option>
						<option value="EMILIO JUSTO">EMILIO JUSTO</option>
						<option value="ENEVENUTO MADUREIRA">ENEVENUTO MADUREIRA</option>
						<option value="ENRIQUE OSVALD">ENRIQUE OSVALD</option>
						<option value="EQUIPE">EQUIPE</option>
						<option value="ESCOLÁSTICA ROSA">ESCOLÁSTICA ROSA</option>
						<option value="ESMERALDO">ESMERALDO</option>
						<option value="ESPAÇO LIVRE">ESPAÇO LIVRE</option>
						<option value="ESQUEMINHA">ESQUEMINHA</option>
						<option value="ESTADUAL VILA TUPI">ESTADUAL VILA TUPI</option>
						<option value="ESTIVADORES">ESTIVADORES</option>
						<option value="ETAPA">ETAPA</option>
						<option value="ETE DE CACHOEIRA PAULISTA">ETE DE CACHOEIRA PAULISTA</option>
						<option value="ETHANIL BENTO DE  ASSIS">ETHANIL BENTO DE ASSIS</option>
						<option value="ETSP-UNEP">ETSP-UNEP</option>
						<option value="EVANGÉLICO JARAGUÁ">EVANGÉLICO JARAGUÁ</option>
						<option value="EVOLUÇAO">EVOLUÇAO</option>
						<option value="EXTERNATO NOSSA Sª DE FATIMA">EXTERNATO NOSSA Sª DE FATIMA</option>
						<option value="FABIO BARRETTO">FABIO BARRETTO</option>
						<option value="FEDERAL DE SAO PAULO">FEDERAL DE SAO PAULO</option>
						<option value="FENICE - EMPREEND. EDUCACIONAIS">FENICE - EMPREEND. EDUCACIONAIS</option>
						<option value="FENIX  - RJ">FENIX - RJ</option>
						<option value="FERNANDES TOLMAS">FERNANDES TOLMAS</option>
						<option value="FERNANDO COSTA">FERNANDO COSTA</option>
						<option value="FERNANDO DE AZEVEDO">FERNANDO DE AZEVEDO</option>
						<option value="FLORESTAN FERNANDES">FLORESTAN FERNANDES</option>
						<option value="FORTEC">FORTEC</option>
						<option value="FRANCISCO MEIRA">FRANCISCO MEIRA</option>
						<option value="FRANCISCO PAIVA FERREIRA">FRANCISCO PAIVA FERREIRA</option>
						<option value="FUNDAÇÃO EDUCACIONAL DE JAU">FUNDAÇÃO EDUCACIONAL DE JAU</option>
						<option value="FUNDAÇÃO SAO FRANCISCO XAVIER">FUNDAÇÃO SAO FRANCISCO XAVIER</option>
						<option value="GAGO COUTINHO">GAGO COUTINHO</option>
						<option value="GALDINO MOREIRA">GALDINO MOREIRA</option>
						<option value="GEO MEIRELES">GEO MEIRELES</option>
						<option value="GERALDO MARTINS DE MELLO">GERALDO MARTINS DE MELLO</option>
						<option value="GETÚLIO VARGAS">GETÚLIO VARGAS</option>
						<option value="GIUSFREDO SANTINI">GIUSFREDO SANTINI</option>
						<option value="GLADSTON JAFET">GLADSTON JAFET</option>
						<option value="GOTA DE LEITE">GOTA DE LEITE</option>
						<option value="GRACINDA MARIA FERREIRA">GRACINDA MARIA FERREIRA</option>
						<option value="GUARACY SILVEIRA">GUARACY SILVEIRA</option>
						<option value="HECKEL TAVARES">HECKEL TAVARES</option>
						<option value="HENRIQUE OSVALDO">HENRIQUE OSVALDO</option>
						<option value="HUGO SANTOS SILVA">HUGO SANTOS SILVA</option>
						<option value="HUMANITAS">HUMANITAS</option>
						<option value="HUMBERTO DE ALENCAR CASTELO BRANCO">HUMBERTO DE ALENCAR CASTELO BRANCO</option>
						<option value="III MILÊNIO">III MILÊNIO</option>
						<option value="IMACULADA CONCEIÇÃO">IMACULADA CONCEIÇÃO</option>
						<option value="INÁCIO MIGUEL STÉFANO">INÁCIO MIGUEL STÉFANO</option>
						<option value="INTEGRAÇÃO">INTEGRAÇÃO</option>
						<option value="INTERATIVO">INTERATIVO</option>
						<option value="INTERGRAUS">INTERGRAUS</option>
						<option value="IOLANDA CONTE">IOLANDA CONTE</option>
						<option value="IRMÃO JOSÉ GENÉSIO">IRMÃO JOSÉ GENÉSIO</option>
						<option value="ITÁ">ITÁ</option>
						<option value="JACOUB CODJEAN">JACOUB CODJEAN</option>
						<option value="JARDIM BOPEVA">JARDIM BOPEVA</option>
						<option value="JEAN PIAGET">JEAN PIAGET</option>
						<option value="JOÃO BATISTA">JOÃO BATISTA</option>
						<option value="JOÃO OCTÁVIO DOS SANTOS">JOÃO OCTÁVIO DOS SANTOS</option>
						<option value="JOÃO RAMALHO">JOÃO RAMALHO</option>
						<option value="JOÃO XXIII">JOÃO XXIII</option>
						<option value="JOAQUIM LOPES LEÃO">JOAQUIM LOPES LEÃO</option>
						<option value="JOSE CAVARIAN">JOSE CAVARIAN</option>
						<option value="JOSE DA COSTA SILVA E SOBRINHO">JOSE DA COSTA SILVA E SOBRINHO</option>
						<option value="JOSÉ MATOSINHO CAMPINAS">JOSÉ MATOSINHO CAMPINAS</option>
						<option value="KENNEDY">KENNEDY</option>
						<option value="KUNTS BUCH">KUNTS BUCH</option>
						<option value="LAMEC">LAMEC</option>
						<option value="LATO SENSU">LATO SENSU</option>
						<option value="LAUDELINO FERNANDES SANTOS">LAUDELINO FERNANDES SANTOS</option>
						<option value="LAURA FILGUEIRAS">LAURA FILGUEIRAS</option>
						<option value="LEÃO XIII">LEÃO XIII</option>
						<option value="LEONARDO NUNES">LEONARDO NUNES</option>
						<option value="LEONOR MENDES DE BARROS">LEONOR MENDES DE BARROS</option>
						<option value="LEOPOLDO JOSÉ DE SANTANA">LEOPOLDO JOSÉ DE SANTANA</option>
						<option value="LICEU SANTISTA">LICEU SANTISTA</option>
						<option value="LICEU SÃO PAULO">LICEU SÃO PAULO</option>
						<option value="LIONS CLUBE">LIONS CLUBE</option>
						<option value="LORENA">LORENA</option>
						<option value="LOURDES ORTIZ">LOURDES ORTIZ</option>
						<option value="LUCIA FLORA DOS SANTOS">LUCIA FLORA DOS SANTOS</option>
						<option value="LUCIMARA DE JESUS VICENTE">LUCIMARA DE JESUS VICENTE</option>
						<option value="LUIZ D'AUREA">LUIZ D'AUREA</option>
						<option value="LUIZ DE CAMÕES">LUIZ DE CAMÕES</option>
						<option value="LUIZ GONZAGA PINTO E SILVA">LUIZ GONZAGA PINTO E SILVA</option>
						<option value="LUIZ P.DE CARVALHO FILHO">LUIZ P.DE CARVALHO FILHO</option>
						<option value="LUIZA MACUCO">LUIZA MACUCO</option>
						<option value="LUPE PICASSO">LUPE PICASSO</option>
						<option value="LUSÍADA">LUSÍADA</option>
						<option value="MACKENZIE">MACKENZIE</option>
						<option value="MAGALI ALONSO">MAGALI ALONSO</option>
						<option value="MANOEL BENTO DA CRUZ">MANOEL BENTO DA CRUZ</option>
						<option value="MANOEL DE SOUZA MASSARABA">MANOEL DE SOUZA MASSARABA</option>
						<option value="MARCÍLIO DIAS">MARCÍLIO DIAS</option>
						<option value="MARECHAL DO AR EDUARDO GOMES">MARECHAL DO AR EDUARDO GOMES</option>
						<option value="MARECHAL RONDON">MARECHAL RONDON</option>
						<option value="MARGARIDA PINHO RODRIGUES">MARGARIDA PINHO RODRIGUES</option>
						<option value="MARGARIDA PINTO">MARGARIDA PINTO</option>
						<option value="MARIA APARECIDA PINTO DE ABREU MAGNO">MARIA APARECIDA PINTO DE ABREU MAGNO</option>
						<option value="MARIA DULCE MENDES">MARIA DULCE MENDES</option>
						<option value="MARIA LUIZA">MARIA LUIZA</option>
						<option value="MARIA MONTESSORI">MARIA MONTESSORI</option>
						<option value="MARISTA DE BRASÍLIA">MARISTA DE BRASÍLIA</option>
						<option value="MARISTA SÃO JOSÉ">MARISTA SÃO JOSÉ</option>
						<option value="MARISTA SÃO LUIS">MARISTA SÃO LUIS</option>
						<option value="MARQUES DE SAO VICENTE">MARQUES DE SAO VICENTE</option>
						<option value="MARQUES DE SAO VICENTE">MARQUES DE SAO VICENTE</option>
						<option value="MARTIM AFONSO">MARTIM AFONSO</option>
						<option value="MARTINS FONTES">MARTINS FONTES</option>
						<option value="MARZA">MARZA</option>
						<option value="MASTER">MASTER</option>
						<option value="MATHEO BEI">MATHEO BEI</option>
						<option value="MAURI GALIERA">MAURI GALIERA</option>
						<option value="METODISTA">METODISTA</option>
						<option value="MIGUEL DE CERVANTES">MIGUEL DE CERVANTES</option>
						<option value="MILTON BORGES IPIRANGA">MILTON BORGES IPIRANGA</option>
						<option value="MODERNO">MODERNO</option>
						<option value="MÓDULO">MÓDULO</option>
						<option value="MONTE SERRAT">MONTE SERRAT</option>
						<option value="NACIONAL">NACIONAL</option>
						<option value="NAÇÕES UNIDAS">NAÇÕES UNIDAS</option>
						<option value="NAPOLEÃO RODRIGUES LAUREANO">NAPOLEÃO RODRIGUES LAUREANO</option>
						<option value="NASCIMENTO">NASCIMENTO</option>
						<option value="NEVES PRADO MONTEIRO">NEVES PRADO MONTEIRO</option>
						<option value="NEW PORT HIGH SCHOOL">NEW PORT HIGH SCHOOL</option>
						<option value="NOBEL">NOBEL</option>
						<option value="NOSSA SENHORA DA ASSUNÇÃO">NOSSA SENHORA DA ASSUNÇÃO</option>
						<option value="NOSSA SENHORA DA DIVINA PROVIDÊNCIA">NOSSA SENHORA DA DIVINA PROVIDÊNCIA</option>
						<option value="NOSSA SENHORA DO CALVÁRIO">NOSSA SENHORA DO CALVÁRIO</option>
						<option value="NOSSA SENHORA DOS NAVEGANTES">NOSSA SENHORA DOS NAVEGANTES</option>
						<option value="NOTRE DAME">NOTRE DAME</option>
						<option value="NOVO MUNDO">NOVO MUNDO</option>
						<option value="NOVO TEMPO">NOVO TEMPO</option>
						<option value="O EXECUTIVO">O EXECUTIVO</option>
						<option value="OBJETIVO">OBJETIVO</option>
						<option value="OLGA CURY">OLGA CURY</option>
						<option value="OLIVEIRA JÚNIOR">OLIVEIRA JÚNIOR</option>
						<option value="OLIVIA FERNANDES">OLIVIA FERNANDES</option>
						<option value="OMEGA">OMEGA</option>
						<option value="ONIS">ONIS</option>
						<option value="ORDEM E PROGRESSO">ORDEM E PROGRESSO</option>
						<option value="OSWALDO CRUZ">OSWALDO CRUZ</option>
						<option value="OSWALDO LACERDA G. CARDIM">OSWALDO LACERDA G. CARDIM</option>
						<option value="OTTONIEL JUNQUEIRA">OTTONIEL JUNQUEIRA</option>
						<option value="PADRE JOSE DE ANCHIETA">PADRE JOSE DE ANCHIETA</option>
						<option value="PADRE MANOEL DA NÓBREGA">PADRE MANOEL DA NÓBREGA</option>
						<option value="PASTOR PAIVA">PASTOR PAIVA</option>
						<option value="PATRO HOMA">PATRO HOMA</option>
						<option value="PAULO FILGUEIRAS JUNIOR">PAULO FILGUEIRAS JUNIOR</option>
						<option value="PEDRO II">PEDRO II</option>
						<option value="PENTÁGONO">PENTÁGONO</option>
						<option value="PEQUENO PRINCIPE">PEQUENO PRINCIPE</option>
						<option value="PERALTA SAO PAULO">PERALTA SAO PAULO</option>
						<option value="PIO XII">PIO XII</option>
						<option value="PIRATININGA">PIRATININGA</option>
						<option value="PLURI">PLURI</option>
						<option value="PORTO SEGURO">PORTO SEGURO</option>
						<option value="POSITIVO">POSITIVO</option>
						<option value="POSITIVUS">POSITIVUS</option>
						<option value="PRADO MONTEIRO">PRADO MONTEIRO</option>
						<option value="PRELÚDIO">PRELÚDIO</option>
						<option value="PRESIDENTE KENNEDY">PRESIDENTE KENNEDY</option>
						<option value="PRIMEIRO DE MAIO">PRIMEIRO DE MAIO</option>
						<option value="PRIMEIRO PASSO">PRIMEIRO PASSO</option>
						<option value="PRIMO FERREIRA">PRIMO FERREIRA</option>
						<option value="PRISMA">PRISMA</option>
						<option value="PRIVILÉGIO">PRIVILÉGIO</option>
						<option value="PROF. ANTONIO FERREIRA DE ALMEIDA JR">PROF. ANTONIO FERREIRA DE ALMEIDA JR</option>
						<option value="PROF. FLORESTAN FERNANDES">PROF. FLORESTAN FERNANDES</option>
						<option value="PROF. PAULO DE ARRUDA PENTEADO">PROF. PAULO DE ARRUDA PENTEADO</option>
						<option value="PROFª EMÍLIA MARIA REIS">PROFª EMÍLIA MARIA REIS</option>
						<option value="PUERI MUNDI">PUERI MUNDI</option>
						<option value="RAMOS LOPEZ">RAMOS LOPEZ</option>
						<option value="RAQUEL DE CASTRO">RAQUEL DE CASTRO</option>
						<option value="RAQUEL DE CASTRO FERREIRA">RAQUEL DE CASTRO FERREIRA</option>
						<option value="RECANTO EDUCACIONAL">RECANTO EDUCACIONAL</option>
						<option value="REGINA ALTMAN">REGINA ALTMAN</option>
						<option value="REGINA MUNDI">REGINA MUNDI</option>
						<option value="REINALDO KUNTZ BUSH">REINALDO KUNTZ BUSH</option>
						<option value="RENE RODRIGUES DE MORAES ">RENE RODRIGUES DE MORAES </option>
						<option value="RENÊ VESCARTES">RENÊ VESCARTES</option>
						<option value="RENOVAÇÃO">RENOVAÇÃO</option>
						<option value="REPUBLICA DE PORTUGAL">REPUBLICA DE PORTUGAL</option>
						<option value="RICARDO JUDOCA S. CARDOSO">RICARDO JUDOCA S. CARDOSO</option>
						<option value="RIO BRANCO">RIO BRANCO</option>
						<option value="RITA DE CÁSSIA">RITA DE CÁSSIA</option>
						<option value="ROBERTO GALIEIRA">ROBERTO GALIEIRA</option>
						<option value="ROSA DA FONSECA">ROSA DA FONSECA</option>
						<option value="RUBENS PAIVA">RUBENS PAIVA</option>
						<option value="RUI BARBOSA">RUI BARBOSA</option>
						<option value="SALESIANO SÃO JOSÉ">SALESIANO SÃO JOSÉ</option>
						<option value="SANTA CECÍLIA">SANTA CECÍLIA</option>
						<option value="SANTA CRUZ DOS NAVEGANTES">SANTA CRUZ DOS NAVEGANTES</option>
						<option value="SANTA INÊS">SANTA INÊS</option>
						<option value="SANTA ISABEL">SANTA ISABEL</option>
						<option value="SANTA MARIA">SANTA MARIA</option>
						<option value="SANTA RITA">SANTA RITA</option>
						<option value="SANTA ROSA">SANTA ROSA</option>
						<option value="SANTISTA">SANTISTA</option>
						<option value="SAO DOMINGOS">SAO DOMINGOS</option>
						<option value="SÃO GABRIEL DE NOSSA SRA. DAS DORES">SÃO GABRIEL DE NOSSA SRA. DAS DORES</option>
						<option value="SÃO JOSÉ">SÃO JOSÉ</option>
						<option value="SAO LEOPOLDO">SAO LEOPOLDO</option>
						<option value="SAO MARCOS">SAO MARCOS</option>
						<option value="SÃO SEBASTIÃO DE ENSINO FUND. E MÉDIO">SÃO SEBASTIÃO DE ENSINO FUND. E MÉDIO</option>
						<option value="SEDES SAPIENTIAE">SEDES SAPIENTIAE</option>
						<option value="SENIOR - URSA MAIOR">SENIOR - URSA MAIOR</option>
						<option value="SESI">SESI</option>
						<option value="SIGMA">SIGMA</option>
						<option value="SOUTHERN ASSOCIATION OF COLLEGES AND SCHOOLS">SOUTHERN ASSOCIATION OF COLLEGES AND SCHOOLS</option>
						<option value="STELLA MARIS">STELLA MARIS</option>
						<option value="SUETONIO BITTENCOURT">SUETONIO BITTENCOURT</option>
						<option value="SYLVIA DE MELLO">SYLVIA DE MELLO</option>
						<option value="TECNICA FORTEC">TECNICA FORTEC</option>
						<option value="TERCEIRO MILÊNIO">TERCEIRO MILÊNIO</option>
						<option value="TEREZA SILVEIRA DE ALMEIDA">TEREZA SILVEIRA DE ALMEIDA</option>
						<option value="TRADIÇÃO">TRADIÇÃO</option>
						<option value="TREINASSE">TREINASSE</option>
						<option value="UFES">UFES</option>
						<option value="ULYSSES GUIMARAES">ULYSSES GUIMARAES</option>
						<option value="UNIVERSITÁRIO">UNIVERSITÁRIO</option>
						<option value="UNIVERSITAS">UNIVERSITAS</option>
						<option value="UNIVERSO">UNIVERSO</option>
						<option value="USINA HENRY BORDEN">USINA HENRY BORDEN</option>
						<option value="VALRIBEIRA DE 1º e 2º  GRAUS">VALRIBEIRA DE 1º e 2º GRAUS</option>
						<option value="VERA CRUZ">VERA CRUZ</option>
						<option value="VERDE QUE TE QUERO VERDE">VERDE QUE TE QUERO VERDE</option>
						<option value="VERITAS">VERITAS</option>
						<option value="VERTÉX">VERTÉX</option>
						<option value="VICENTE DE CARVALHO">VICENTE DE CARVALHO</option>
						<option value="VILMA CATHARINA M LEONE">VILMA CATHARINA M LEONE</option>
						<option value="VINTE OITO DE FEVEREIRO">VINTE OITO DE FEVEREIRO</option>
						<option value="VIRGEM MARIA">VIRGEM MARIA</option>
						<option value="VISCONDE DE SÃO LEOPOLDO">VISCONDE DE SÃO LEOPOLDO</option>
						<option value="VITAS">VITAS</option>
						<option value="VIVER">VIVER</option>
						<option value="WALDEMAR DA SILVA RIGOTTO">WALDEMAR DA SILVA RIGOTTO</option>
						<option value="WALTER SHEPPIS">WALTER SHEPPIS</option>
						<option value="YEDA MARIA">YEDA MARIA</option>
						<option value="YOLANDA CONTE ">YOLANDA CONTE </option>
						<option value="ZULMIRA CAMPOS">ZULMIRA CAMPOS</option>
						<option value="ZULMIRA DE ALMEIDA LAMBERT">ZULMIRA DE ALMEIDA LAMBERT</option>
						<option value="1">Outra</option>
					</select>
		    	</div>
	    	</div>

	    	<div class="row contem_escola_origem" style="display: none;">
				<div class="input-field col l12 m12 s12">
		          	<input id="outra_escola" type="text" class="outra_escola" name="outra_escola">
		          	<label for="outra_escola">Escola de origem</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="rg" type="text" class="rg" name="rg">
		          	<label for="rg">RG</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="cep" type="text" class="cep" name="cep">
		          	<label for="cep">CEP</label>
		    	</div>
	    	</div>
	    	<style>
				input[type=number]::-webkit-inner-spin-button, 
				input[type=number]::-webkit-outer-spin-button { 
					-webkit-appearance: none; 
					margin: 0; 
				}
			</style>
	    	<div class="row">
				<div class="input-field col l9 m12 s12">
		          	<input id="endereco" type="text" class="endereco" name="endereco">
		          	<label for="endereco">Endereço</label>
		    	</div>

				<div class="input-field col l1 m6 s6">
		          	<input id="numero" type="number" class="numero" name="numero">
		          	<label for="numero">Nº</label>
		    	</div>

				<div class="input-field col l2 m6 s6">
		          	<input id="complemento" type="text" class="complemento" name="complemento">
		          	<label for="complemento">Complemento</label>
		    	</div>
		    </div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="bairro" type="text" class="bairro" id="bairro" name="bairro">
		          	<label for="bairro">Bairro</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="cidade" type="text" class="cidade" id="cidade" name="cidade">
		          	<label for="cidade">Cidade</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="telefone" type="number" class="telefone" name="telefone">
		          	<label for="telefone">Telefone</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<div class="input-field col l12 m12 s12">
		          	<input id="email" type="email" class="email" name="email">
		          	<label for="email">Email</label>
		    	</div>
	    	</div>

	    	<div class="row">
				<label class="col l12 m12 s12">Como soube do concurso</label>
				<div class="input-field col l12 m12 s12">
					<select class="browser-default como_soube" id="como_soube" name="como_soube">
		          		<option value="0" disabled selected>Informe como soube do concurso</option>
		          		<option value="Indicação">Indicação</option>
		          		<option value="Jornal ou Revista">Jornal ou Revista</option>
		          		<option value="Rádio">Rádio</option>
		          		<option value="Redes Sociais">Redes Sociais</option>
		          		<option value="Site ou Instituição">Site ou Instituição</option>
		          		<option value="1">Outros</option>
		          	</select>
		    	</div>
	    	</div>

	    	<div class="row contem_como_outro" style="display: none;">
				<div class="input-field col l12 m12 s12">
		          	<input id="como_outro" type="text" class="como_outro" name="como_outro">
		          	<label for="como_outro">Como soube do concurso</label>
		    	</div>
	    	</div>

			<%if total_candidatos_3EM < 160 then%>
		    	<div class="row">
			    	<div class="col l12 m12 s12">
			    		<input type="checkbox" id="diadoaluno" class="filled-in diadoaluno" value="1" name="diadoaluno">		    		
			    		<label for="diadoaluno">Quero participar da <a href="#/sobre" target="_blank">aula de revisão</a>, dia 10 de agosto, das 14h às 17h15.</label>
			    	</div>
				</div>
			<%else%>
				<div class="row">
			    	<div class="col l12 m12 s12">
			    		<input type="checkbox" id="diadoaluno" class="filled-in diadoaluno" value="1" name="diadoaluno" disabled="disabled">		    		
			    		<label for="diadoaluno">Quero participar da <a href="#/sobre" target="_blank">aula de revisão</a>, dia 10 de agosto, das 14h às 17h15. - <span class="red-text">ESGOTADO</span></label>
			    	</div>
				</div>
				<!-- <div class="row">
			    	<div class="col l12 m12 s12">
			    		<input type="checkbox" id="diadoaluno2" class="filled-in diadoaluno" value="2" name="diadoaluno">		    		
			    		<label for="diadoaluno2">Quero participar da <a href="#/revisao" target="_blank">aula de revisão </a> (segunda turma),  dia 12 de agosto, das 15h às 18h.</label>
			    	</div>
				</div> -->
			<%end if%>

	    	<div class="row">
		    	<div class="col l12 m12 s12">
		    		<input type="checkbox" id="termo" class="filled-in termo">
					<label for="termo">Confirmo que li e concordo com o <a href="#/regulamento" target="_blank">regulamento</a> 
					 deste concurso de bolsas. </label>
		    	</div>
			</div>

	    	<button class="right btn waves-effect waves-teal right yellow darken-2" type="submit" name="action">Enviar
			</button>
		</form>
		<%else%>
			<div class="row">
				<div class="container center">
					Incrições encerradas
				</div>
			</div>
		<%end if%>
	</div>
</div>