package com.fishtel;

import java.util.ArrayList;

public class Dalgorithm {
	
	private static int crossD(int a, int b) {
		int retVal = 8;
		switch(a) {
			case 0: {switch(b) {
						case 0: { retVal = 0; break;}
						case 1: { retVal = 4; break;}
						case 2: { retVal = 0; break;}
					}break;}
			
			case 1: {switch(b) {
						case 0: { retVal = 3; break;}
						case 1: { retVal = 1; break;}
						case 2: { retVal = 1; break;}
					}break;}
			
			case 2: {retVal = b; break;}
			
			case 3: {switch(b) {
					case 3: { retVal = 3; break;}
					case 2: { retVal = 3; break;}
				}break;	}
			case 4: {switch(b) {
					case 4: { retVal = 4; break;}
					case 2: { retVal = 4; break;}
		}break;	}			
			
			default: break;
		}
		return retVal;
	}
	
	private static int[] crossArrayD(int[] array, int[] arrayD) {
		int[] newArray = new int[13];
		for(int i=0; i<13; i++) {
			newArray[i] = crossD(array[i], arrayD[i]);
		}
		return newArray;
	}
	
	public static int[] dWay(int num, int numberDef, ArrayList<CircuitComponent> circuit) {
		int[] array = new int[13];
		int[] arrayD = new int[13];
		int[] arrayTemp =new int[13];
		CircuitComponent tempObj = new CircuitComponent();
		CircuitComponent obj = circuit.get(num-1);		//выбрали элемент
		array = obj.createDDefectArray(num, numberDef);
		WorkWithArray.printArray(array);
		System.out.println("   " + obj.numberElement);
		tempObj = obj;
		obj.check = true;
		
		while(tempObj.numberOutSlot != 13) {
			tempObj = tempObj.findNext(circuit);
			int i=0;
			do {
					System.arraycopy(tempObj.componentD[i], 0, arrayD, 0, 13);
					arrayTemp = crossArrayD(array, arrayD);
					i++;
				}while(WorkWithArray.testArray(arrayTemp));

				array = arrayTemp;
				tempObj.check = true;
				WorkWithArray.printArray(arrayD);
				System.out.println("   D " + tempObj.numberElement);
				WorkWithArray.printArray(array);
				System.out.println("   result");
		}
		return array;
	}
	
	public static void reverceDWay(ArrayList<CircuitComponent> circuit, int[] array) {
		int[] arraySingular = new int[13];
		int[] arrayTemp = new int[13];
		for(int i=0; i<circuit.size(); i++) {
			CircuitComponent obj = circuit.get(i);
			if(obj.check == false) {
				int j=0;
				do {
					System.arraycopy(obj.componentSingular[j], 0, arraySingular, 0, 13);
					arrayTemp = crossArrayD(array, arraySingular);
					j++;
				}while(WorkWithArray.testArray(arrayTemp));

				array = arrayTemp;
				obj.check = true;
				WorkWithArray.printArray(arraySingular);
				System.out.println("   S " + obj.numberElement);
				WorkWithArray.printArray(array);
				System.out.println("   result");
			}
		}
	}
}
