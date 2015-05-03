<%@ include file="/WEB-INF/template/include.jsp" %>

<%@ page import="org.openmrs.web.WebConstants" %>
<%
	pageContext.setAttribute("redirect", session.getAttribute(WebConstants.OPENMRS_LOGIN_REDIRECT_HTTPSESSION_ATTR));
	session.removeAttribute(WebConstants.OPENMRS_LOGIN_REDIRECT_HTTPSESSION_ATTR); 
%>

<br/>
<script>
    function loginForm() {
        document.myform.action = "http://healthtopia.club/openmrs/loginServlet";
        document.myform.submit();
    }
</script>
<form method="post" action="loginServlet" style="padding:15px; width: 300px;" autocomplete="off">

	<br/>
	
	<c:if test="${not param.noredirect}">
		<c:choose>
			<c:when test="${not empty model.redirect}">
				<input type="hidden" name="redirect" value="${model.redirect}" />
			</c:when>
			<c:when test="${redirect != ''}">
				<input type="hidden" name="redirect" value="${redirect}" />
			</c:when>
			<c:otherwise>
				<input type="hidden" name="redirect" value="" />
			</c:otherwise>
		</c:choose>
		
		<input type="hidden" name="refererURL" value='<request:header name="referer" />' />
	</c:if>
	
</form>

<openmrs:extensionPoint pointId="org.openmrs.login" type="html" />

<script type="text/javascript">
 document.getElementById('username').focus();
</script>