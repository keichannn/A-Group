<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ソフト情報削除画面</title>
<link href="css/common.css" rel="stylesheet">
</head>
<body>
<div id="deleteSoft">
  <p>
    削除するソフト名を入力してください<br>
  </p>

  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="softDelete" method="post">
   <fieldset id="deleteSoft_form">
    <div>
      <label id="item">ソフト名：</label>
      <input type="text" name="softName"
         value="${fn:escapeXml(param.softName)}">
      <c:if test="${not empty softNameErrMsg}"><br>
        <p class="error">${fn:escapeXml(softNameErrMsg)}</p>
      </c:if>
    </div>
    <p><button class="link" type="submit" name="selectButton" value="confirm">確認</button></p>
    </fieldset>
  </form>
  <p>忘れた場合は<a class="link" href="mypage?selectPage=select">こちら</a>へ</p>
  <div>
    <a class="link" href="mypage?selectPage=mypage">マイページ</a>
  </div>
  </div>
</body>