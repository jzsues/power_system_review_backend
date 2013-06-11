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

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.backend.entity.FunctionInfo;
import com.zvidia.backend.repository.FunctionRepository;
import com.zvidia.common.controller.AbstractAjaxCRUDController;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/func")
public class FunctionController extends AbstractAjaxCRUDController<FunctionInfo, Long> {

	@Autowired
	FunctionRepository functionRepository;

	@Override
	protected Page<FunctionInfo> doPageQuery(Pageable pageable, HashMap<String, Object> query) {
		return functionRepository.findAll(pageable);
	}

	@Override
	protected void afterPageQuery(Page<FunctionInfo> result) {

	}

	@Override
	protected FunctionInfo doSave(FunctionInfo entity) {
		return functionRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		functionRepository.delete(id);
	}

	@Override
	protected FunctionInfo doGet(Long id) {
		return functionRepository.findOne(id);
	}

	@Override
	protected void beforeSaveRequest(FunctionInfo entity, HttpServletRequest request) {

	}

	@Override
	protected Object beforeFTLRender(HttpServletRequest request) {
		return "success";
	}
}
