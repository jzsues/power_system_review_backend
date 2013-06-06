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
package com.zvidia.backend.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zvidia.backend.entity.QRCodeInfo;
import com.zvidia.backend.entity.StationInfo;
import com.zvidia.backend.exception.QRCodeException;
import com.zvidia.backend.qrcode.QRCodeContext;
import com.zvidia.backend.repository.StationRepository;

/**
 * @author jiangzm
 * 
 */
@Service
public class QRCodeService {

	@Autowired
	QRCodeContext qrCodeTools;

	@Autowired
	StationRepository stationRepository;

	public String getQrcodeFolder() {
		return qrCodeTools.getQrcodeFolder();
	}

	public String getFileHttpContextPath() {
		return qrCodeTools.getFileHttpContextPath();
	}

	public String getSeparator() {
		return qrCodeTools.getSeparator();
	}

	public StationInfo populateQRCodeWithStation(StationInfo stationInfo) throws QRCodeException {
		return populateQRCodeWithStation(stationInfo, false, null, null);
	}

	private StationInfo populate(StationInfo stationInfo, Integer width, Integer height) throws QRCodeException {
		if (stationInfo == null) {
			throw new QRCodeException("错误的基站信息");
		}
		Long id = stationInfo.getId();
		String name = stationInfo.getName();
		String buildQRCodeString = qrCodeTools.buildQRCodeString(id + "", name);
		String filename = qrCodeTools.writeToFile(buildQRCodeString, width, height);
		QRCodeInfo qrCodeInfo = new QRCodeInfo();
		qrCodeInfo.setQrcode(buildQRCodeString);
		qrCodeInfo.setUrl(filename);
		stationInfo.setQrCodeInfo(qrCodeInfo);
		return stationInfo;
	}

	public StationInfo populateQRCodeWithStation(StationInfo stationInfo, boolean force, Integer width, Integer height)
			throws QRCodeException {
		QRCodeInfo qrCodeInfo = stationInfo.getQrCodeInfo();
		if (force) {
			populate(stationInfo, width, height);
		} else {
			if (qrCodeInfo == null) {
				populate(stationInfo, width, height);
			}
		}
		return stationInfo;
	}

	public StationInfo parseStationFromQRCode(String qrcode) throws QRCodeException {
		Map<String, String> parseQRCode = qrCodeTools.parseQRCode(qrcode);
		Long id = Long.parseLong(parseQRCode.get(QRCodeContext.QRCODE_INFO_ID_KEY));
		return stationRepository.findOne(id);
	}
}
