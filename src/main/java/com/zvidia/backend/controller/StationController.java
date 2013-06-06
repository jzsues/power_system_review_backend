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

import com.zvidia.backend.entity.QRCodeInfo;
import com.zvidia.backend.entity.StationInfo;
import com.zvidia.backend.repository.StationRepository;
import com.zvidia.backend.service.QRCodeService;
import com.zvidia.common.controller.AbstractAjaxCRUDController;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/station")
public class StationController extends AbstractAjaxCRUDController<StationInfo, Long> {

	@Autowired
	StationRepository stationRepository;

	@Autowired
	QRCodeService qrCodeService;

	@Override
	protected Page<StationInfo> doPageQuery(Pageable pageable) {
		return stationRepository.findAll(pageable);
	}

	@Override
	protected void afterPageQuery(Page<StationInfo> result) {
		String fileHttpContextPath = qrCodeService.getFileHttpContextPath();
		for (StationInfo station : result.getContent()) {
			QRCodeInfo qrCodeInfo = station.getQrCodeInfo();
			if (qrCodeInfo != null) {
				qrCodeInfo.setUrl(fileHttpContextPath + qrCodeInfo.getUrl());
			}
		}

	}

	@Override
	protected StationInfo doSave(StationInfo entity) {
		return stationRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		stationRepository.delete(id);
	}

	@Override
	protected StationInfo doGet(Long id) {
		return stationRepository.findOne(id);
	}

	@Override
	protected void beforeSaveRequest(StationInfo entity, HttpServletRequest request) {

	}

	@Override
	protected Object beforeFTLRender(HttpServletRequest request) {
		return "success";
	}

}
