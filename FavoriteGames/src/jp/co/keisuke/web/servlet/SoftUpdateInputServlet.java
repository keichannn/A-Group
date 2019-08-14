package jp.co.keisuke.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.keisuke.web.entity.SoftInfo;
import jp.co.keisuke.web.util.ParamUtil;

@WebServlet("/softUpdateInput")
public class SoftUpdateInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

        String softName = request.getParameter("softName");
        String genreStr = request.getParameter("genreId");
        String modelStr = request.getParameter("modelId");
        String releaseDate = request.getParameter("releaseDate");
        String price = request.getParameter("price");

        Integer genreId = ParamUtil.checkAndParseInt(genreStr);
        Integer modelId = ParamUtil.checkAndParseInt(modelStr);

        SessionInfo sessionInfo = ParamUtil.getSessionInfo(request.getSession());
        SoftInfo updateSoft = sessionInfo.getUpdateSoft();

        updateSoft.setSoftName(softName);
        updateSoft.setGenreStr(ParamUtil.getGenreNameByGenreId(genreId, sessionInfo.getGenreList()));
        updateSoft.setModelStr(ParamUtil.getModelNameByModelId(modelId, sessionInfo.getModelList()));
        updateSoft.setReleaseDate(releaseDate);
        updateSoft.setPrice(price);

        SoftInfo prevSoft = sessionInfo.getPrevUpdateSoft();

        if (prevSoft.equals(updateSoft)) {

            request.setAttribute("errMsg", "1項目以上変更してください");
            request.getRequestDispatcher("/WEB-INF/softUpdateInput.jsp").forward(request, response);
            return;
        }

        request.getRequestDispatcher("/WEB-INF/softUpdateConfirm.jsp").forward(request, response);
    }

}
