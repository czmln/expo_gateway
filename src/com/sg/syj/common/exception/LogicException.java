package com.sg.syj.common.exception;

public class LogicException extends RuntimeException {

	/**
	 * 系统逻辑异常
	 * 
	 * @author 段正刚
	 * @date 2015.3.12
	 */

	private static final long serialVersionUID = 1L;

	private int errorCode;

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

	public LogicException() {
		super();
	}

	public LogicException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public LogicException(String message, Throwable cause) {
		super(message, cause);
	}

	public LogicException(String message,int errorCode) {
		super(message);
		this.errorCode=errorCode;
	}
	public LogicException(String message) {
		super(message);
	}

	public LogicException(Throwable cause) {
		super(cause);
	}
	
	
	
}
