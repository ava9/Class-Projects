//Aditya Agashe (ava9) and Shankar Athinarayanan (sa625)

/** An instance contains static methods for assignment A2 */
public class A2 {

    /* NOTE: You will have to rely on methods that are declared in class String.
     * Visit docs.oracle.com/javase/7/docs/api/java/lang/String.html, scroll
     * down to the Method Summary, and peruse the available methods.
     * Oft-used ones are charAt, length(), trim, substring, indexOf, isEmpty,
     * lastIndexOf, startsWith, endsWith, split.
     * 
     * In all these methods, you can assume that String parameters are not null. */

    /** 
     * Strings s and s1 are not null. Return true iff s contains exactly one occurrence
     *  of s2.
     * 
     *  Examples: For s = "ab" and s2 = "bb", return false
     *            For s = "abbb" and s2 = "bbb", return true.
     *            For s = "abbbb" and s2 = "bb", return false. 
     */
    public static boolean containsOne(String s, String s2) {
        /** Do not use a loop or recursion. Instead, look through the
         * methods of class String and see how you can tell that the first
         * and last occurrences of s2 in s are the same. Be sure you handle
         * correctly the case that s2 does not occur in s. */
        int firstIndex = s.indexOf(s2);
        int lastIndex = s.lastIndexOf(s2);
        if ((firstIndex != -1) 
        		&& (lastIndex != -1) 
        		&& (firstIndex == lastIndex)){
        	return true;
        }
    	return false;
    }
    /** 
     * String s consists of a first name followed by a last name. The two names are
     * separated by 1 or more blanks. There may be blank characters at the
     * beginning of s and at the end of s. 
     * 
     * Examples: For s = "    David Gries"  return "Gries, David"
     *           For s = "Doug       James " return "James, Doug" 
     */
    public static String fixName(String s) {
        /* As you know, String is a class. An object of class String is immutable
         * --you cannot change the sequence of chars that it contains.
         * 
         * Do NOT use a loop or recursion. Use only if-statements,
         * assignments, and return statements. 
         * 
         * Finally, this method can be written using an oft-used pattern:
         *   1. Break the string into its parts
         *   2. Build the result from the parts. */
    	s = s.trim();
    	int firstBlank = s.indexOf(' ');
    	int lastBlank = s.lastIndexOf(' ');
    	String lastName = s.substring(0,firstBlank);
    	String firstName = s.substring(lastBlank+1, s.length());
    	s = firstName + ", " + lastName;
    	return s;
    }

    /** 
     * String s contains a person's first name, last name, and possibly a middle name
     * between them. There may be any number of blanks at the beginning and end
     * of s, but between each pair of names there is exactly one blank.
     * 
     * Return a String containing the person's initials.
     * 
     * Examples: For s = "    David Joseph Gries" return "DJG".
     *           For s = "Doug James", return "DJ"; 
     */
    public static String getInitials(String s) {
    	
    	String name = s.trim();
    	
    	String [] names = name.split(" ");
    	
    	if(names.length == 3){
    		return "" + names[0].charAt(0) + names[1].charAt(0) + names[2].charAt(0);
    	}
    	else if(names.length == 2){
    		return "" + names[0].charAt(0) + names[1].charAt(0);
    	}
    	
    	return "";
    	
    }
    
    /** 
     * Return a string that is s but with all lowercase vowels (a, e, i, o, u)
     * replaced by asterisks *.  
     * 
     * Examples: For s = "Minecraft" return "M*n*cr*ft".
     *           For s = "Alan Turing" return "Al*n T*r*ng".
     */
    public static String replaceVowels(String s) {
        // This can be done with five statements. No loop is required.
        // Look for a suitable String function that replaces things.
        s = s.replace("a", "*");
        s = s.replace("e", "*");
        s = s.replace("i", "*");
        s = s.replace("o", "*");
        s = s.replace("u", "*");
        return s;
    }
    
    /** 
     * Return a string that is s but with all lowercase and uppercase
     * vowels (a, e, i, o, u, A, E, I, O, U) replaced by asterisks *.  
     * 
     * Examples: For s = "Minecraft" return "M*n*cr*ft".
     *           For s = "Alan Turing" return "*l*n T*r*ng".
     */
    public static String replaceAllVowels(String s) {
    	
    	String [] vowels = {"a", "e", "i", "o", "u", "A", "E", "I", "O", "U"};
    	
    	s = s.trim();
    	
    	for (String vowel: vowels){
    		
    		s = s.replaceAll(vowel, "*");
    	}
    	
    	return s;
    }
    
    /** 
     * String s is written in a form that looks something like this: "b3c1b5x2a0".
     * For this s, we want to return the decompressed string "bbbcbbbbbxx".
     * More formally, s is in "compressed form", which means that it consists
     * of a sequence of characters that are NOT digits 0..9 with each character
     * followed by a digit; the digit indicates how many times that character
     * should appear. Return the uncompressed version of s.
     */
    public static String decompress(String s) {
	    
    	String decompressed = "";
    	
    	s = s.trim();
    	
    	for (int i = 0; i < s.length(); i++){
    		
    		if(s.charAt(i) >= '0' && s.charAt(i) <= '9'){
    			
    			int x = Integer.parseInt("" + s.charAt(i));
    			
    			for(int j = 0; j < x; j++){
    				decompressed += "" + s.charAt(i - 1);
    			}
    		}
    	}

        return decompressed;
    }
}
