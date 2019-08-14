<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>ソフト情報更新画面</title>
</head>
<body>
<div id="updateSoft">

  <p>更新するソフト名を入力してください</p>

  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="softUpdate" method="post">
    <fieldset id="updateSoft_form">
    <div>
      <label class="item">ソフト名：</label>
      <input type="text" name="softName"
          value="${fn:escapeXml(param.softName)}">
      <c:if test="${not empty softNameErrMsg}">
        <p class="error">${fn:escapeXml(softNameErrMsg)}</p>
      </c:if>
    </div>
    <p><button class="link" type="submit">確認</button></p>
   </fieldset>
  </form>
  <p>忘れた場合は<a class="link" href="mypage?selectPage=select">こちら</a>へ</p>
  <div>
      <a class="link" href="mypage?selectPage=mypage">マイページ</a>
  </div>
</div>
</body>
</html>