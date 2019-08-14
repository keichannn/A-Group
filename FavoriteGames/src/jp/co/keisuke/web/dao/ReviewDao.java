package jp.co.keisuke.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jp.co.keisuke.web.entity.Review;

public class ReviewDao {

	private static final String INSERT = "INSERT INTO review VALUES(?,?,?,?,?)";
	private static final String SELECT_ALL ="SELECT * FROM review";

	private Connection conn;

	public ReviewDao(Connection conn ) {this.conn = conn;}

	public List<Review> findReviewData() {

		List<Review> list = new ArrayList<>();

    	try(PreparedStatement stmt = conn.prepareStatement(SELECT_ALL)){

    		ResultSet rs = stmt.executeQuery();

    		while(rs.next()) {

    			Review reviewInfo = new Review(rs.getInt("id"), rs.getString("user_name"), rs.getString("soft_str"), rs.getString("model_str"), rs.getString("contents"));
    			list.add(reviewInfo);

    		}

    	} catch(SQLException e) {
    		throw new RuntimeException(e);
    	}

    	return list;

	}

	public void insert(Review reviewInfo) {

    	try(PreparedStatement stmt = conn.prepareStatement(INSERT)){

    		stmt.setInt(1, reviewInfo.getId());
    		stmt.setString(2, reviewInfo.getUserName());
    		stmt.setString(3, reviewInfo.getSoftStr());
    		stmt.setString(4, reviewInfo.getModelStr());
    		stmt.setString(5, reviewInfo.getContents());

    		stmt.executeUpdate();

    	} catch(SQLException e) {
    		throw new RuntimeException(e);
    	}

	}

}
