<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>登録確認画面</title>
</head>
<body>

<div id="insertSoftConfirm">
  <p>これでよろしいですか？</p>

  <form action="softInsertConfirm" method="post">
    <fieldset id="insertSoftConfirm_form">
      <div>
        <label class="item">ソフト名：</label>
        <input type="text" name="softName"
               value="${fn:escapeXml(sessionInfo.registerSoft.softName)}" readonly>
      </div>
      <div>
        <label class="item">ジャンル：</label>
        <input type="text" name="genreStr"
               value="${fn:escapeXml(sessionInfo.registerSoft.genreStr)}" readonly>
      </div>
      <div>
        <label class="item">機種　：</label>
        <input type="text" name="modelStr"
               value="${fn:escapeXml(sessionInfo.registerSoft.modelStr)}" readonly>
      </div>
            <div>
        <label class="item">発売日：</label>
        <input type="text" name="releaseDate"
               value="${fn:escapeXml(sessionInfo.registerSoft.releaseDate)}">
      </div>
      <div>
        <label class="item">価格　：</label>
        <input type="text" name="price"
               value="${fn:escapeXml(sessionInfo.registerSoft.price)}">
      </div>
    </fieldset>
    <p><button class="link" type="submit" name="resister" value="confirm">確認</button></p>
  </form>
  <div>
    <p><a class="link" href="mypage?selectPage=mypage">マイページ</a></p>
  </div>
</div>

</body>
</html>