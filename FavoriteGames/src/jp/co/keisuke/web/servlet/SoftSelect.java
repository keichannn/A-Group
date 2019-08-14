package jp.co.keisuke.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.keisuke.web.entity.UserInfo;
import jp.co.keisuke.web.service.UserInfoService;

@WebServlet("/softSelect")
public class SoftSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("userName");

        UserInfo cond = new UserInfo(null, null, userName, null, null, null);

        UserInfoService userInfoService = new UserInfoService();
        List<UserInfo> list = userInfoService.find(cond);

        if (list.isEmpty()) {

            request.setAttribute("errMsg", "入力されたデータはありませんでした");
            request.getRequestDispatcher("/WEB-INF/softSelect.jsp").forward(request, response);

        } else {

            request.setAttribute("userList", list);
            request.getRequestDispatcher("/WEB-INF/softSelectResult.jsp").forward(request, response);

        }

	}
}
