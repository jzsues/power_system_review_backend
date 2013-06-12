/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
/**
 * 
 */
package com.zvidia.backend.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.Callable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zvidia.backend.entity.ReviewInfo;
import com.zvidia.backend.entity.StationInfo;
import com.zvidia.backend.entity.UserInfo;
import com.zvidia.backend.repository.ReviewItemRepository;
import com.zvidia.backend.repository.ReviewRepository;
import com.zvidia.backend.repository.ReviewSpecifications;
import com.zvidia.backend.repository.StationRepository;
import com.zvidia.backend.repository.UserRepository;
import com.zvidia.common.controller.AbstractAjaxCRUDController;
import com.zvidia.common.entity.AjaxResponse;
import com.zvidia.common.security.SecurityUtils;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/review")
public class ReviewController extends AbstractAjaxCRUDController<ReviewInfo, Long> {

	@Autowired
	ReviewRepository reviewRepository;

	@Autowired
	ReviewItemRepository reviewItemRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	StationRepository stationRepository;

	@Override
	protected Object beforeFTLRender(HttpServletRequest request) {
		return "success";
	}

	@Override
	protected void beforeSaveRequest(ReviewInfo entity, HttpServletRequest request) {
		long userId = Long.parseLong(request.getParameter("userId"));
		long stationId = Long.parseLong(request.getParameter("stationId"));
		UserInfo user = userRepository.findOne(userId);
		StationInfo station = stationRepository.findOne(stationId);
		entity.setStationInfo(station);
		entity.setUserInfo(user);
	}

	@Override
	protected Page<ReviewInfo> doPageQuery(Pageable pageable, HashMap<String, Object> query) {
		return reviewRepository.findAll(ReviewSpecifications.reviewQuery(query), pageable);
	}

	@Override
	protected void afterPageQuery(Page<ReviewInfo> result) {

	}

	@Override
	protected ReviewInfo doSave(ReviewInfo entity) {
		return reviewRepository.save(entity);
	}

	@Override
	protected void doDelete(Long id) {
		reviewRepository.delete(id);
	}

	@Override
	protected ReviewInfo doGet(Long id) {
		return reviewRepository.findOne(id);
	}

	@RequestMapping("/ajax/alarm/{page}/{size}")
	public @ResponseBody
	Callable<AjaxResponse> alarm(final @PathVariable Integer page, final @PathVariable Integer size) {
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				Sort sort = new Sort(Direction.DESC, "reviewTime");
				PageRequest pageRequest = new PageRequest(page, size, sort);
				Page<ReviewInfo> page = reviewRepository.findByAlarmAndHandled(true, false, pageRequest);
				// List<ReviewInfo> content = page.getContent();
				// for (ReviewInfo info : content) {
				// info.setReadable(true);
				// }
				// reviewRepository.save(content);
				return new AjaxResponse(page);
			}

		};
	}

	@RequestMapping(value = "/ajax/handle/{id}", method = { RequestMethod.POST })
	public @ResponseBody
	Callable<AjaxResponse> handle(final @PathVariable Long id, final @RequestParam String result) {
		final String username = SecurityUtils.checkUsername();
		return new Callable<AjaxResponse>() {

			@Override
			public AjaxResponse call() throws Exception {
				ReviewInfo review = reviewRepository.findOne(id);
				if (username != null) {
					logger.error("save handle user:" + username);
					UserInfo handleUserInfo = userRepository.findByUsername(username);
					review.setHandleUserInfo(handleUserInfo);
				}
				review.setReadable(true);
				review.setHandleResult(result);
				review.setHandleTime(new Date());
				review.setHandled(true);
				reviewRepository.save(review);
				return new AjaxResponse(review);
			}

		};
	}

}
