package com.controller;

import java.util.HashMap;

public class HashMapTest {

	public static void main(String[] args) {

		// HashMap
		// - 값을 저장할 때 Key, Value 형태로 저장
		// - Value는 중복 허용, Key 값은 중복 불가능
		// HashMap<Key DataType, Value DataType> h = new HashMap<>();
		
		// 사용예시
		// HashMap에 "이름" : "박병관" 저장하기
		
		HashMap<String,String> map = new HashMap<>();
		map.put("이름", "박병관");
		
		String name = map.get("이름");
		System.out.println(name);

	}

}
