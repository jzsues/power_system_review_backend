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

import com.zvidia.backend.meta.ReviewResult;
import com.zvidia.common.entity.AbstractSQLEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "review_item_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ReviewItemInfo extends AbstractSQLEntity<Long> {
	/**
	 * 巡检项目
	 */
	@OneToOne
	private CheckpointInfo checkpointInfo;

	/**
	 * 巡检结果
	 * 
	 * @see ReviewResult
	 */
	private String result;

	/**
	 * 是否报警
	 */
	private boolean alarm;

	/**
	 * 备注
	 */
	private String remark;

	public CheckpointInfo getCheckpointInfo() {
		return checkpointInfo;
	}

	public void setCheckpointInfo(CheckpointInfo checkpointInfo) {
		this.checkpointInfo = checkpointInfo;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public boolean isAlarm() {
		return alarm;
	}

	public void setAlarm(boolean alarm) {
		this.alarm = alarm;
	}

}
