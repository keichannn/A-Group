package jp.co.keisuke.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.keisuke.web.entity.UserInfo;
import jp.co.keisuke.web.service.UserInfoService;
import jp.co.keisuke.web.util.ParamUtil;

@WebServlet("/userInsert")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/userInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
        String loginId = request.getParameter("loginId");
        String userName = request.getParameter("userName");
        String ageStr = request.getParameter("ageId");
        String pass = request.getParameter("pass");

        Integer ageId = ParamUtil.checkAndParseInt(ageStr);
        UserInfo userInfo = new UserInfo(null, loginId, userName, pass, ageId);

        SessionInfo sessionInfo = ParamUtil.getSessionInfo(request.getSession());
        userInfo.setAgeStr(ParamUtil.getAgeNameByAgeId(ageId, sessionInfo.getAgeList()));
        sessionInfo.setRegisterUser(userInfo);

        boolean hasError = false;

        if (ParamUtil.isNullOrEmpty(loginId)) {
            request.setAttribute("idErrMsg", "IDは必須です");
            hasError = true;
        }

        if (ParamUtil.isNullOrEmpty(userName)) {
            request.setAttribute("nameErrMsg", "名前は必須です");
            hasError = true;
        }

        if (ParamUtil.isNullOrEmpty(pass)) {
            request.setAttribute("passErrMsg", "PASSは必須です");
            hasError = true;
        }

        if (hasError) {
            request.getRequestDispatcher("/WEB-INF/userInsert.jsp").forward(request, response);
        }

        // ID重複チェック
        UserInfoService userInfoService = new UserInfoService();

        if (userInfoService.existsUserByPass(pass)) {
            request.setAttribute("errMsg", "PASSが重複しています");
            request.getRequestDispatcher("/WEB-INF/userInsert.jsp").forward(request, response);
        }

        request.getRequestDispatcher("/WEB-INF/userInsertConfirm.jsp").forward(request, response);

	}

}
