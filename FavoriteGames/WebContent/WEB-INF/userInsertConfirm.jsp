<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>ユーザー登録確認画面</title>
</head>
<body>
<div id="insertUserConfirm">
  <p>これでよろしいですか？</p>

  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="userInsertConfirm" method="post">
    <fieldset id="insertUserConfirm_form">
      <div>
        <label>ID：</label>
        <input type="text" name="loginId"
          value="${fn:escapeXml(sessionInfo.registerUser.loginId)}"
          readonly>
      </div>
      <div>
        <label>名前：</label>
        <input type="text" name="userName"
          value="${fn:escapeXml(sessionInfo.registerUser.userName)}"
          readonly>
      </div>
      <div>
        <label>年代：</label>
        <input type="text" name="ageName"
          value="${fn:escapeXml(sessionInfo.registerUser.ageStr)}"
          readonly>
      </div>
      <div>
        <label>PASS（再入力）：</label>
        <input type="password" name="rePass">
      </div>
    </fieldset>
    <p><button class="link" type="submit" name="resister" value="resister">登録</button><p>
  </form>
  <div>
    <p><a class="link" href="mypage?selectPage=mypage">マイページ</a></p>
  </div>
</div>
</body>
</html>