<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>ログイン画面</title>
</head>
<body>
<div id="login">
  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="login" method="post">
    <fieldset id="login_form">
      <div>
        <label>ID　　：</label>
        <input type="text" name="loginId"
          value="${fn:escapeXml(param.loginId)}">
        <c:if test="${not empty idErrMsg}">
          <p class="error">${fn:escapeXml(idErrMsg)}</p>
        </c:if>
      </div>
        <label>PASS：</label>
        <input type="password" name="pass"
          value="${fn:escapeXml(param.pass)}">
        <c:if test="${not empty passErrMsg}">
          <p class="error">${fn:escapeXml(passErrMsg)}</p>
        </c:if>
      <p><button class="link" type="submit">ログイン</button></p>
    </fieldset>
  </form>
    <p><a class="link" href="top">TOP</a></p>
</div>
</body>
</html>