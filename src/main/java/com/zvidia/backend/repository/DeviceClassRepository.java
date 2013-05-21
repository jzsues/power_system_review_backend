/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.DeviceClassInfo;

/**
 * @author jiangzm
 * 
 */
public interface DeviceClassRepository extends JpaRepository<DeviceClassInfo, Long> {

}
