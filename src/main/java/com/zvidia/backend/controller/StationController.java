/**
 * 
 */
package com.zvidia.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.backend.entity.StationInfo;
import com.zvidia.backend.repository.StationRepository;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/station")
public class StationController extends AbstractAjaxController<StationInfo, Long> {

	@Autowired
	StationRepository stationRepository;

	@Override
	protected Page<StationInfo> getAjaxPageData(Pageable pageable) {
		return stationRepository.findAll(pageable);
	}

	@Override
	protected void doProcess(Page<StationInfo> result) {

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

}
