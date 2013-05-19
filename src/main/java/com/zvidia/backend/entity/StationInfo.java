/**
 * 
 */
package com.zvidia.backend.entity;

import javax.persistence.Entity;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.zvidia.common.entity.AbstractEntity;

/**
 * 电力设备站点信息
 * 
 * @author jiangzm
 * 
 */
@Entity(name = "station_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class StationInfo extends AbstractEntity {

	private String name;

	private String address;

	/**
	 * 经度
	 */
	private String longitude;

	/**
	 * 纬度
	 */
	private String latitude;

	/**
	 * 备注
	 */
	private String remark;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
