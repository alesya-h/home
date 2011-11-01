package com.fishtel;

import java.util.ArrayList;

public class CircuitComponent {

	public int [][] componentSingular;
	public int [][] componentD;
	public int numberElement;
	public int numberOutSlot;
	public int[] numberInSlots;
	public boolean check;
	
	public CircuitComponent() {
		
	}
	
	public CircuitComponent(int numberElem, int numOut, int[] arrayIn) {
		this.numberElement = numberElem;
		this.numberOutSlot = numOut;
		this.numberInSlots = arrayIn;
		check = false;
	}
	
	public void setArrays(int[][] sing, int[][] d) {
		componentSingular = sing;
		componentD = d;
	}
	
	public CircuitComponent findNext(ArrayList<CircuitComponent> circ) {
		for(int i=0; i < circ.size(); i++) {
			for(int j=0; j< (circ.get(i).numberInSlots).length; j++) {
				if(circ.get(i).numberInSlots[j] == this.numberOutSlot)
					return  circ.get(i);
			}
		}
		return null;
	}
	
	public int[] createDDefectArray(int num, int numberDef) {
		int[] array = new int[13];
			for(int i=0; i<this.componentSingular.length; i++ ) {
				if(numberDef == this.componentSingular[i][this.numberOutSlot-1]) {
					System.arraycopy(this.componentSingular[i], 0, array, 0, 13);
					break;
				}
			}
			if(array[this.numberOutSlot-1] == 0)
				array[this.numberOutSlot-1] = 3;
			else array[this.numberOutSlot-1] = 4;
			return array;
	}
}
