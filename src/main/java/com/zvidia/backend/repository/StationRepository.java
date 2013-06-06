/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
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
