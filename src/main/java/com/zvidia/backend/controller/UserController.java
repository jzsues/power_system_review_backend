package com.zvidia.backend.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.backend.repository.FunctionRepository;
import com.zvidia.backend.repository.RoleRepository;
import com.zvidia.backend.repository.UserRepository;
import com.zvidia.common.controller.AbstractAjaxController;
import com.zvidia.common.entity.RoleInfo;
import com.zvidia.common.entity.UserInfo;

/**
 * Created with IntelliJ IDEA. User: jiangzm Date: 13-5-13 Time: 下午9:55 To
 * change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/user")
public class UserController extends AbstractAjaxController<UserInfo, Long> {
	@Autowired
	UserRepository userRepository;

	@Autowired
	FunctionRepository functionRepository;

	@Autowired
	RoleRepository roleRepository;

	@Override
	protected Page<UserInfo> doPageQuery(Pageable pageable) {
		return userRepository.findAll(pageable);
	}

	protected Object beforeFTLRender(HttpServletRequest request) {
		return roleRepository.findAll();
	}

	@Override
	protected void afterPageQuery(Page<UserInfo> result) {

	}

	@Override
	protected UserInfo doSave(UserInfo entity) {
		return userRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		userRepository.delete(id);
	}

	@Override
	protected UserInfo doGet(Long id) {
		return userRepository.findOne(id);
	}

	@Override
	protected void beforeSaveRequest(UserInfo entity, HttpServletRequest request) {
		long roleId = Long.parseLong(request.getParameter("roleId"));
		RoleInfo roleInfo = roleRepository.findOne(roleId);
		Collection<RoleInfo> authorities = entity.getAuthorities();
		authorities.add(roleInfo);
		entity.setAuthorities(authorities);
	}
}
