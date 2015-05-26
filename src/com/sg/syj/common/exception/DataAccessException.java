package com.sg.syj.common.exception;

/**
 * 系统数据访问处理异常类定�?
 * @author 何义�?
 * @version 1.0
 * @since 2012-06-25
*/
import java.sql.SQLException;

import org.mybatis.spring.MyBatisSystemException;

public class DataAccessException extends BaseException {

//	private static final long serialVersionUID = 7295074013749829966L;

	/**
	 * 
	 */
	private static final long serialVersionUID = -190236511407289558L;

	public DataAccessException(Throwable ex) {
	    
	    // by djdeng 获得不到原始的异常信�?
	    super(ex);
	    
		this.initCause(ex);
		if (ex instanceof MyBatisSystemException) {
			if (ex.getCause() != null)
				errorCode = ((SQLException) ex.getCause()).getErrorCode();
		}
	}
	public DataAccessException(String msg){
		super(msg);
	}
	
	public DataAccessException(Throwable ex, String msg) {
		super(msg, ex);
	}

	public String getLogMessage() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("数据处理错误: " + this.getCause().getMessage());
		return buffer.toString();
	}
}
