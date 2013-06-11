/**
 * 
 */
package com.zvidia.backend.repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.data.jpa.domain.Specification;

import com.zvidia.backend.entity.ReviewInfo;

/**
 * @author jiangzm
 * 
 */
public class ReviewSpecifications {
	static Log logger = LogFactory.getLog(ReviewSpecifications.class);

	public static Specification<ReviewInfo> reviewQuery(final HashMap<String, Object> cond) {
		return new Specification<ReviewInfo>() {
			@SuppressWarnings("unused")
			@Override
			public Predicate toPredicate(Root<ReviewInfo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = null;
				if (cond != null && cond.size() > 0) {
					String stationName = (String) cond.get("q_station_name");
					String reviewer = (String) cond.get("q_reviever");
					String alarm = (String) cond.get("q_alarm");
					String reviewTimeBegin = (String) cond.get("q_review_time_begin");
					String reviewTimeEnd = (String) cond.get("q_review_time_end");
					if (StringUtils.isNotEmpty(stationName)) {
						if (predicate == null) {
							predicate = cb.equal(root.get("stationInfo").get("name"), stationName);
						} else {
							predicate = cb.and(predicate, cb.equal(root.get("stationInfo").get("name"), stationName));
						}
					}
					if (StringUtils.isNotEmpty(reviewer)) {
						if (predicate == null) {
							predicate = cb.equal(root.get("userInfo").get("nickName"), reviewer);
						} else {
							predicate = cb.and(predicate, cb.equal(root.get("userInfo").get("nickName"), reviewer));
						}
					}
					if (StringUtils.isNotEmpty(alarm)) {
						if (predicate == null) {
							predicate = cb.equal(root.get("alarm"), "true".equals(alarm));
						} else {
							predicate = cb.and(predicate, cb.equal(root.get("alarm"), "true".equals(alarm)));
						}
					}
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					if (StringUtils.isNotEmpty(reviewTimeBegin)) {
						try {
							if (predicate == null) {
								predicate = cb.greaterThanOrEqualTo(root.<Date> get("reviewTime"), sdf.parse(reviewTimeBegin));
							} else {
								predicate = cb.and(predicate,
										cb.greaterThanOrEqualTo(root.<Date> get("reviewTime"), sdf.parse(reviewTimeBegin)));
							}
						} catch (ParseException e) {
							logger.error("error", e);
						}
					}
					if (StringUtils.isNotEmpty(reviewTimeEnd)) {
						try {
							if (predicate == null) {
								predicate = cb.lessThanOrEqualTo(root.<Date> get("reviewTime"), sdf.parse(reviewTimeEnd));
							} else {
								predicate = cb
										.and(predicate, cb.lessThanOrEqualTo(root.<Date> get("reviewTime"), sdf.parse(reviewTimeEnd)));
							}
						} catch (ParseException e) {
							logger.error("error", e);
						}
					}

				}
				return predicate;
			}
		};
	}
}
