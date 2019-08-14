package jp.co.keisuke.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.keisuke.web.entity.Review;
import jp.co.keisuke.web.service.ReviewService;
import jp.co.keisuke.web.util.ParamUtil;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ReviewService reviewService = new ReviewService();
		List<Review> list = reviewService.findReviewData();

		request.setAttribute("reviewList", list);
		request.getRequestDispatcher("/WEB-INF/review.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String softName = request.getParameter("softName");
		String modelStr = request.getParameter("modelId");
		String contents = request.getParameter("contents");

		Integer modelId = ParamUtil.checkAndParseInt(modelStr);
		SessionInfo sessionInfo = ParamUtil.getSessionInfo(request.getSession());
		String modelName = ParamUtil.getModelNameByModelId(modelId, sessionInfo.getModelList());
		Review reviewInfo = new Review(sessionInfo.getLoginUser().getId(), sessionInfo.getLoginUser().getUserName(), softName, modelName, contents);

		boolean hasErr = false;

        if (ParamUtil.isNullOrEmpty(softName)) {
            request.setAttribute("nameErrMsg", "ソフト名は必須です");
            hasErr = true;
        }

        if (ParamUtil.isNullOrEmpty(contents)) {
            request.setAttribute("contentsErrMsg", "未入力です");
            hasErr = true;
        }

        if(hasErr) {

    		request.getRequestDispatcher("/WEB-INF/review.jsp").forward(request, response);
        	return;

        }

		ReviewService reviewService = new ReviewService();
		reviewService.insert(reviewInfo);

		request.getRequestDispatcher("/WEB-INF/review.jsp").forward(request, response);

	}

}
