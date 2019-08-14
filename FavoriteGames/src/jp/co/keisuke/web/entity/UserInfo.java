package jp.co.keisuke.web.entity;

import jp.co.keisuke.web.util.ParamUtil;

public class UserInfo {

	private Integer id;
	private String loginId;
	private String userName;
	private String pass;
	private Integer ageId;
	private String ageStr;

	public UserInfo() {}

	public UserInfo(Integer id, String loginId, String userName,String pass, Integer ageId) {
		this.id = id; this.loginId = loginId; this.userName = userName; this.pass = pass; this.ageId = ageId;
	}

	public UserInfo(Integer id, String loginId, String userName,String pass, Integer ageId,String ageStr) {
		this(id,loginId,userName,pass,ageId); this.ageStr = ageStr;
	}

	//get

	public Integer getId() {
		return id;
	}

	public String getLoginId() {
		return loginId;
	}

	public String getUserName() {
		return userName;
	}

	public String getPass() {
		return pass;
	}

	public Integer getAgeId() {
		return ageId;
	}

	public String getAgeStr() {
		return ageStr;
	}

	//set

	public void setId(Integer id) {
		this.id = id;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public void setAgeId(Integer ageId) {
		this.ageId = ageId;
	}

	public void setAgeStr(String ageStr) {
		this.ageStr = ageStr;
	}

	//elseMethod
    public boolean isEmptyCondition() {
        return id == null && ParamUtil.isNullOrEmpty(userName);
    }
}
