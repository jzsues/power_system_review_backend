/**
 * 
 */
package com.zvidia.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.QRCodeInfo;

/**
 * @author jiangzm
 * 
 */
public interface QRCodeRepository extends JpaRepository<QRCodeInfo, Long> {

}
