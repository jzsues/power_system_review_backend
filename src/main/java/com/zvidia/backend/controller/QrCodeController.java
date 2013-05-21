/**
 * 
 */
package com.zvidia.backend.controller;

import java.util.List;
import java.util.concurrent.Callable;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zvidia.backend.entity.QRCodeInfo;
import com.zvidia.backend.entity.StationInfo;
import com.zvidia.backend.repository.QRCodeRepository;
import com.zvidia.backend.repository.StationRepository;
import com.zvidia.backend.service.QRCodeService;
import com.zvidia.common.controller.AbstractAjaxController;
import com.zvidia.common.entity.AjaxResponse;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/qrcode")
public class QrCodeController extends AbstractAjaxController<StationInfo, Long> {

	@Autowired
	QRCodeRepository qrCodeRepository;

	@Autowired
	StationRepository stationRepository;

	@Autowired
	QRCodeService qrCodeService;

	@Override
	protected Page<StationInfo> doPageQuery(Pageable pageable) {
		Page<StationInfo> findAll = stationRepository.findAll(pageable);
		return findAll;
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

	@RequestMapping(value = "/generate/{id}", method = { RequestMethod.POST })
	public @ResponseBody
	Callable<AjaxResponse> generate(@PathVariable final Long id, @RequestBody final QRCodeGenerationParams params) {
		return new Callable<AjaxResponse>() {
			@Override
			public AjaxResponse call() throws Exception {

				if (id == -1L) {
					// 刷新所有
					List<StationInfo> stations = stationRepository.findAll();
					for (StationInfo station : stations) {
						qrCodeService.populateQRCodeWithStation(station, params.getForce(), params.getWidth(), params.getHeight());
					}
					stationRepository.save(stations);
				} else {
					// 刷新单个
					StationInfo station = stationRepository.findOne(id);
					qrCodeService.populateQRCodeWithStation(station, params.getForce(), params.getWidth(), params.getHeight());
					stationRepository.save(station);
				}
				return new AjaxResponse();
			}

		};
	}

	@RequestMapping(value = "/clean/{id}", method = { RequestMethod.POST })
	public @ResponseBody
	Callable<AjaxResponse> clean(@PathVariable final Long id) {
		return new Callable<AjaxResponse>() {
			@Override
			public AjaxResponse call() throws Exception {
				StationInfo stationInfo = stationRepository.findOne(id);
				// QRCodeInfo qrCodeInfo = stationInfo.getQrCodeInfo();
				// qrCodeRepository.delete(qrCodeInfo);
				stationInfo.setQrCodeInfo(null);
				stationRepository.save(stationInfo);
				return new AjaxResponse();
			}
		};
	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class QRCodeGenerationParams {
		private Boolean force;
		private Integer width;
		private Integer height;
		private String mark;

		public Boolean getForce() {
			return force;
		}

		public void setForce(Boolean force) {
			this.force = force;
		}

		public Integer getWidth() {
			return width;
		}

		public void setWidth(Integer width) {
			this.width = width;
		}

		public Integer getHeight() {
			return height;
		}

		public void setHeight(Integer height) {
			this.height = height;
		}

		public String getMark() {
			return mark;
		}

		public void setMark(String mark) {
			this.mark = mark;
		}

	}

	@Override
	protected void beforeSaveRequest(StationInfo entity, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected Object beforeFTLRender(HttpServletRequest request) {
		return "success";
	}
}
