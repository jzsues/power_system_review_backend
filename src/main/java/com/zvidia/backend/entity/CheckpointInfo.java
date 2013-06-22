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

import javax.persistence.Entity;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.zvidia.backend.meta.DefectType;
import com.zvidia.common.entity.AbstractSQLEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "checkpoint_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class CheckpointInfo extends AbstractSQLEntity<Long> {
	/**
	 * 设备类别
	 */
	@OneToOne
	private DeviceClassInfo deviceClassInfo;

	/**
	 * 缺陷类型
	 * 
	 * @see DefectType
	 */
	private String defectType;

	/**
	 * 缺陷内容
	 */
	private String defectDetail;

	/**
	 * 是否报警
	 */
	private boolean alarm;

	public DeviceClassInfo getDeviceClassInfo() {
		return deviceClassInfo;
	}

	public void setDeviceClassInfo(DeviceClassInfo deviceClassInfo) {
		this.deviceClassInfo = deviceClassInfo;
	}

	public String getDefectType() {
		return defectType;
	}

	public void setDefectType(String defectType) {
		this.defectType = defectType;
	}

	public String getDefectDetail() {
		return defectDetail;
	}

	public void setDefectDetail(String defectDetail) {
		this.defectDetail = defectDetail;
	}

	public boolean isAlarm() {
		return alarm;
	}

	public void setAlarm(boolean alarm) {
		this.alarm = alarm;
	}

}
