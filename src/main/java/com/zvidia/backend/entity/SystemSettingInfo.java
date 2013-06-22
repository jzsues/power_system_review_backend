/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
/**
 * 
 */
package com.zvidia.backend.entity;

import javax.persistence.Entity;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.zvidia.common.entity.AbstractSQLEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "system_setting_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class SystemSettingInfo extends AbstractSQLEntity<Long> {
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
