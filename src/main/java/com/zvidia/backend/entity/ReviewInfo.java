/**
 * 
 */
package com.zvidia.backend.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.zvidia.common.entity.AbstractEntity;
import com.zvidia.common.entity.UserInfo;

/**
 * @author jiangzm
 * 
 */
@Entity(name = "review_info")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ReviewInfo extends AbstractEntity {
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

}
