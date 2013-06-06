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
package com.zvidia.backend.exception;

/**
 * @author jiangzm
 * 
 */
public class QRCodeException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1126170324719444665L;

	/**
	 * 
	 */
	public QRCodeException() {
	}

	/**
	 * @param message
	 */
	public QRCodeException(String message) {
		super(message);
	}

	/**
	 * @param cause
	 */
	public QRCodeException(Throwable cause) {
		super(cause);
	}

	/**
	 * @param message
	 * @param cause
	 */
	public QRCodeException(String message, Throwable cause) {
		super(message, cause);
	}
}
