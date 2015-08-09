<%@ attribute name="runat" required="true" rtexprvalue="true" %>
<%@ tag body-content="scriptless" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${runat == 'client' or runat == 'both'}">
    <script type="text/javascript">
        <jsp:doBody/>
    </script>
</c:if>

<c:if test="${runat == 'server' or runat == 'both'}">
    <jsp:doBody var="source"/>
    <%
        jsee.util.JSUtil.runScript(
                (String) jspContext.getAttribute("source"),
                (PageContext) jspContext);
    %>
</c:if>