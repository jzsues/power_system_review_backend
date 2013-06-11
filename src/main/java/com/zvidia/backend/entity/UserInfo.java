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

import java.io.Serializable;

import javax.persistence.Entity;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.security.core.userdetails.UserDetails;


/**
 * 内部管理系统使用的用户数据实体
 * 
 * @author jiangzm
 * 
 */
@Entity(name = "user_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserInfo extends AbstractUser implements Serializable, UserDetails {

	private static final long serialVersionUID = 5277235597734481151L;

	private String nickName;

	private String department;

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

}
