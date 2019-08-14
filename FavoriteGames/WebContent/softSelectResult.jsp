<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="1740;URL=logout">
<link href="css/common.css" rel="stylesheet">
<link rel="stylesheet" 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>ソフト情報一覧画面</title>
</head>

<body style="background-image: url(pictures/top.PNG); background-size:cover">

  <div style="position: fixed; top: 0px; width: 100%; height: 120px; z-index: 2"
		class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav4" aria-controls="navbarNav4"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<h1 class="text-white">ソフト情報一覧画面</h1>
		<div class="collapse navbar-collapse justify-content-end">
			<ul class="navbar-nav">
				<li class="nav-item active">
				  <a style="font-size: 20px; font-weight: bold" class="nav-link"
					 href="logout">ログアウト
			      </a>
			    </li>
				<li class="nav-item active">
				  <a style="font-size: 20px; font-weight: bold" class="nav-link"
					 href="userDelete?selectPage=userDeletePage">退会
				  </a>
			    </li>
			    <li class="nav-item active">
				  <a style="font-size: 20px; font-weight: bold; cursor: pointer;" class="nav-link"
				     href="mypage.jsp">マイページ
				  </a>
			    <li class="nav-item active">
				  <a style="font-size: 20px; font-weight: bold; cursor: pointer;" class="nav-link"
					 onclick="history.back(); return false;" >戻る
				  </a>
			    </li>
			</ul>
		</div>
  </div>

<div id="selectResult">

  <div style="font-size: 120%; color: red; margin-bottom: 3%;">※更新したい場合は、ソフト名をクリックしてください。</div>

  <table id="selectResult_table" style="border:3px black solid;">
    <thead>
      <tr>
        <th>ID</th>
        <th>ソフト</th>
        <th>ジャンル</th>
        <th>機種</th>
        <th>発売日</th>
        <th>価格</th>
        <th>URL</th>
        <th>　</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach var="soft" items="${softList}">
        <form action="softDelete" method="post">
          <tr class="selectResult_table_tr">
            <td class="fontWeight">${fn:escapeXml(soft.softId)}</td>
            <td><a href="softUpdate?transitionFromSoftSelectResult=transitionFromSoftSelectResult&softName=${fn:escapeXml(soft.softName)}">${fn:escapeXml(soft.softName)}</a></td>
            <td>${fn:escapeXml(soft.genreStr)}</td>
            <td>${fn:escapeXml(soft.modelStr)}</td>
            <td>${fn:escapeXml(soft.releaseDate)}</td>
            <td>${fn:escapeXml(soft.price)}</td>
            <td><a href="${fn:escapeXml(soft.url)}" target="_blank">${fn:escapeXml(soft.url)}</a></td>
            <td>
              <input type="hidden" name="softName" value="${fn:escapeXml(soft.softName)}">
  	          <button class="link_2">削除</button>
  	        </td>
          </tr>
        </form>
      </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>