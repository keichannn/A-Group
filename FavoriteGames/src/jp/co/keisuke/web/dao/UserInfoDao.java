package jp.co.keisuke.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jp.co.keisuke.web.entity.UserInfo;

public class UserInfoDao {

    private static final String SELECT_BY_PASS = "SELECT id, login_id, user_name, u.age_id, age_str, password FROM user_information u JOIN age a ON u.age_id = a.age_id WHERE password = ?";
    private static final String SELECT_BY_LOGIN_ID_AND_PASS = "SELECT id, login_id, user_name, u.age_id, age_str, password FROM user_information u JOIN age a ON u.age_id = a.age_id WHERE login_id = ? AND password = ?";
    private static final String INSERT = "INSERT INTO user_information (login_id, user_name, age_id, password) VALUES (?, ?, ?, ?)";
    private static final String DELETE_BY_ID = "DELETE FROM user_information where id = ?";

    private Connection connection;

    public UserInfoDao(Connection connection) {
        this.connection = connection;
    }

    public UserInfo findByLoginIdAndPassword(String loginId, String password) {

        try (PreparedStatement stmt = connection.prepareStatement(SELECT_BY_LOGIN_ID_AND_PASS)) {
            stmt.setString(1, loginId);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                UserInfo u = new UserInfo(rs.getInt("id"),rs.getString("login_id"),rs.getString("user_name"),rs.getString("password"),rs.getInt("age_id"),rs.getString("age_str"));
                return u;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;

    }

    public UserInfo findByPass(String pass) {

        try (PreparedStatement stmt = connection.prepareStatement(SELECT_BY_PASS)) {
            stmt.setString(1, pass);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                UserInfo u = new UserInfo(rs.getInt("id"),rs.getString("login_id"),rs.getString("user_name"),rs.getString("password"),rs.getInt("age_id"),rs.getString("age_str"));

                return u;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;

    }

    public void insert(UserInfo resisterUserInfo) {

    	try(PreparedStatement stmt = connection.prepareStatement(INSERT)){

    		stmt.setString(1,resisterUserInfo.getLoginId());
    		stmt.setString(2,resisterUserInfo.getUserName());
    		stmt.setInt(3,resisterUserInfo.getAgeId());
    		stmt.setString(4,resisterUserInfo.getPass());
    		stmt.executeUpdate();

    	} catch(SQLException e) {
    		throw new RuntimeException(e);
    	}
    }

    public void deleteById(UserInfo deleteUser) {

    	try(PreparedStatement stmt = connection.prepareStatement(DELETE_BY_ID)){

    		stmt.setInt(1, deleteUser.getId());
    		stmt.executeUpdate();

    	} catch(SQLException e) {
    		throw new RuntimeException(e);
    	}
    }

}
