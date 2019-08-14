<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/common.css" rel="stylesheet">
<title>口コミ画面</title>
</head>
<body>

<div id="review">
  <p>ソフト情報を共有しよう</p>

    <c:if test="${not empty errMsg}">
      <p class="error">${fn:escapeXml(errMsg)}</p>
    </c:if>

    <form  action="review" method="post">
    <fieldset id="review_form">
        <div>
          <label class="item">ソフト名：</label>
          <input type="text" name="softName"
            value="${fn:escapeXml(param.softName)}">
          <c:if test="${not empty nameErrMsg}"><br>
            <p class="error">${fn:escapeXml(nameErrMsg)}</p>
          </c:if>
        </div>

        <div>
          <label class="item">機種　　：</label>
          <select name="modelId">
            <c:forEach var="model" items="${sessionInfo.modelList}">
              <option value="${fn:escapeXml(model.modelId)}"
                <c:if test="${model.modelId == 1}">selected</c:if>>
                            ${fn:escapeXml(model.modelStr)}
              </option>
            </c:forEach>
          </select>
        </div>

        <div>
          <label class="item">コメント： </label>
          <input type="text" name="contents"
            value="${fn:escapeXml(param.contents)}">
          <c:if test="${not empty contentsErrMsg}">
            <p class="error">${fn:escapeXml(contentsErrMsg)}</p>
          </c:if>
        </div>

      <button class="link" type="submit">投稿</button>
       <p><a class="link" class="review_link" href="review">更新</a></p>
       <p>
       <a class="link" class="review_link" href="mypage?selectPage=mypage">マイページ</a>
       </p>
      </fieldset>
    </form>


      <div>
        <c:forEach var="review" items="${reviewList}">
        <div>テーマ【${fn:escapeXml(review.softStr)} / ${fn:escapeXml(review.modelStr)}】</div>
          <div>
  	      <span id="userName_review">${fn:escapeXml(review.userName)}：</span>
  	      <span>${fn:escapeXml(review.contents)}</span>
  	    </div>
  	    </c:forEach>
      </div>
    </div>

</body>
</html>