/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.common.entity.FunctionInfo;

/**
 * @author jiangzm
 * 
 */
public interface FunctionRepository extends JpaRepository<FunctionInfo, Long> {
	
}
