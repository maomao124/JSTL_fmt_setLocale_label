<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_fmt_setLocale_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/2
  Time(创建时间)： 21:00
  Description(描述)：
  JSTL <fmt:setLocale> 标签用于设置用户本地化环境。
JSP <fmt:setLocale> 标签的语法如下：
<fmt:setLocale value="localcode" [scope="page|request|session|application"] [variant="variant"]>
其中：
localcode：代表语言代码，例如，ZH、EN。也可以在后面加上国家或者地区的两位数代码，中间用_连接，如 zh_TW（中国台湾地区）、zh_HK（中国香港）。
variant：可选项，用于设置浏览器的类型，例如，win 代表 Windows。
scope：可选项，用于设置其有效范围，默认为 page。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setAttribute("localeList", Locale.getAvailableLocales());
    //返回所有已安装语言环境的数组。
    // 返回的数组表示 Java 运行时环境和已安装的LocaleServiceProvider实现所支持的语言环境的联合。
    // 它必须至少包含一个等于Locale.US的Locale实例。
%>
<table border="1">
    <tr class="title">
        <th>Locale</th>
        <th>Language</th>
        <th>Date and Time</th>
        <th>Number</th>
        <th>currency</th>
    </tr>
    <jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
    <c:forEach var="locale" items="${localeList }">
        <fmt:setLocale value="${locale }" />
        <tr>
            <td align="left">${locale.displayName }</td>
            <td align="left">${locale.displayLanguage }</td>
            <td><fmt:formatDate value="${date }" type="both" /></td>
            <td><fmt:formatNumber value="10000.5" /></td>
            <td><fmt:formatNumber value="10000.5" type="currency" /></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
