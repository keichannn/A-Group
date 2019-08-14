package jp.co.keisuke.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String selectPage = request.getParameter("selectPage");

		if(selectPage.equals("select")) {

		request.getRequestDispatcher("/WEB-INF/softSelect.jsp").forward(request, response);

		} else if(selectPage.equals("insert")) {

			request.getRequestDispatcher("/WEB-INF/softInsert.jsp").forward(request, response);

		} else if(selectPage.equals("update")) {

			request.getRequestDispatcher("/WEB-INF/softUpdate.jsp").forward(request, response);

		} else if(selectPage.equals("delete")) {

			request.getRequestDispatcher("/WEB-INF/softDelete.jsp").forward(request, response);

		} else 	request.getRequestDispatcher("/WEB-INF/mypage.jsp").forward(request, response);


	}
}
