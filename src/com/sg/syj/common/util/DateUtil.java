package com.sg.syj.common.util;

/**
 * 
 * @author 
 * @version 1.0
 * @since
*/
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.sg.syj.common.log.Log4j;

public class DateUtil {

	/**
	 * 获取当前日期，时�??
	 */
	public static Date getCurrentDate() {
		return new Date(System.currentTimeMillis());
	}

	public static String getSystemDateShortPattern() {
		return "yyyy-MM-dd";
	}

	public static String getSystemDateLongPattern() {
		return "yyyy-MM-dd HH:mm:ss";
	}

	/**
	 * 将字符串按系统设置的格式转换成字符串
	 */
	public static Date parseDate(String str) {
		if (str == null || str.equals(""))
			return null;

		Date dt = null;
		DateFormat dtFmt = new SimpleDateFormat(getSystemDateLongPattern());
		try {
			dt = new Date(dtFmt.parse(str).getTime());
		} catch (ParseException e) {
			Log4j.getInstance().error("Parser Exception: Invalid Date!",e);
			e.printStackTrace();
		}
		return dt;
	}
	
	/*
	 * 将字符串按系统设置的格式转换成字符串
	 */
	public static Date parseDate(String str,String pattern) {
		if (str == null || str.equals(""))
			return null;

		Date dt = null;
		DateFormat dtFmt = new SimpleDateFormat(pattern);
		try {
			dt = new Date(dtFmt.parse(str).getTime());
		} catch (ParseException e) {
			Log4j.getInstance().error("Parser Exception: Invalid Date!",e);
			e.printStackTrace();
		}
		return dt;
	}

	public static Timestamp parseTimestamp(String str) {
		if (str == null || str.equals(""))
			return null;

		Timestamp dt = null;
		DateFormat dtFmt = new SimpleDateFormat(getSystemDateShortPattern());
		try {
			dt = new Timestamp(dtFmt.parse(str).getTime());
		} catch (ParseException e) {
			Log4j.getInstance().error("Parser Exception: Invalid Date!",e);
			e.printStackTrace();
		}
		return dt;
	}

	/*
	 * 将日期，时间按系统设置的格式转换成字符串
	 */
	public static String toString(Date date) {
		if (date == null)
			return null;
		DateFormat dtFmt = new SimpleDateFormat(getSystemDateShortPattern());
		return dtFmt.format(date);
	}

	/*
	 * 将日期，时间按系统设置的格式转换成字符串
	 */
	public static String toString(Date date, String pattern) {
		if (date == null)
			return null;
		DateFormat dtFmt = new SimpleDateFormat(pattern);
		return dtFmt.format(date);
	}

	public static String toString(Timestamp timestamp, String pattern) {
		if (timestamp == null)
			return null;
		DateFormat dtFmt = new SimpleDateFormat(pattern);
		return dtFmt.format(timestamp);
	}

	public static String addDatetimeByYear(String datetime, int yrs) {
		Date date1 = DateUtil.parseDate(datetime);
		// 使用日历加天�??
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(date1);
		calendar.add(Calendar.YEAR, yrs);
		// 返回结果
		return getDate(calendar.getTime());
	}

	public static Date addDatetimeByYear(Date datetime, int yrs) {
		return DateUtil.parseDate(addDatetimeByYear(
				DateUtil.toString(datetime), yrs));
	}

	/**
	 * 将指定的日期时间字符串加上天数返回新的日期时间字符串。如�??1999-12-31 23:59:59 加上1天，结果�??2000-01-01
	 * 12:59:59
	 * 
	 * @param datetime
	 *            日期时间字符�??
	 * @param days
	 *            天数
	 * @return java.lang.String 日期时间字符�??
	 */
	public static String addDatetimeByDay(String datetime, int days) {
		Date date1 = DateUtil.parseDate(datetime,getSystemDateLongPattern());
		// 使用日历加天�??
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(date1);
		calendar.add(Calendar.DAY_OF_YEAR, days);
		// 返回结果
		return getDate(calendar.getTime(),getSystemDateLongPattern());
	}

	public static Date addDatetimeByDay(Date datetime, int days) {
		return DateUtil.parseDate(addDatetimeByDay(DateUtil.toString(datetime,getSystemDateLongPattern()),
				days));
	}

	/**
	 * 将指定的日期时间字符串加上月数返回新的日期时间字符串。如�??1999-12-31 23:59:59 加上1月，结果�??2000-01-31
	 * 23:59:59
	 * 
	 * @param datetime
	 *            日期时间字符�??
	 * @param months
	 *            月数
	 * @return java.lang.String 日期时间字符�??
	 */
	public static String addDatetimeByMonth(String datetime, int months) {
		Date date1 = DateUtil.parseDate(datetime);
		// 使用日历加月�??
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(date1);
		calendar.add(Calendar.MONTH, months);
		// 返回结果
		return getDate(calendar.getTime());
	}

	public static Date addDatetimeByMonth(Date datetime, int months) {
		return DateUtil.parseDate(addDatetimeByMonth(DateUtil
				.toString(datetime), months));
	}

	/**
	 * 将指定的日期时间字符串加上秒数返回新的日期时间字符串。如�??1999-12-31 23:59:59 加上3600秒，结果�??2000-01-01
	 * 00:59:59
	 * 
	 * @param datetime
	 *            日期时间字符�??
	 * @param seconds
	 *            秒数
	 * @return java.lang.String 日期时间字符�??
	 */
	public static String addDatetimeBySecond(String datetime, int seconds) {
		Date date1 = DateUtil.parseDate(datetime);
		// 使用日历加秒�??
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(date1);
		calendar.add(Calendar.SECOND, seconds);
		return getDate(calendar.getTime(),getSystemDateLongPattern());
	}

	public static Date addDatetimeBySecond(Date datetime, int seconds) {
		return DateUtil.parseDate(addDatetimeBySecond(DateUtil
				.toString(datetime,getSystemDateLongPattern()), seconds));
	}

	/**
	 * 得到当前日期，格�??2002-02-01
	 * 
	 * @return java.lang.String -返回当前日期字符串，格式为：Year-Month-day
	 */
	public static String getDate() {
		return getDate(new java.util.Date());
	}
	
	/**
	 * 得到当前日期，格�??2002-02-01
	 * 
	 * @return java.lang.String -返回当前日期字符串，格式为：Year-Month-day
	 */
	public static String getDate(String pattern) {
		return toString(getCurrentDate(), pattern);
	}

	/**
	 * 将指定日期转换为格式字符串，例如2002-12-12
	 * 
	 * @param date
	 *            日期对象
	 * @return java.lang.String
	 */
	public static String getDate(java.util.Date date,String pattern) {
		SimpleDateFormat formatter = new SimpleDateFormat(pattern);
		return formatter.format(date);
	}
	
	/**
	 * 将指定日期转换为格式字符串，例如2002-12-12
	 * 
	 * @param date
	 *            日期对象
	 * @return java.lang.String
	 */
	public static String getDate(java.util.Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat(
				getSystemDateShortPattern());
		return formatter.format(date);
	}

	/**
	 * 返回两个日期时间字符串之间的�??,日期尾减日期头，以秒为单位�?? 如果值为负数，说明日期头大于日期�?? �??
	 * 
	 * @param headDatetime -
	 *            日期�?? 格式�??1999-10-10 12:12:12
	 * @param tailDatetime -
	 *            日期�?? 格式�??1999-10-10 12:12:12
	 * @return long �??
	 */
	public static long getDatetimeGap(String headDatetime, String tailDatetime) {
		Date date1 = DateUtil.parseDate(headDatetime);
		Date date2 = DateUtil.parseDate(tailDatetime);

		long apple = date2.getTime() - date1.getTime();
		// 返回�??
		return apple / 1000;
	}

	/**
	 * 返回日期或日期时间字符串中的月份
	 * 
	 * @param datetime
	 *            日期或日期时间字符串
	 * @return int �??
	 * @roseuid 3F39FE460047
	 */
	public int getMonth(String datetime) {
		String s = DateUtil.toString(parseDate(datetime), "yyyy-MM-dd");
		return Integer.parseInt(s.substring(5, 7));
	}

	/**
	 * 返回日期或日期字符串中的年份
	 * 
	 * @param datetime
	 *            日期或日期字符串
	 * @return int 年份
	 */
	public int getYear(String datetime) {
		String s = DateUtil.toString(parseDate(datetime), "yyyy-MM-dd");
		return Integer.parseInt(s.substring(0, 4));
	}
	
	public static String getDataString(String s){
		String y = s.substring(0, 4);
		String m = s.substring(5, 7);
		String d = s.substring(8, 10);
		String h = s.substring(11, 13);
		String mi = s.substring(14, 16);
		String se = s.substring(17, 19);
		return y+m+d+h+mi+se;
	}

	/**
	 * 返回日期或日期时间字符字符串中的天数
	 * 
	 * @param datetime
	 *            日期或日期字符串
	 * @return int 天数
	 */
	public static int getDay(String datetime) {
		String s = DateUtil.toString(parseDate(datetime), "yyyy-MM-dd");
		return Integer.parseInt(s.substring(8, 10));
	}

	/**
	 * 返回日期或日期时间字符字符串中的小时数，范围�??0�??23
	 * 
	 * @param datetime
	 *            日期或日期字符串
	 * @return int 小时
	 * @roseuid 3F39FE460078
	 */
	public int getHour(String datetime) {
		String s = DateUtil
				.toString(parseDate(datetime), "yyyy-MM-dd HH:mm:ss");
		return Integer.parseInt(s.substring(11, 13));
	}

	/**
	 * 返回日期或日期时间字符字符串中的分钟�??
	 * 
	 * @param datetime
	 *            日期或日期字符串
	 * @return int 分钟
	 * @roseuid 3F39FE460083
	 */
	public int getMinute(String datetime) {
		String s = DateUtil
				.toString(parseDate(datetime), "yyyy-MM-dd HH:mm:ss");
		return Integer.parseInt(s.substring(14, 16));
	}

	/**
	 * 返回日期或日期时间字符字符串中的秒数
	 * 
	 * @param datetime
	 *            日期或日期字符串
	 * @return int 秒数
	 */
	public int getSecond(String datetime) {
		String s = DateUtil
				.toString(parseDate(datetime), "yyyy-MM-dd HH:mm:ss");
		return Integer.parseInt(s.substring(17, 19));
	}

	/**
	 * get the frist day of this month
	 * 
	 * @param datetime
	 * @return
	 */
	public static Date getFristDayOfThisMonth(String datetime) {

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(parseDate(datetime));
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date date = new Date(((java.util.Date) calendar.getTime()).getTime());
		return date;
	}

	/**
	 * get date by year and month the datetime format should be 'yyyy-mm'
	 * 
	 * @param datetime
	 * @return
	 */
	public static Date getDateTimeByYearAndMonth(String datetime) {
		int year = Integer.valueOf(datetime.substring(0, 4)).intValue();
		int month = Integer.valueOf(datetime.substring(5, datetime.length()))
				.intValue();
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month - 1);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date date = new Date(((java.util.Date) calendar.getTime()).getTime());
		return date;
	}

	/**
	 * get current month end
	 * 
	 * @return
	 */
	public static String getCurrentMonthEnd() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(DateUtil.getCurrentDate());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);

		if (month == 0) {
			year = year - 1;
			month = 12;
		} else {
			month = month - 1;
		}
		String currentMonthEnd = String.valueOf(year) + String.valueOf(month);
		return currentMonthEnd;
	}

	/**
	 * 比较传入的时间是否是当前日期之后
	 * 
	 * @param date
	 * @return
	 */
	public static boolean isAfterToday(java.util.Date date) {
		if (date != null && date.after(new java.util.Date()))
			return true;
		else
			return false;
	}
	public static void main(String [] args){
		System.out.println(getDate(parseDate("20121012","yyyyMMdd")));
	}
}
