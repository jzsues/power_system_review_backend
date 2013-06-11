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
package com.zvidia.backend.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.zvidia.common.entity.AbstractSQLEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "review_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ReviewInfo extends AbstractSQLEntity {
	/**
	 * 巡检人
	 */
	@OneToOne
	private UserInfo userInfo;

	/**
	 * 巡检时间
	 */
	@Temporal(TemporalType.TIMESTAMP)
	private Date reviewTime;

	@OneToOne
	private StationInfo stationInfo;

	/**
	 * 巡检结果
	 */
	@OneToMany(cascade = { CascadeType.ALL })
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<ReviewItemInfo> reviewItemInfos;

	/**
	 * 是否有报警项目
	 */
	private boolean alarm;

	/**
	 * 报警消息是否已读
	 */
	private boolean readable;

	/**
	 * 巡检备注
	 */
	private String remark;

	/**
	 * 经度
	 */
	private double longitude;

	/**
	 * 纬度
	 */
	private double latitude;

	/**
	 * 定位半径
	 */
	private float radius;

	/**
	 * 地址
	 */
	private String address;

	/**
	 * 定位类型
	 */
	private int locType;

	private String handleResult;

	@OneToOne
	private UserInfo handleUserInfo;

	/**
	 * 是否处理
	 */
	private boolean handled;

	@Column
	@Temporal(TemporalType.TIMESTAMP)
	private Date handleTime;

	public String getHandleResult() {
		return handleResult;
	}

	public void setHandleResult(String handleResult) {
		this.handleResult = handleResult;
	}

	public UserInfo getHandleUserInfo() {
		return handleUserInfo;
	}

	public void setHandleUserInfo(UserInfo handleUserInfo) {
		this.handleUserInfo = handleUserInfo;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public float getRadius() {
		return radius;
	}

	public void setRadius(float radius) {
		this.radius = radius;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getLocType() {
		return locType;
	}

	public void setLocType(int locType) {
		this.locType = locType;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Date getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	public StationInfo getStationInfo() {
		return stationInfo;
	}

	public void setStationInfo(StationInfo stationInfo) {
		this.stationInfo = stationInfo;
	}

	public Collection<ReviewItemInfo> getReviewItemInfos() {
		return reviewItemInfos;
	}

	public void setReviewItemInfos(Collection<ReviewItemInfo> reviewItemInfos) {
		this.reviewItemInfos = reviewItemInfos;
	}

	public boolean isAlarm() {
		return alarm;
	}

	public void setAlarm(boolean alarm) {
		this.alarm = alarm;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public boolean isReadable() {
		return readable;
	}

	public void setReadable(boolean readable) {
		this.readable = readable;
	}

	public boolean isHandled() {
		return handled;
	}

	public void setHandled(boolean handled) {
		this.handled = handled;
	}

}
