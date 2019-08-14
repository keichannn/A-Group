package jp.co.keisuke.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.keisuke.web.entity.SoftInfo;
import jp.co.keisuke.web.service.SoftInfoService;
import jp.co.keisuke.web.util.ParamUtil;

@WebServlet("/softSelect")
public class SoftSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
        String softName = request.getParameter("softName");

        SessionInfo sessionInfo = ParamUtil.getSessionInfo(request.getSession());
        SoftInfo cond = new SoftInfo(null, softName, null, null, null, null, null, null, null);
        SoftInfoService softInfoService = new SoftInfoService();

        List<SoftInfo> list = softInfoService.find(cond, sessionInfo.getLoginUser());

        if (list.isEmpty()) {

            request.setAttribute("errMsg", "※ 入力されたデータはありませんでした");
            request.getRequestDispatcher("softSelect.jsp").forward(request, response);
            return;

        }

            request.setAttribute("softList", list);
            request.getRequestDispatcher("softSelectResult.jsp").forward(request, response);



	}
}
