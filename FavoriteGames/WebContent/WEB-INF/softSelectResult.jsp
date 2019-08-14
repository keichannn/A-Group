<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>ソフト情報一覧画面</title>
</head>
<body>
<div id="selectResult">
  <table id="selectResult_table" style="border:3px black solid;">
    <thead>
      <tr>
        <th>ID</th>
        <th>ソフト</th>
        <th>ジャンル</th>
        <th>機種</th>
        <th>発売日</th>
        <th>価格</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="soft" items="${softList}">
        <tr class="selectResult_table_tr">
          <td><a href="softUpdate">${fn:escapeXml(soft.id)}</a></td>
          <td>${fn:escapeXml(soft.softName)}</td>
          <td>${fn:escapeXml(soft.genreStr)}</td>
          <td>${fn:escapeXml(soft.modelStr)}</td>
          <td>${fn:escapeXml(soft.releaseDate)}</td>
          <td>${fn:escapeXml(soft.price)}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <div>
    <p><a class="link" href="mypage?selectPage=mypage">マイページ</a></p>
    <p><a class="link" href="mypage?selectPage=update">更新</a></p>
       <p> <a class="link" href="mypage?selectPage=delete">削除</a>
  </div>
</div>
</body>
</html>