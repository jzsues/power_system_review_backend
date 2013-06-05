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
