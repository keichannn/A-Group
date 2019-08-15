package jp.co.keisuke.web.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
	public static Connection getConnection() {
		try {
			Class.forName("org.postgresql.Driver");
			return DriverManager.getConnection("jdbc:postgresql://ec2-54-243-197-120.compute-1.amazonaws.com:5432/d8jv5v2rt7hnb0", "wwulocxeznecus", "cffdcfacde1d5632a8406aa29de6054e12e54a00564e139e907e36e7dfc75434");
		} catch (Exception e) {
			// 本来は専用の例外クラスを作成したほうがよい
			throw new RuntimeException(e);
		}
	}
}
