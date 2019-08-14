<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>ソフト情報検索画面</title>
</head>
<body>
<div id="select">

  <p>
    検索したいデータ情報を入力してください<br> ※全て空白の場合は全検索を行います
  </p>

  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="softSelect">
     <label>名前：</label>
     <input type="text" name="softName" value="${fn:escapeXml(param.softName)}">
    <button class="link" type="submit">検索</button>
  </form>
  <div>
    <p><a class="link" href="mypage?selectPage=mypage">マイページ</a></p>
  </div>
</div>
</body>
</html>