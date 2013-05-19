/**
 * 
 */
package com.zvidia.backend.entity;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.zvidia.backend.meta.DefectType;
import com.zvidia.common.entity.AbstractEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "checkpoint_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class CheckpointInfo extends AbstractEntity {
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
