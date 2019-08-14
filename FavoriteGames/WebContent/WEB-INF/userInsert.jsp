<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>新規登録画面</title>
</head>
<body>
<div id="insertUser">

  <p>登録情報を入力してください</p>

  <c:if test="${not empty errMsg}">
    <p class="error">${fn:escapeXml(errMsg)}</p>
  </c:if>

  <form action="userInsert" method="post">
    <fieldset id="insertUser_form">
      <div>
        <label class="required">ID　　：</label>
        <input type="text" name="loginId"
          value="${fn:escapeXml(param.loginId)}">
        <c:if test="${not empty idErrMsg}">
          <p class="error">${fn:escapeXml(idErrMsg)}</p>
        </c:if>
      </div>
      <div>
        <label class="required">名前　：</label>
        <input type="text" name="userName"
          value="${fn:escapeXml(param.userName)}">
        <c:if test="${not empty nameErrMsg}">
          <p class="error">${fn:escapeXml(nameErrMsg)}</p>
        </c:if>
      </div>
      <div>
        <label class="required">年代　：</label>
        <select name="ageId">
          <c:forEach var="age" items="${sessionInfo.ageList}">
            <option value="${fn:escapeXml(age.ageId)}"
              <c:choose>
                <c:when test="${not empty sessionInfo.registerUser}">
                  <c:if test="${sessionInfo.registerUser.ageId == age.ageId}">selected</c:if>
                </c:when>
                <c:otherwise>
                  <c:if test="${age.ageId == 1}">selected</c:if>
                </c:otherwise>
              </c:choose>>
              ${fn:escapeXml(age.ageStr)}</option>
          </c:forEach>
        </select>
      </div>
      <div>
        <label class="required">PASS：</label>
        <input type="password" name="pass"
          value="${fn:escapeXml(param.pass)}">
        <c:if test="${not empty passErrMsg}">
          <p class="error">${fn:escapeXml(passErrMsg)}</p>
        </c:if>
      </div>
    </fieldset>
    <p><button class="link" type="submit" name="resister" value="confirm">確認</button></p>
  </form>
  <div>
    <p><a class="link" href="top">TOP</a></p>
  </div>
</div>
</body>
</html>