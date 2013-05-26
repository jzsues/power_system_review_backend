/**
 * 
 */
package com.zvidia.backend.controller;

import java.util.Collection;
import java.util.List;
import java.util.concurrent.Callable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zvidia.backend.entity.CheckpointInfo;
import com.zvidia.backend.entity.ReviewInfo;
import com.zvidia.backend.entity.ReviewItemInfo;
import com.zvidia.backend.entity.StationInfo;
import com.zvidia.backend.meta.ReviewResult;
import com.zvidia.backend.repository.CheckpointRepository;
import com.zvidia.backend.repository.ReviewRepository;
import com.zvidia.backend.service.QRCodeService;
import com.zvidia.common.entity.AjaxResponse;
import com.zvidia.common.meta.AjaxResponseCode;
import com.zvidia.common.meta.AjaxResponseStatus;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/client")
public class ClientContoller {
	Log logger = LogFactory.getLog(getClass());

	@Autowired
	CheckpointRepository checkpointRepository;

	@Autowired
	ReviewRepository reviewRepository;

	@Autowired
	QRCodeService qrCodeService;

	/**
	 * 获取巡检缺陷点列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/checkpoint", method = { RequestMethod.GET })
	public @ResponseBody
	Callable<AjaxResponse> checkpoint() {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				try {
					Order order1 = new Order(Direction.ASC, "deviceClassInfo.id");
					Order order2 = new Order(Direction.ASC, "defectType");
					Sort sort = new Sort(order1, order2);
					List<CheckpointInfo> checkpoints = checkpointRepository.findAll(sort);
					return new AjaxResponse(checkpoints);
				} catch (Exception e) {
					return new AjaxResponse(AjaxResponseStatus.BAD_REQUEST.getCode(), AjaxResponseCode.ERROR.getCode());
				}
			}
		};
	}

	/**
	 * 存储巡检信息
	 * 
	 * @param reviewInfo
	 * @return
	 */
	@RequestMapping(value = "/review", method = { RequestMethod.POST })
	public @ResponseBody
	Callable<AjaxResponse> review(@RequestBody final ReviewInfo reviewInfo) {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				try {
					Collection<ReviewItemInfo> reviewItemInfos = reviewInfo.getReviewItemInfos();
					for (ReviewItemInfo reviewInfo : reviewItemInfos) {
						CheckpointInfo checkpointInfo = reviewInfo.getCheckpointInfo();
						// checkpoint需要报警并且异常时候
						if (checkpointInfo.isAlarm() && ReviewResult.abnormal.name().equals(reviewInfo.getResult())) {
							reviewInfo.setAlarm(true);
							break;
						}
					}

					ReviewInfo saved = reviewRepository.save(reviewInfo);
					return new AjaxResponse(saved);
				} catch (Exception e) {
					return new AjaxResponse(AjaxResponseStatus.BAD_REQUEST.getCode(), AjaxResponseCode.ERROR.getCode());
				}

			}
		};
	}

	/**
	 * 验证QRCODE是否正确，若正确则返回对应基站信息
	 * 
	 * @param qrcode
	 * @return
	 */
	@RequestMapping(value = "/check/{qrcode}", method = { RequestMethod.GET })
	public @ResponseBody
	Callable<AjaxResponse> check(@PathVariable final String qrcode) {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				try {
					StationInfo station = qrCodeService.parseStationFromQRCode(qrcode);
					return new AjaxResponse(station);
				} catch (Exception e) {
					return new AjaxResponse(AjaxResponseStatus.BAD_REQUEST.getCode(), AjaxResponseCode.ERROR.getCode());
				}
			}
		};
	}

}
