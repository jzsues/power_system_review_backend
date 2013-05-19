/**
 * 
 */
package com.zvidia.backend.entity;

import javax.persistence.Entity;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.zvidia.common.entity.AbstractEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "system_setting_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SystemSettingInfo extends AbstractEntity {
	/**
	 * 客户名称
	 */
	private String customer;

	/**
	 * 授权码
	 */
	private String cdkey;

	/**
	 * 最大检测地点数量
	 */
	private int maxStation;

	/**
	 * 最大用户数量
	 */
	private int maxUser;

	/**
	 * 最多检测项目数量
	 */
	private int maxCheckPoint;

	/**
	 * 验证签名，防止用户私自修改数据库
	 */
	private String signature;

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getCdkey() {
		return cdkey;
	}

	public void setCdkey(String cdkey) {
		this.cdkey = cdkey;
	}

	public int getMaxStation() {
		return maxStation;
	}

	public void setMaxStation(int maxStation) {
		this.maxStation = maxStation;
	}

	public int getMaxUser() {
		return maxUser;
	}

	public void setMaxUser(int maxUser) {
		this.maxUser = maxUser;
	}

	public int getMaxCheckPoint() {
		return maxCheckPoint;
	}

	public void setMaxCheckPoint(int maxCheckPoint) {
		this.maxCheckPoint = maxCheckPoint;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

}
