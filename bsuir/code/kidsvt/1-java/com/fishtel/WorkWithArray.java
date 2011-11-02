package com.fishtel;

public class WorkWithArray {
	public static boolean testArray(int[]array) {
		for(int i=0; i<array.length; i++) {
			if(array[i] == 8)
				return true;
		}
		return false;
	}
		
	public static void printArray(int[] array) {
		System.out.print("\n");
		for(int i=0; i<13; i++) {
			if(array[i] == 2) {
				System.out.print("  x");
			}else if(array[i] == 3) {
				System.out.print("  d");
			}else if(array[i] == 4) {
				System.out.print("  b");
			}else System.out.print("  " + array[i]);
		}
	}
}
