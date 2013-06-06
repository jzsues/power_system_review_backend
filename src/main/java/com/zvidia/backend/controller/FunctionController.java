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

import com.zvidia.common.controller.AbstractAjaxCRUDController;
import com.zvidia.common.entity.FunctionInfo;
import com.zvidia.common.repository.FunctionRepository;

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
	protected Page<FunctionInfo> doPageQuery(Pageable pageable) {
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
