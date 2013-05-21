/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.ReviewInfo;

/**
 * @author jiangzm
 * 
 */
public interface ReviewRepository extends JpaRepository<ReviewInfo, Long> {

}
