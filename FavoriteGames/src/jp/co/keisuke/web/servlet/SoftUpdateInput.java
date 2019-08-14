package jp.co.keisuke.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.keisuke.web.entity.SoftInfo;
import jp.co.keisuke.web.entity.UserInfo;
import jp.co.keisuke.web.service.SoftInfoService;
import jp.co.keisuke.web.util.ParamUtil;

@WebServlet("/softUpdateInput")
public class SoftUpdateInput extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String softName = request.getParameter("softName");
        String genreStr = request.getParameter("genreId");
        String modelStr = request.getParameter("modelId");
        String releaseDate = request.getParameter("releaseDate");
        String price = request.getParameter("price");

        Integer genreId = ParamUtil.checkAndParseInt(genreStr);
        Integer modelId = ParamUtil.checkAndParseInt(modelStr);

        SessionInfo sessionInfo = ParamUtil.getSessionInfo(request.getSession());
        SoftInfo updateSoft = sessionInfo.getUpdateSoft();

        updateSoft.setGenreId(genreId);
        updateSoft.setModelId(modelId);
        updateSoft.setGenreStr(ParamUtil.getGenreNameByGenreId(genreId, sessionInfo.getGenreList()));
        updateSoft.setModelStr(ParamUtil.getModelNameByModelId(modelId, sessionInfo.getModelList()));

        boolean hasError = false;

        if (ParamUtil.isNullOrEmpty(softName)) {
            request.setAttribute("nameErrMsg", "ソフト名は必須です");
            hasError = true;
        }

        if (ParamUtil.isNullOrEmpty(releaseDate)) {
            request.setAttribute("releaseErrMsg", "発売日は必須です");
            hasError = true;
        }

        if (ParamUtil.isNullOrEmpty(price)) {
            request.setAttribute("priceErrMsg", "価格は必須です");
            hasError = true;
        }

        if (hasError) {
            request.getRequestDispatcher("/WEB-INF/softInsert.jsp").forward(request, response);
        }

        // ソフト名重複チェック
        SoftInfoService softInfoService = new SoftInfoService();

        if (softInfoService.existsSoftBySoftName(softName)) {
            request.setAttribute("errMsg", "このソフト名はすでに登録されています");
            request.getRequestDispatcher("/WEB-INF/softInsert.jsp").forward(request, response);
        }

        UserInfo prevSoft = sessionInfo.getPrevUpdateUser();

        if (prevSoft.equals(updateSoft)) {

            request.setAttribute("errMsg", "1項目以上変更してください");
            request.getRequestDispatcher("/WEB-INF/softUpdateInput.jsp").forward(request, response);
            return;
        }

        request.getRequestDispatcher("/WEB-INF/updateConfirm.jsp").forward(request, response);
    }

}
