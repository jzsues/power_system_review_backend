package com.zvidia.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zvidia.backend.repository.InternalUserRepository;
import com.zvidia.common.entity.UserInfo;

/**
 * Created with IntelliJ IDEA. User: jiangzm Date: 13-5-13 Time: 下午9:55 To
 * change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/user")
public class UserController extends
		AbstractAjaxController<UserInfo, Long> {
	@Autowired
	InternalUserRepository internalUserRepository;

	@Override
	protected Page<UserInfo> getAjaxPageData(Pageable pageable) {
		return internalUserRepository.findAll(pageable);
	}

	@Override
	protected void doProcess(Page<UserInfo> result) {

	}

	@Override
	protected UserInfo doSave(UserInfo entity) {
		return internalUserRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		internalUserRepository.delete(id);
	}

	@Override
	protected UserInfo doGet(Long id) {
		return internalUserRepository.findOne(id);
	}
}
