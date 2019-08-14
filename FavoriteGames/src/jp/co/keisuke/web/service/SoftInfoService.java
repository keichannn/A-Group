package jp.co.keisuke.web.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import jp.co.keisuke.web.dao.SoftInfoDao;
import jp.co.keisuke.web.entity.SoftInfo;
import jp.co.keisuke.web.entity.UserInfo;
import jp.co.keisuke.web.util.DbUtil;

public class SoftInfoService {

    public List<SoftInfo> find(SoftInfo cond, UserInfo loginUser) {

        List<SoftInfo> list = new ArrayList<SoftInfo>();

        try (Connection conn = DbUtil.getConnection()) {
            SoftInfoDao softInfoDao = new SoftInfoDao(conn);
            list = softInfoDao.find(cond, loginUser);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public SoftInfo findById(UserInfo loginUser) {


        try (Connection conn = DbUtil.getConnection()) {
            SoftInfoDao softInfoDao = new SoftInfoDao(conn);
            return softInfoDao.findById(loginUser);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean existSoftById(UserInfo loginUser) {

    	return findById(loginUser) != null;
    }

    public SoftInfo findBySoftName(String softName) {

        try (Connection conn = DbUtil.getConnection()) {
            SoftInfoDao softInfoDao = new SoftInfoDao(conn);
            return softInfoDao.findBySoftName(softName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

    public boolean existsSoftBySoftName(String softName) {

        return findBySoftName(softName) != null;

    }

    public void insert(SoftInfo resisterSoftInfo, UserInfo loginUserInfo) {

    	try(Connection conn = DbUtil.getConnection()){
    		SoftInfoDao softInfoDao = new SoftInfoDao(conn);
    		softInfoDao.insert(resisterSoftInfo, loginUserInfo);

    	} catch(Exception e) {
    		e.printStackTrace();
    	}

    }

    public void update(SoftInfo softUpdate, UserInfo loginUser) {

        try (Connection conn = DbUtil.getConnection()) {
        	SoftInfoDao softInfoDao = new SoftInfoDao(conn);

            softInfoDao.update(softUpdate, loginUser);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteById(UserInfo loginUser) {

        try (Connection conn = DbUtil.getConnection()) {

        	SoftInfoDao softInfoDao = new SoftInfoDao(conn);
            softInfoDao.deleteById(loginUser);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void deleteByIdAndSoftName(UserInfo loginUser, SoftInfo deleteSoft) {

        try (Connection conn = DbUtil.getConnection()) {

        	SoftInfoDao softInfoDao = new SoftInfoDao(conn);
            softInfoDao.deleteByIdAndSoftName(loginUser, deleteSoft);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
