package jp.co.keisuke.web.util;

import java.util.List;

import javax.servlet.http.HttpSession;

import jp.co.keisuke.web.entity.Age;
import jp.co.keisuke.web.entity.Genre;
import jp.co.keisuke.web.entity.Model;
import jp.co.keisuke.web.entity.SoftInfo;
import jp.co.keisuke.web.servlet.SessionInfo;

public class ParamUtil {

    public static boolean isNullOrEmpty(String str) {

        if (str == null || str.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isNumber(String str) {

        try {
            Integer.parseInt(str);
        } catch (NumberFormatException ex) {
            return false;
        }

        return true;
    }

    public static Integer checkAndParseInt(String str) {

        if (isNumber(str)) {
            return Integer.parseInt(str);
        } else {
            return null;
        }
    }

    public static SessionInfo getSessionInfo(HttpSession session) {

        SessionInfo sessionInfo = (SessionInfo) session.getAttribute("sessionInfo");

        if (sessionInfo == null) {
            return new SessionInfo();
        } else {
            return sessionInfo;
        }
    }

    public static String getAgeNameByAgeId(Integer targetAgeId, List<Age> ageList) {

        for (Age age : ageList) {
            if (age.getAgeId() == targetAgeId) {
                return age.getAgeStr();
            }
        }

        return "";
    }

    public static String getGenreNameByGenreId(Integer targetGenreId, List<Genre> genreList) {

        for (Genre genre : genreList) {
            if (genre.getGenreId() == targetGenreId) {
                return genre.getGenreStr();
            }
        }

        return "";
    }

    public static String getModelNameByModelId(Integer targetModelId, List<Model> modelList) {

        for (Model model : modelList) {
            if (model.getModelId() == targetModelId) {
                return model.getModelStr();
            }
        }

        return "";
    }

    public static boolean checkPrevUpdateSoftEqualsUpdateSoft(SoftInfo prevUpdateSoft, SoftInfo updateSoft) {

    	boolean equal = true;

    	if(!prevUpdateSoft.getSoftName().equals(updateSoft.getSoftName())) {
    		equal = false;
    	}

    	if(!prevUpdateSoft.getGenreId().equals(updateSoft.getGenreId())) {
    		equal = false;
    	}

    	if(!prevUpdateSoft.getGenreStr().equals(updateSoft.getGenreStr())) {
    		equal = false;
    	}

    	if(!prevUpdateSoft.getModelId().equals(updateSoft.getModelId())) {
    		equal = false;
    	}

    	if(!prevUpdateSoft.getModelStr().equals(updateSoft.getModelStr())) {
    		equal = false;
    	}

    	if(!prevUpdateSoft.getReleaseDate().equals(updateSoft.getReleaseDate())) {
    		equal = false;
    	}

    	if(prevUpdateSoft.getPrice().equals(updateSoft.getPrice())) {
    		equal = false;
    	}

    	return equal;

    }

}
