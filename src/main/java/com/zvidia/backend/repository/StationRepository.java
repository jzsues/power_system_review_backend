/**
 * 
 */
package com.zvidia.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zvidia.backend.entity.StationInfo;

/**
 * @author jiangzm
 * 
 */
public interface StationRepository extends JpaRepository<StationInfo, Long> {
	public StationInfo findByQrCodeInfo_id(Long qrCodeId);

	public List<StationInfo> findByName(String name);

	public List<StationInfo> findByAddress(String address);
}
