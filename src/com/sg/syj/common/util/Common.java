package com.sg.syj.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sg.syj.common.constant.Constants;

public class Common {

	public static String getMessage(String message, String param) {

		message = message.replace(Constants.CON_MSG_REPLACE1, param);
		return message;
	}

	public static String getMessage(String message, String param1, String param2) {

		message = message.replace(Constants.CON_MSG_REPLACE1, param1);
		message = message.replace(Constants.CON_MSG_REPLACE2, param2);
		return message;
	}

	public static String getMessage(String message, String param1, String param2,
			String param3) {

		message = message.replace(Constants.CON_MSG_REPLACE1, param1);
		message = message.replace(Constants.CON_MSG_REPLACE2, param2);
		message = message.replace(Constants.CON_MSG_REPLACE3, param3);
		return message;
	}
	
	public static String getSqlLikeEscapeStr(String str){
		
		str = str.replaceAll("/", "//");
		str = str.replaceAll("%", "/%");
		str = str.replaceAll("_", "/_");
		
		return str;
	}
	
	public static List<Map<String, String>> getNavtionType(){
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
			Map<String,String> map = new HashMap<String,String>();
			map.put("type",Constants.MENUTYPE_ACTIVITY);
			map.put("id", "1");
			Map<String,String> map1 = new HashMap<String,String>();
			map1.put("id", "2");
			map1.put("type",Constants.MENUTYPE_MEDIA);
			Map<String,String> map2 = new HashMap<String,String>();
			map2.put("type",Constants.MENUTYPE_SERVICE);
			map2.put("id", "3");
			list.add(map);
			list.add(map1);
			list.add(map2);
			return list;
	}
	
}
