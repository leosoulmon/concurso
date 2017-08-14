<%@LANGUAGE="VBSCRIPT"%> 
<!-- #include virtual="/concurso/partials/header_print.asp" -->
<!--#include file="../../Connections/formulario_bolsadeestudos.asp" -->
<%
Response.charset = "ISO 8859-1"

'PARA QUE A PÁGINA EXPIRE AO SER CARREGADA E QUE NÃO SEJA ARMAZENADA EM CACHE - CONTROLE EM ASP IMPLEMENTADO EM 23/09/2011 11:54
    Response.Expires = 0 'TEMPO PARA EXPIRAR = 0 segundos, IMEDIATAMENTE
    Response.Expiresabsolute = Now() - 1 'QUANDO EXPIRAR Now() - 1 = Ontem
    Response.AddHeader "pragma","no-cache" 'INFORMA AO SERVIDOR PROXY PARA ELE NÃO ARMAZENAR EM CACHE ESTA PÁGINA
    Response.AddHeader "cache-control","private" 'INFORMA AO SERVIDOR PROXY QUE O CONTROLE DE CACHE NÃO É PÚBLICO E SIM PRIVADO AO SERVIDOR DO COLÉGIO
    Response.CacheControl = "no-cache" 'ENFIM INFORMAMOS QUE A PÁGINA, CUJO CONTROLE DE CACHE É DO SERVIDOR, NÃO SERÁ ARMAZENADA EM CACHE

'COMANDO PARA A CONTAGEM DE INSCRITOS NO BANCO DE DADOS'

if request("a")="" then
ano = Year(Now())
else
ano = request("a")
end if

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

Set candidatos_1EM = Server.CreateObject("ADODB.RecordSet")
candidatos_1EM.ActiveConnection = MM_formulario_bolsadeestudos_STRING
MM_editQuery_1EM = "SELECT * FROM candidatos WHERE cd_ano_EM = 1 AND YEAR(dt_postagem) = " & ano & "" & query_auxiliar & " ORDER BY nm_aluno, dt_postagem"
candidatos_1EM.Source = MM_editQuery_1EM
candidatos_1EM.CursorType = 0
candidatos_1EM.CursorLocation = 3 'CursorLocation tipo 3 indica que o cursor vai rodar no cliente adUseClient
candidatos_1EM.LockType = 3
candidatos_1EM.Open()
total_candidatos_1EM = candidatos_1EM.RecordCount


Set candidatos_3EM = Server.CreateObject("ADODB.RecordSet")
candidatos_3EM.ActiveConnection = MM_formulario_bolsadeestudos_STRING
'MM_editQuery_3EM = "SELECT * FROM candidatos WHERE cd_ano_EM = 1 AND YEAR(dt_postagem) = " & ano & "" & query_auxiliar & " ORDER BY nm_aluno, dt_postagem"
MM_editQuery_3EM = "SELECT * FROM candidatos WHERE cd_ano_EM = 1 AND YEAR(dt_postagem) = " & ano & "" & query_auxiliar & " and cd_confirmacao_diadoaluno = true ORDER BY nm_aluno, dt_postagem"
candidatos_3EM.Source = MM_editQuery_3EM
candidatos_3EM.CursorType = 0
candidatos_3EM.CursorLocation = 3 'CursorLocation tipo 3 indica que o cursor vai rodar no cliente adUseClient
candidatos_3EM.LockType = 3
candidatos_3EM.Open()
total_candidatos_3EM = candidatos_3EM.RecordCount

	dt_inicial = "01/01/"&year(now())
	dt_atual = date()
	ano_atual = year(dt_atual)
	semana_atual = CStr(CInt(DateDiff("ww", dt_inicial, dt_atual)) + 1)
	dia_semana = weekday(dt_atual)
	dia_semana_extenso = weekdayname(weekday(dt_atual))

function Gera2(valores)
	dim validos
	validos = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	Randomize
	for i = 1 to valores
		num = mid(validos, Int(35 * Rnd) + 1, 1)
		chave = chave + num
	next
	Gera2 = chave
end function

dim CODIGOALEATORIO
CODIGOALEATORIO = Gera2(30)
if (Request("Gera2(30)") <> "") then CODIGOALEATORIO = Request("Gera2(30)")
ip_usuario = Request.ServerVariables("remote_addr")
nome = request.form("nome")&" "&request.form("sobrenome")
dt_nascimento = request.form("dt_nascimento")
nomeresponsavel = request.form("nm_reponsavel")
ano = "1"
rg = request.form("rg")
endereco = request.form("endereco")&" "&request.form("numero")&" "&request.form("complemento")
bairro = request.form("bairro")
cidade = request.form("cidade")
CEP = request.form("CEP")
telefone = request.form("telefone")
email = request.form("email")
diadoaluno = request.form("diadoaluno")
nomeescolaorigem = request.form("escola_origem")
outra_escola = request.form("outra_escola")
como_soube = request.form("como_soube")
como_outro = request.form("como_outro")


if diadoaluno = "1" then
	aula = 1
else
	aula = 0
end if

if diadoaluno = "1" then
	diadoaluno = True
else
	diadoaluno = False
end if

if nomeescolaorigem = "1" then
	nomeescolaorigem = outra_escola
end if

if como_soube = "1" then
	como_soube = como_outro
end if

if total_candidatos_3EM > 159 then
	diadoaluno = False
	encerrar = 1
end if

assunto = "Formulário - Bolsa de Estudos"
destino = "bolsadeestudo@jeanpiaget.g12.br"
end_obrigado = "/concurso/"
cd_inscricao = CODIGOALEATORIO

'ARMAZENAMENTO NO BANCO DE DADOS DAS INFORMAÇÕES DO FORMULÁRIO
'comando para a inserir inscritos'
Set MM_editCmd = Server.CreateObject("ADODB.Command")
MM_editCmd.ActiveConnection = MM_formulario_bolsadeestudos_STRING
MM_dbFields="cd_ano_EM,nm_aluno,dt_nascimento,nm_escola_origem,cd_rg,nm_responsavel,nm_endereco_residencial,nm_bairro,nm_cidade,cd_CEP,cd_telefone,nm_email,dt_postagem,ip_usuario,cd_inscricao,cd_confirmacao_diadoaluno,comosoube,cd_confirmacao_diadoaluno2"

MM_dbValues=ano&",'"&nome&"','"&dt_nascimento&"','"&nomeescolaorigem&"','"&rg&"','"&nomeresponsavel&"','"&endereco&"','"&bairro&"','"&cidade&"','"&CEP&"','"&telefone&"','"&email&"','"&now()&"','"&ip_usuario&"','"&cd_inscricao&"',"&diadoaluno&",'"&como_soube&"',"&aula&""

MM_editQuery = "insert into candidatos (" & MM_dbFields & ") values (" & MM_dbValues & ")"
MM_editCmd.CommandText = MM_editQuery

'response.write(total_candidatos_1EM)
'response.write("<br>")
'response.write(total_candidatos_3EM)
'response.write("<br>")
'response.write(diadoaluno)
'response.write("<br>")
'response.write(encerrar)
'response.write("<br>")
'response.write("<br>")

if total_candidatos_1EM > 299 then%>
	<script>
  		alert('Desculpe, o número máximo de inscrições foi atingido.');
  		window.location = '/concurso/';
  	</script>
<%
else
	if encerrar = 1 then
%>
<script>
	//alert('As aulas de revisão estão encerradas.');
	//window.location = '/concurso/';
</script>	
<%
	end if
		on error resume next
		MM_editCmd.Execute
		if err<>0 then
			Response.Write("Ocorreu um erro!! <br><br>")
			for each err in err.Errors
				response.write("<p>")
				response.write("Description: ")
				response.write(err.Description & "<br>")
				response.write("Help context: ")
				response.write(err.HelpContext & "<br>")
				response.write("Help file: ")
				response.write(err.HelpFile & "<br>")
				response.write("Native error: ")
				response.write(err.NativeError & "<br>")
				response.write("Error number: ")
				response.write(err.Number & "<br>")
				response.write("Error source: ")
				response.write(err.Source & "<br>")
				response.write("SQL state: ")
				response.write(err.SQLState & "<br>")
				response.write("</p>")
				Response.write(err.Errors)
			next
		end if
	end if
MM_editCmd.ActiveConnection.Close


'ENVIO DO FORMULÁRIO POR EMAIL
Set Mail = Server.CreateObject("Persits.MailSender") 
Mail.Reset
Mail.Host = "firstclass.jeanpiaget.g12.br" 
Mail.From = email 
Mail.FromName = nome  
Mail.AddAddress destino 
Mail.Subject = assunto & " - " & ano & "º ano do Ens. Médio de 2018"
	mensagem = "<html><head><link rel=stylesheet href=/concurso/css/layout_cb.css /><link rel=stylesheet href=/concurso/css/comprovante_responsivo.css /><meta http-equiv=Content-Type content=text/html; charset=ISO 8859-1><title>" & assunto & "</title></head><body class=relInscricao>"
	mensagem = mensagem & " <h2> Comprovante de inscrição <br> Concurso de Bolsas - Colégio Jean Piaget</h2>" & ""
	mensagem = mensagem & " Candidato para o primeiro ano do Ensino Médio de 2018" & vbcrlf & "<br><br>"
	mensagem = mensagem & " Nome: " & nome & vbcrlf & "<br>"
	mensagem = mensagem & " Data de nascimento: " & FormatDateTime(dt_nascimento) & vbcrlf & "<br>"
	mensagem = mensagem & " Escola de Origem: " & nomeescolaorigem & vbcrlf & "<br>"
	mensagem = mensagem & " RG: " & rg & vbcrlf & "<br>"
	mensagem = mensagem & " Nome do responsável: " & nomeresponsavel & vbcrlf & "<br>"
	'mensagem = mensagem & " Endereço: " & endereco & vbcrlf & "<br>"
	'mensagem = mensagem & " Bairro: " & bairro & vbcrlf & "<br>"
	'mensagem = mensagem & " Cidade: " & cidade & vbcrlf & "<br>"
	'mensagem = mensagem & " CEP: " & CEP & vbcrlf & "<br>"
	'mensagem = mensagem & " Telefone: " & telefone & vbcrlf & "<br>"
	'mensagem = mensagem & " E-mail: " & email & vbcrlf & "<br>"
	mensagem = mensagem & " Data da inscrição: " & now() & vbcrlf & "<br>"
	mensagem = mensagem & " Código de inscrição: <font face='Verdana, Arial, Helvetica, sans-serif' size='2' color='#006699'>" & cd_inscricao & vbcrlf & "</font><br><br>"

	mensagem = mensagem & "<p style='text-align:justify;'> <font >O <strong>Concurso de Bolsas de Estudo do Colégio Jean Piaget</strong>, destinado a alunos que irão cursar o 1º ano do Ensino Médio em 2018, acontecerá no dia <strong>12 de agosto</strong>, <strong>das 9h às 12h</strong>, nas dependências da unidade de Ensino Médio do Colégio, <strong>Rua Almirante Cochrane, 136 - Aparecida - Santos.</strong></font></p>"



	mensagem = mensagem & "<p> <font color=red><strong>Atenção!</strong><br> - Chegue ao local da prova com pelo menos 15 minutos de antecedência. <br> - Imprima este comprovante e leve com você, juntamente com seu RG original, no dia da prova.</font></p>"

	

	if diadoaluno = True then
		mensagem = mensagem & " <div style='border:solid; padding:10px;'>Você optou por participar da aula de revisão no dia 10 de agosto, das 14h às 17h15. Esperamos por você. </div>"
	end if
	
	mensagem = mensagem & "</body></html>"
Mail.Body = mensagem
Mail.IsHTML = True
On Error Resume Next 
Mail.Send 

Mail.Reset
Mail.Host = "firstclass.jeanpiaget.g12.br" 
Mail.From = email 
Mail.FromName = nome  
Mail.AddAddress email 
Mail.Subject = assunto & " - " & ano & "º ano do Ens. Médio de 2017"
Mail.Body = mensagem
Mail.IsHTML = True
On Error Resume Next 
Response.Write(mensagem)
Response.Write("<br><a type='submit' name='Submit' class='btnPr print' onClick='window.print()'>&raquo; Imprimir </a>")
Response.End()
%>
