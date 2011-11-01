package com.fishtel;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;


public class KiDSVT_LAB_2 {

	private static ArrayList<CircuitComponent> circuit;

	public static void main(String[] args) throws IOException {

		circuit = new ArrayList<CircuitComponent>();
		int numberOfElement = 0, numberDefect = 0;
		createCircuit();
		numberOfElement = inputParamers("Enter number of element :");
		numberDefect = inputParamers("Enter output defect (0 or 1) :");
		System.out.println("  1  2  3  4  5  6  7  8  9  10 11 12 13");
		Dalgorithm.reverceDWay(circuit, Dalgorithm.dWay(numberOfElement, numberDefect, circuit));
	}
	
	private static int inputParamers(String greetString) {
		int tempValue = 0;
		try {
			System.out.println(greetString);
			BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(System.in));
			String number = bufferedreader.readLine();
			tempValue = Integer.parseInt(number);
		} catch(NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tempValue;
	}
		
	private static void createCircuit() {
		CircuitComponent elem = new CircuitComponent(1, 8, new int[]{3});
		elem.setArrays(	SingularCoverage.singularCoverageElement1, 
						DCoverage.dCoverageComponent1);
		circuit.add(elem);
		
		elem = new CircuitComponent(2, 9, new int[]{5, 6});
		elem.setArrays(	SingularCoverage.singularCoverageElement2, 
						DCoverage.dCoverageComponent2);
		circuit.add(elem);

		elem = new CircuitComponent(3, 10, new int[]{1, 2});
		elem.setArrays(	SingularCoverage.singularCoverageElement3, 
						DCoverage.dCoverageComponent3);
		circuit.add(elem);
		
		elem = new CircuitComponent(4, 11, new int[]{4, 7, 9});
		elem.setArrays(	SingularCoverage.singularCoverageElement4, 
						DCoverage.dCoverageComponent4);
		circuit.add(elem);		
		
		elem = new CircuitComponent(5, 12, new int[]{8, 11});
		elem.setArrays(	SingularCoverage.singularCoverageElement5, 
						DCoverage.dCoverageComponent5);
		circuit.add(elem);
		
		elem = new CircuitComponent(6, 13, new int[]{10, 12});
		elem.setArrays(	SingularCoverage.singularCoverageElement6, 
						DCoverage.dCoverageComponent6);
		circuit.add(elem);		
	}
}
