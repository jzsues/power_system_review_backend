/**
 * 
 */
package com.zvidia.backend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.backend.entity.CheckpointInfo;
import com.zvidia.backend.entity.DeviceClassInfo;
import com.zvidia.backend.meta.DefectType;
import com.zvidia.backend.repository.CheckpointRepository;
import com.zvidia.backend.repository.DeviceClassRepository;
import com.zvidia.common.controller.AbstractAjaxController;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/checkpoint")
public class CheckpointContoller extends AbstractAjaxController<CheckpointInfo, Long> {

	@Autowired
	CheckpointRepository checkpointRepository;

	@Autowired
	DeviceClassRepository deviceClassRepository;

	protected Object beforeFTLRender(HttpServletRequest request) {
		List<DeviceClassInfo> deviceClasses = deviceClassRepository.findAll();
		return deviceClasses;
	}

	@Override
	protected Page<CheckpointInfo> doPageQuery(Pageable pageable) {
		return checkpointRepository.findAll(pageable);
	}

	@Override
	protected void afterPageQuery(Page<CheckpointInfo> result) {
		for (CheckpointInfo checkpoint : result.getContent()) {
			checkpoint.setDefectType(DefectType.valueOf(checkpoint.getDefectType()).getName());
		}
	}

	@Override
	protected void beforeSaveRequest(CheckpointInfo entity, HttpServletRequest request) {
		Long deviceClassId = Long.parseLong(request.getParameter("deviceClassId"));
		DeviceClassInfo deviceClass = deviceClassRepository.findOne(deviceClassId);
		entity.setDeviceClassInfo(deviceClass);
	}

	@Override
	protected CheckpointInfo doSave(CheckpointInfo entity) {
		return checkpointRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		checkpointRepository.delete(id);
	}

	@Override
	protected CheckpointInfo doGet(Long id) {
		return checkpointRepository.findOne(id);
	}

}
