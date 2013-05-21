/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.common.entity.RoleInfo;

/**
 * @author jiangzm
 * 
 */
public interface RoleRepository extends JpaRepository<RoleInfo, Long> {

}
