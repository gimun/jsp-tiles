<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index Page</title>
</head>
<body>
서버 : <%=application.getServerInfo() %> <br>

서블릿 : <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> <br>

JSP : <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %> <br>

<%--
    서버 : Apache Tomcat/9.0.33
    서블릿 : 4.0
    JSP : 2.3
--%>
</body>
</html>
