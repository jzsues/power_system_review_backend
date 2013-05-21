/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.CheckpointInfo;

/**
 * @author jiangzm
 * 
 */
public interface CheckpointRepository extends JpaRepository<CheckpointInfo, Long> {

}
