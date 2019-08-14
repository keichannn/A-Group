package jp.co.keisuke.web.entity;

import jp.co.keisuke.web.util.ParamUtil;

public class Review {

	private Integer id;
	private String userName;
	private String softStr;
	private String modelStr;
	private String contents;

	public Review() {}

	public Review(Integer id, String userName, String softStr, String modelStr, String contents) {
		this.id = id;
		this.userName = userName;
		this.softStr = softStr;
		this.modelStr = modelStr;
		this.contents = contents;
	}

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getSoftStr() {
		return softStr;
	}


	public void setSoftStr(String softStr) {
		this.softStr = softStr;
	}


	public String getModelStr() {
		return modelStr;
	}


	public void setModelStr(String modelStr) {
		this.modelStr = modelStr;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	//elseMethod
    public boolean softNameisEmptyCondition() {
        return id == null && ParamUtil.isNullOrEmpty(softStr);
    }

}
