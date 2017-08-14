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
<h2 class="center titulo-pagina blue-text text-darken-4"></h2>
<div class="conteudo-inscricoes">
	<div class="container">
		<div class="row">
			<div class=" col l6 offset-l3 row red white-text center" style="padding:20px; font-size:20px;margin-top:220px;margin-bottom:220px;">Inscrições encerradas</div>
		</div>
	</div>
</div>