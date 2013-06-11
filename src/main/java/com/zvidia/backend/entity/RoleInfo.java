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
package com.zvidia.backend.entity;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.security.core.GrantedAuthority;

import com.zvidia.common.entity.AbstractSQLEntity;

@Entity(name = "role_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class RoleInfo extends AbstractSQLEntity implements GrantedAuthority {

	private static final long serialVersionUID = 180431158775979167L;

	@Column(unique = true, nullable = false)
	private String authority;

	@Column
	private String roleDesc;

	@OneToMany(cascade = { CascadeType.REFRESH })
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<FunctionInfo> funcs = new ArrayList<FunctionInfo>();

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String getAuthority() {
		return authority;
	}

	public Collection<FunctionInfo> getFuncs() {
		return funcs;
	}

	public void setFuncs(Collection<FunctionInfo> funcs) {
		this.funcs = funcs;
	}

	@Override
	public String toString() {
		return "[" + authority + "]";
	}

}
