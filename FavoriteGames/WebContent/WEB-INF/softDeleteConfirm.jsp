<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ソフト情報削除確認画面</title>
<link href="css/common.css" rel="stylesheet">
</head>
<body>
<div id="deleteSoftConfirm">
  <p>これでよろしいですか？</p>

  <form action="softDeleteConfirm" method="post">
    <fieldset id="deleteSoftConfirm_form">
      <div>
        <label class="item">ソフト名：</label>
        <input type="text" name="userName"
          value="${fn:escapeXml(deleteSoft.softName)}" readonly>
      </div>
      <div>
        <label class="item">ジャンル：</label>
        <input type="text" name="genre"
          value="${fn:escapeXml(deleteSoft.genreStr)}" readonly>
      </div>
      <div>
        <label class="item">機種　：</label>
        <input type="text" name="model"
          value="${fn:escapeXml(deleteSoft.modelStr)}" readonly>
      </div>
      <input type="hidden" name="Id"
        value="${fn:escapeXml(deleteSoft.id)}" />
    <div>
      <label class="item">発売日：</label>
      <input type="text" name="releaseDate"
        value="${fn:escapeXml(deleteSoft.releaseDate)}" readonly>
    </div>
    <div>
      <label class="item">価格　：</label>
       <input type="text" name="price"
        value="${fn:escapeXml(deleteSoft.price)}" readonly>
    </div>
    <p><button class="link" type="submit">削除</button></p>
    </fieldset>
  </form>
  <div>
    <p><a class="link" href="mypage?selectPage=mypage">マイページ</a></p>
  </div>
</div>
</body>
</html>