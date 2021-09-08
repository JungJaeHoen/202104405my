package com.jsp.util;

import java.util.UUID;

public class MakeFileName {
	
	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + delimiter + fileName;
	}
	
	public static String parseFileNameFromUUID(String fileName, String delimeter) {
		String[] uuidFileName = fileName.split(delimeter);
		return uuidFileName[uuidFileName.length - 1];
	}
}
