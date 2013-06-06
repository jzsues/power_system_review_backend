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
package com.zvidia.backend.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.common.controller.AbstractAjaxCRUDController;
import com.zvidia.common.entity.RoleInfo;
import com.zvidia.common.repository.FunctionRepository;
import com.zvidia.common.repository.RoleRepository;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/role")
public class RoleController extends AbstractAjaxCRUDController<RoleInfo, Long> {

	@Autowired
	FunctionRepository functionRepository;

	@Autowired
	RoleRepository roleRepository;

	@Override
	protected Page<RoleInfo> doPageQuery(Pageable pageable) {
		return roleRepository.findAll(pageable);
	}

	@Override
	protected void afterPageQuery(Page<RoleInfo> result) {

	}

	@Override
	protected RoleInfo doSave(RoleInfo entity) {
		return roleRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		roleRepository.delete(id);
	}

	@Override
	protected RoleInfo doGet(Long id) {
		return roleRepository.findOne(id);
	}

	@Override
	protected void beforeSaveRequest(RoleInfo entity, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected Object beforeFTLRender(HttpServletRequest request) {
		return "success";
	}

}
