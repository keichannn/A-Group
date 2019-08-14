<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/common.css">
<title>マイページ画面</title>
</head>
<body>
<div id="mypage">
  <h1 class="color_and_fontWeight" class="page_title">管理画面</h1>
  <p><span id="mypage_userName" class="fontWeight">${fn:escapeXml(sessionInfo.loginUser.userName)}</span>さん、こんにちは！</p>
  <p>あなたのIDは<span id="user_id">【${fn:escapeXml(sessionInfo.loginUser.id)}】</span>です</p>

  <p>
    <a class="link" href="mypage?selectPage=select">検索</a>
  </p>
    <p>
      <a class="link" href="mypage?selectPage=insert">登録</a>
    </p>
    <p>
      <a class="link" href="mypage?selectPage=update">更新</a>
    </p>
    <p>
      <a class="link" href="mypage?selectPage=delete">削除</a>
    </p>
  <div id="link_bottom">
    <a class="link" href="review">口コミ</a>
    <a class="link" id="logout" href="logout">ログアウト</a>
    <a class="link" href="userDelete?selectPage=userDeletePage">退会</a>
  </div>
</div>
</body>
</html>