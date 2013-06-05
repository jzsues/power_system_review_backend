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
