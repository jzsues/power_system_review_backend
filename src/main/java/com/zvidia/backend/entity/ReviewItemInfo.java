/**
 * 
 */
package com.zvidia.backend.entity;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.zvidia.common.entity.AbstractEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "review_item_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ReviewItemInfo extends AbstractEntity {
	/**
	 * 巡检项目
	 */
	@OneToOne
	private CheckpointInfo checkpointInfo;

	/**
	 * 巡检结果
	 */
	private String result;

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

}
