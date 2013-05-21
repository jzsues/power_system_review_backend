/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.StationInfo;

/**
 * @author jiangzm
 * 
 */
public interface StationRepository extends JpaRepository<StationInfo, Long> {

}
