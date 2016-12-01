package test;

import java.util.Scanner;

public class LevenshteinDistTest {

	public int levenshteinDist(String s, String t) {
		
//		if(s.contains(t)){
//			return 0;
//		}
		if(t.length()>s.length()){
			String t1 = s;
			String s1 = t;
			s = s1;
			t = t1;
		}
		if(s.equals(null)){
			s = "";
		}
		if(t.equals(null)){
			t= "";
		}
		if (s.equals(t)) {
			return 0;
		}
		if (s.length() == 0) {
			return t.length();
		}
		if (t.length() == 0) {
			return s.length();
		}

		int[] vt = new int[t.length() + 1];
		int[] vs = new int[s.length() + 1]; // t.length?

		for (int i = 0; i < vt.length; i++) {
			vt[i] = i;
		}

		for (int i = 0; i < s.length(); i++) {
			vs[0] = i+1;
			
			for(int j = 0; j<t.length(); j++){
				int cost = (s.charAt(i)==t.charAt(j)) ? 0 : 1;
				vs[j+1] = minimum(vs[j] + 1, vt[j+1] +1, vt[j]+cost);
			}
			
			for( int j = 0; j<vt.length; j++){
				vt[j] = vs[j];
			}
		}

		return vs[t.length()];
	}
	
	public int minimum(int j, int k, int l){
		
//		System.out.println("Before if statements: L="+l+", K="+k+", J="+j);
//		System.out.println("Minimum: "+Math.min(l, Math.min(j, k)));
		return Math.min(l, Math.min(j, k));
		
	}
	
	public void levTest(){
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
	
	public double levPercent(String input1, String input2){

//		double percent = ((double)(input1.length()-levenInt))/((double)input1.length());
		double levenInt = (double)levenshteinDist(input1, input2);
		
		if(input2.length()>input1.length()){
			String t1 = input1;
			String s1 = input2;
			input1 = s1;
			input2 = t1;
		}
		double in1length = (double)input1.length();
		double minusLength = 0.0D;
		
		if(in1length-levenInt > 0){
			minusLength = in1length - levenInt;
		}
		
		double percent = minusLength/in1length;
		
		return percent;
		
	}
	
}