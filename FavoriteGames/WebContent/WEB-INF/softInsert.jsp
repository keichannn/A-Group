<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>ソフト情報登録画面</title>
</head>
<body>
<div id="insertSoft">

  <p>登録情報を入力してください</p>

  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="softInsert" method="post" >
    <fieldset id="insertSoft_form">
      <div>
        <label class="item" class="required">ソフト名：</label>
        <input type="text" name="softName"
          value="${fn:escapeXml(param.softName)}">
        <c:if test="${not empty nameErrMsg}">
          <p class="error">${fn:escapeXml(nameErrMsg)}</p>
        </c:if>
      </div>
      <div>
        <label class="item" class="required">ジャンル：</label>
        <select name="genreId">
          <c:forEach var="genre" items="${sessionInfo.genreList}">
            <option value="${fn:escapeXml(genre.genreId)}"
              <c:choose>
                <c:when test="${not empty sessionInfo.registerSoft}">
                   <c:if test="${sessionInfo.registerSoft.genreId == genre.genreId}">selected</c:if>
                </c:when>
                <c:otherwise>
                  <c:if test="${genre.genreId == 1}">selected</c:if>
                </c:otherwise>
              </c:choose>>
              ${fn:escapeXml(genre.genreStr)}</option>
          </c:forEach>
        </select>
      </div>
      <div>
        <label class="item" class="required">機種　　：</label>
        <select name="modelId">
          <c:forEach var="model" items="${sessionInfo.modelList}">
            <option value="${fn:escapeXml(model.modelId)}"
              <c:choose>
                <c:when test="${not empty sessionInfo.registerSoft}">
                <c:if test="${sessionInfo.registerSoft.modelId == model.modelId}">selected</c:if>
                </c:when>
                <c:otherwise>
                  <c:if test="${model.modelId == 1}">selected</c:if>
                </c:otherwise>
              </c:choose>>
              ${fn:escapeXml(model.modelStr)}</option>
          </c:forEach>
        </select>
      </div>
            <div>
        <label class="item" class="required">発売日　：</label>
        <input type="text" name="releaseDate"
          value="${fn:escapeXml(param.releaseDate)}">
        <c:if test="${not empty releaseErrMsg}">
          <p class="error">${fn:escapeXml(releaseErrMsg)}</p>
        </c:if>
      </div>
      <div>
        <label class="item" class="required">価格　　：</label>
        <input type="text" name="price"
          value="${fn:escapeXml(param.price)}">
        <c:if test="${not empty priceErrMsg}">
          <p class="error">${fn:escapeXml(priceErrMsg)}</p>
        </c:if>
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