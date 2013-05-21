/**
 * 
 */
package com.zvidia.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.backend.repository.FunctionRepository;
import com.zvidia.backend.repository.RoleRepository;
import com.zvidia.common.entity.RoleInfo;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/role")
public class RoleController extends AbstractAjaxController<RoleInfo, Long> {

	@Autowired
	FunctionRepository functionRepository;

	@Autowired
	RoleRepository roleRepository;

	@Override
	protected Page<RoleInfo> getAjaxPageData(Pageable pageable) {
		return roleRepository.findAll(pageable);
	}

	@Override
	protected void doProcess(Page<RoleInfo> result) {

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

}
