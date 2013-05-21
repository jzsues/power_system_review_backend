/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.SystemSettingInfo;

/**
 * @author jiangzm
 * 
 */
public interface SystemSettingRepository extends JpaRepository<SystemSettingInfo, Long> {

}
