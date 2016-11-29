package qtest;

import java.util.Scanner;

public class LevenshteinDistTest {

	public static int levenshteinDist(String s, String t) {
		if (s.equals(t)) {
			return 0;
		}
		if (s.length() == 0) {
			return t.length();
		}
		if (t.length() == 0) {
			return s.length();
		}

		int[] v0 = new int[t.length() + 1];
		int[] v1 = new int[s.length() + 1]; // t.length?

		for (int i = 0; i < v0.length; i++) {
			v0[i] = i;
		}

		for (int i = 0; i < s.length(); i++) {
			v1[0] = i+1;
			
			for(int j = 0; j<t.length(); j++){
				int cost = (s.charAt(i)==t.charAt(j)) ? 0 : 1;
				v1[j+1] = minimum(v1[j] + 1, v0[j+1] +1, v0[j]+cost);
			}
			
			for( int j = 0; j<v0.length; j++){
				v0[j] = v1[j];
			}
		}

		return v1[t.length()];
	}
	
	public static int minimum(int j, int k, int l){
		if(j<k && j < l){ return j;}
		if(k<j && k < l){ return k;}
		if(l<j && l < k){ return l;}
		return 123456789;
		
	}
	
	public static void main(String[] args) {
		boolean gotIt = false;
		Scanner s = new java.util.Scanner(System.in);
		
		while(gotIt==false){
		System.out.println("Enter string one: ");
		String input1 = s.nextLine();
		System.out.println("Enter string two: ");
		String input2 = s.nextLine();
		int levenInt = levenshteinDist(input1, input2);
		System.out.println("levenshtein Distance: "+levenInt);
		System.out.println();
		if(levenInt == 0){ gotIt = true;}
		
		}
		
		s.close();
	}
	
}