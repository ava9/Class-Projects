import static org.junit.Assert.*;

import org.junit.Test;


public class A2Tester2 {

	@Test
	
	public void testContainsOne() {
		/** 
	     * Strings s and s1 are not null. Return true iff s contains exactly one occurrence
	     *  of s2.
	     * 
	     *  Examples: For s = "ab" and s2 = "bb", return false
	     *            For s = "abbb" and s2 = "bbb", return true.
	     *            For s = "abbbb" and s2 = "bb", return false. 
	     */
		String s = "ab";
		String s2 = "bb";
		assertEquals(false, A2.containsOne(s, s2));
		
		s = "abbb";
		s2 = "bbb";
		assertEquals(true, A2.containsOne(s, s2));
		
		s = "abbbb";
		s2 = "bb";
		assertEquals(false, A2.containsOne(s, s2));
		
		s = "abbbb";
		s2 = "c";
		assertEquals(false, A2.containsOne(s, s2));
		
	}

	@Test
	public void testFixName() {
		  /** 
	     * String s consists of a first name followed by a last name. The two names are
	     * separated by 1 or more blanks. There may be blank characters at the
	     * beginning of s and at the end of s. 
	     * 
	     * Examples: For s = "    David Gries"  return "Gries, David"
	     *           For s = "Doug       James " return "James, Doug" 
	     */
		String s = "    David Gries";
		assertEquals("Gries, David", A2.fixName(s));
		
		s = "Doug       James ";
		assertEquals("James, Doug", A2.fixName(s));
	}

	@Test
	public void testInitials() {
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
		String name = "    David Joseph Gries";
		
		String name1 = "Doug James";
		
		assertEquals(A2.getInitials(name), "DJG");
		assertEquals(A2.getInitials(name1), "DJ");
	}

	@Test
	public void testReplaceVowels() {
	    /** 
	     * Return a string that is s but with all lowercase vowels (a, e, i, o, u)
	     * replaced by asterisks *.  
	     * 
	     * Examples: For s = "Minecraft" return "M*n*cr*ft".
	     *           For s = "Alan Turing" return "Al*n T*r*ng".
	     */
		String s = "Minecraft";
		assertEquals("M*n*cr*ft", A2.replaceVowels(s));
		
		s = "Alan Turing" ;
		assertEquals("Al*n T*r*ng", A2.replaceVowels(s));
	}

	@Test
	public void testReplaceAllVowels() {
		/** 
	     * Return a string that is s but with all lowercase and uppercase
	     * vowels (a, e, i, o, u, A, E, I, O, U) replaced by asterisks *.  
	     * 
	     * Examples: For s = "Minecraft" return "M*n*cr*ft".
	     *           For s = "Alan Turing" return "*l*n T*r*ng".
	     */
		String s = "Minecraft";
		String s1 = "Alan Turing";
		
		assertEquals(A2.replaceAllVowels(s), "M*n*cr*ft");
		assertEquals(A2.replaceAllVowels(s1), "*l*n T*r*ng");
		
	}

	@Test
	public void testDecompress() {
		/** 
	     * String s is written in a form that looks something like this: "b3c1b5x2a0".
	     * For this s, we want to return the decompressed string "bbbcbbbbbxx".
	     * More formally, s is in "compressed form", which means that it consists
	     * of a sequence of characters that are NOT digits 0..9 with each character
	     * followed by a digit; the digit indicates how many times that character
	     * should appear. Return the uncompressed version of s.
	     */
		String s = "b3c1b5x2a0";
		
		assertEquals(A2.decompress(s), "bbbcbbbbbxx");
		
	}
}
