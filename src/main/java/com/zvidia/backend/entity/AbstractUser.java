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

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import org.apache.commons.lang.StringUtils;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.zvidia.common.entity.AbstractSQLEntity;
import com.zvidia.common.security.SecurityUtils;

/**
 * 抽象用户实体
 * <p>
 * <b>无法在子类中{@code Override}本类中包含的任何属性和方法 </b>
 * 
 * @author jiangzm
 * 
 */
@MappedSuperclass
public abstract class AbstractUser extends AbstractSQLEntity<Long> {
	/**
	 * 用户名
	 */
	protected String username;

	/**
	 * 密码
	 */
	protected String password;

	/**
	 * 电子邮件
	 */
	protected String email;

	/**
	 * 是否锁定
	 */
	protected boolean accountNonLocked = true;

	/**
	 * 密码是否过期
	 */
	protected boolean credentialsNonExpired = true;

	/**
	 * 是否有效
	 */
	protected boolean enabled = true;

	/**
	 * 帐号是否国企
	 */
	protected boolean accountNonExpired = true;

	@OneToMany(cascade = { CascadeType.REFRESH })
	@LazyCollection(LazyCollectionOption.FALSE)
	protected Collection<RoleInfo> authorities = new ArrayList<RoleInfo>();

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		if (password != null) {
			if (password.length() < 32) {
				password = SecurityUtils.md5(password);
			}
			password = StringUtils.lowerCase(password);
		}
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public Collection<RoleInfo> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Collection<RoleInfo> authorities) {
		this.authorities = authorities;
	}

	@Override
	public String toString() {
		return "[" + id + "," + username + "]";
	}

}
