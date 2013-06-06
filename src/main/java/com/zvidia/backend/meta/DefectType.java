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
package com.zvidia.backend.meta;

/**
 * @author jiangzm
 * 
 */
public enum DefectType {
	type1("Ⅰ类缺陷"), type2("Ⅱ类缺陷"), type3("Ⅲ类缺陷"), type4("Ⅳ类缺陷"), type5("外部隐患");

	private String name;

	private DefectType(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

}
