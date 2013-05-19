/**
 * 
 */
package com.zvidia.backend.entity;

import javax.persistence.Entity;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.zvidia.common.entity.AbstractEntity;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "device_class_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeviceClassInfo extends AbstractEntity {
	private String name;

	private String remark;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
