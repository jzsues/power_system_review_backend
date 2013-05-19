/**
 * 
 */
package com.zvidia.backend.entity;

import java.util.Collection;
import java.util.Date;

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
	@OneToMany
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<ReviewItemInfo> reviewItemInfos;

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

}
