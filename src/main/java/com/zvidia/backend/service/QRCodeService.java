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
