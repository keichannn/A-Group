<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>情報更新画面</title>
</head>
<body>
<div id="updateSoftInput">
  <p>１箇所以上の項目を変更してください</p>

  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="softUpdateInput" method="post">
    <fieldset id="updateSoftInput_form">
      <div>
        <label class="item">ソフト名：</label>
        <input type="text" name="softName"
          value="${fn:escapeXml(sessionInfo.updateSoft.softName)}">
        <c:if test="${not empty nameErrMsg}">
          <span class="error">${fn:escapeXml(nameErrMsg)}</span>
        </c:if>
      </div>
      <div>
        <label class="item">ジャンル：</label>
        <select name="genreId">
          <c:forEach var="genre" items="${sessionInfo.genreList}">
            <option value="${fn:escapeXml(genre.genreId)}"
              <c:if test="${sessionInfo.updateSoft.genreId == genre.genreId}">selected</c:if>>
                          ${fn:escapeXml(genre.genreStr)}
            </option>
          </c:forEach>
        </select>
      </div>
      <div>
        <label class="item">機種　　：</label>
        <select name="modelId">
          <c:forEach var="model" items="${sessionInfo.modelList}">
            <option value="${fn:escapeXml(model.modelId)}"
              <c:if test="${sessionInfo.updateSoft.modelId == model.modelId}">selected</c:if>>
                          ${fn:escapeXml(model.modelStr)}
            </option>
          </c:forEach>
        </select>
      </div>
            <div>
        <label class="item">発売日：</label>
        <input type="text" name="releaseDate"
          value="${fn:escapeXml(sessionInfo.updateSoft.releaseDate)}">
        <c:if test="${not empty releaseErrMsg}">
          <span class="error">${fn:escapeXml(releaseErrMsg)}</span>
        </c:if>
      </div>
      <div>
        <label class="item">価格　　：</label>
        <input type="text" name="price"
          value="${fn:escapeXml(sessionInfo.updateSoft.price)}">
        <c:if test="${not empty priceErrMsg}">
          <span class="error">${fn:escapeXml(priceErrMsg)}</span>
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