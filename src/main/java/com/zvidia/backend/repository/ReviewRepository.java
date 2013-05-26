/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.ReviewInfo;

/**
 * @author jiangzm
 * 
 */
public interface ReviewRepository extends JpaRepository<ReviewInfo, Long> {
	public Page<ReviewInfo> findByAlarmAndReadable(boolean alarm, boolean readable, Pageable pageable);
}
