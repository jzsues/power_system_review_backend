/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.ReviewItemInfo;

/**
 * @author jiangzm
 * 
 */
public interface ReviewItemRepository extends JpaRepository<ReviewItemInfo, Long> {

}
