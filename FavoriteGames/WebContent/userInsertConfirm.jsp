<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="1740;URL=top">
<link href="css/common.css" rel="stylesheet">
<link rel="stylesheet" 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>ユーザ登録確認画面</title>
</head>

<body style="background-image: url(pictures/top.PNG); background-size:cover">

  <div style="position: fixed; top: 0px; width: 100%; height: 120px; z-index: 2"
		class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav4" aria-controls="navbarNav4"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<h1 class="text-white">ユーザ登録確認画面</h1>
		<div class="collapse navbar-collapse justify-content-end">
			<ul class="navbar-nav">
			    <li class="nav-item active">
				  <a style="font-size: 20px; font-weight: bold; cursor: pointer;" class="nav-link"
					 href="top" >TOP
				  </a>
			    </li>
			    <li class="nav-item active">
				  <a style="font-size: 20px; font-weight: bold; cursor: pointer;" class="nav-link"
					 onclick="history.back(); return false;" >戻る
				  </a>
			    </li>
			</ul>
		</div>
  </div>


<div id="insertUserConfirm">
  <p class="fontWeight" style="font-size: 120%;">これでよろしいですか？</p>

  <form action="userInsertConfirm" method="post">
    <fieldset id="insertUserConfirm_form">
      <div>
        <label>ID　：</label>
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
          <c:if test="${not empty errMsg}">
    	    <p class="error" style="margin-top: 2%;">${fn:escapeXml(errMsg)}</p>
  		  </c:if>
      </div>
    </fieldset>
    <p><button class="link_2" type="submit" name="resister" value="resister">登録</button><p>
  </form>
</div>
</body>
</html>