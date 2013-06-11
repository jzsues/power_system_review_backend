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
package com.zvidia.backend.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;

import com.zvidia.backend.entity.FunctionInfo;
import com.zvidia.backend.entity.RoleInfo;
import com.zvidia.backend.repository.FunctionRepository;
import com.zvidia.backend.repository.RoleRepository;

/**
 * @author jiangzm
 * 
 */
@Service("securityMetadataSourceService")
public class InvocationSecurityMetadataSourceService implements FilterInvocationSecurityMetadataSource, InitializingBean {

	Log logger = LogFactory.getLog(getClass());

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	FunctionRepository functionRepository;

	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;

	@Override
	public void afterPropertiesSet() throws Exception {
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		List<RoleInfo> findAllRoles = roleRepository.findAll();
		Collection<ConfigAttribute> main = new ArrayList<ConfigAttribute>();
		for (RoleInfo role : findAllRoles) {
			Collection<FunctionInfo> funcs = role.getFuncs();
			ConfigAttribute ca = new SecurityConfig(role.getAuthority());
			main.add(ca);
			if (funcs == null || funcs.size() == 0) {
				continue;
			}
			for (FunctionInfo func : funcs) {
				String funcUrl = func.getFuncUrl();
				Collection<ConfigAttribute> collection = resourceMap.get(funcUrl);
				if (collection == null) {
					collection = new ArrayList<ConfigAttribute>();
					collection.add(ca);
					resourceMap.put(funcUrl, collection);
				} else {
					if (!collection.contains(ca)) {
						collection.add(ca);
					}
				}
			}
		}
		resourceMap.put("/main", main);
		logger.debug("resource map:" + resourceMap.toString());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.security.access.SecurityMetadataSource#getAttributes
	 * (java.lang.Object)
	 */
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
		String url = ((FilterInvocation) object).getRequestUrl();
		Iterator<String> ite = resourceMap.keySet().iterator();
		while (ite.hasNext()) {
			String resURL = ite.next();
			if (url.contains(resURL)) {
				Collection<ConfigAttribute> returnCollection = resourceMap.get(resURL);
				return returnCollection;
			}
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.security.access.SecurityMetadataSource#
	 * getAllConfigAttributes()
	 */
	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.security.access.SecurityMetadataSource#supports(java
	 * .lang.Class)
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return true;
	}

}
