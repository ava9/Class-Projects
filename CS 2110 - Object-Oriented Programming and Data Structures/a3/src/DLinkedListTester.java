import static org.junit.Assert.*;

import org.junit.Test;


public class DLinkedListTester {

	@Test
	 public void testtoString() {
		 DLinkedList<Integer> list = new DLinkedList<Integer>();
		 assertEquals("[]", list.toString());
		 assertEquals("[]", list.toStringReverse());
		 assertEquals(0, list.size());
	 }
	
	@Test
	 public void testtoStringReverse() {
		 DLinkedList<Integer> list = new DLinkedList<Integer>();
		 assertEquals("[]", list.toString());
		 assertEquals("[]", list.toStringReverse());
		 assertEquals(0, list.size());
	 }

	@Test
	 public void testPrepend() { 
		DLinkedList<Integer> list = new DLinkedList<Integer>();
		assertEquals(list.size(), 0);
		assertEquals("[]", list.toString());
		assertEquals("[]", list.toStringReverse());
		
		list.prepend(5);
		assertEquals(list.size(), 1);
		assertEquals(list.toString(), "[5]");
		assertEquals(list.toStringReverse(), "[5]");
		
		list.prepend(7);
		assertEquals(list.size(), 2);
		assertEquals(list.toString(), "[7, 5]");
		assertEquals(list.toStringReverse(), "[5, 7]");
		
		list.prepend(100);
		assertEquals(list.size(), 3);
		assertEquals(list.toString(), "[100, 7, 5]");
		assertEquals(list.toStringReverse(), "[5, 7, 100]");
		
		list.prepend(0);
		assertEquals(list.size(), 4);
		assertEquals(list.toString(), "[0, 100, 7, 5]");
		assertEquals(list.toStringReverse(), "[5, 7, 100, 0]");
	 }

	@Test
	 public void testAppend() {
		
		DLinkedList<Integer> list = new DLinkedList<Integer>();
		assertEquals(list.size(), 0);
		assertEquals("[]", list.toString());
		assertEquals("[]", list.toStringReverse());
		
		list.append(5);
		assertEquals(list.size(), 1);
		assertEquals(list.toString(), "[5]");
		assertEquals(list.toStringReverse(), "[5]");
		
		list.append(7);
		assertEquals(list.size(), 2);
		assertEquals(list.toString(), "[5, 7]");
		assertEquals(list.toStringReverse(), "[7, 5]");
		
		list.append(100);
		assertEquals(list.size(), 3);
		assertEquals(list.toString(), "[5, 7, 100]");
		assertEquals(list.toStringReverse(), "[100, 7, 5]");
		
		list.append(0);
		assertEquals(list.size(), 4);
		assertEquals(list.toString(), "[5, 7, 100, 0]");
		assertEquals(list.toStringReverse(), "[0, 100, 7, 5]");
	 }
	@Test
	 public void testinsertBefore() {
		DLinkedList<Character> list = new DLinkedList<Character>();
		list.prepend('c'); //to have something to insert before
		list.insertBefore('v', list.getHead());
		assertEquals(list.size(), 2);
		assertEquals(list.toString(), "[v, c]");
		assertEquals(list.toStringReverse(), "[c, v]");
		
		list.insertBefore('a', list.getTail());
		assertEquals(list.size(), 3);
		assertEquals(list.toString(), "[v, a, c]");
		assertEquals(list.toStringReverse(), "[c, a, v]");
		
		list.insertBefore('b', list.getHead().successor());
		assertEquals(list.size(), 4);
		assertEquals(list.toString(), "[v, b, a, c]");
		assertEquals(list.toStringReverse(), "[c, a, b, v]");
		
		list.insertBefore('z', list.getTail().predecessor());
		assertEquals(list.size(), 5);
		assertEquals(list.toString(), "[v, b, z, a, c]");
		assertEquals(list.toStringReverse(), "[c, a, z, b, v]");
	 }

	@Test
	 public void testinsertAfter() {
		 
		DLinkedList<Character> list = new DLinkedList<Character>();
		list.prepend('c'); //to have something to insert after
		list.insertAfter('v', list.getTail());
		assertEquals(list.size(), 2);
		assertEquals(list.toString(), "[c, v]");
		assertEquals(list.toStringReverse(), "[v, c]");
		
		list.insertAfter('a', list.getHead());
		assertEquals(list.size(), 3);
		assertEquals(list.toString(), "[c, a, v]");
		assertEquals(list.toStringReverse(), "[v, a, c]");
		
		list.insertAfter('b', list.getTail().predecessor());
		assertEquals(list.size(), 4);
		assertEquals(list.toString(), "[c, a, b, v]");
		assertEquals(list.toStringReverse(), "[v, b, a, c]");
		
		list.insertAfter('z', list.getHead().successor());
		assertEquals(list.size(), 5);
		assertEquals(list.toString(), "[c, a, z, b, v]");
		assertEquals(list.toStringReverse(), "[v, b, z, a, c]");
	 }

	@Test
	 public void testRemove() {
		 
		DLinkedList<Integer> list = new DLinkedList<Integer>();
		list.prepend(2); 
		list.remove(list.getHead());
		assertEquals(list.size(), 0);
		assertEquals(list.toString(), "[]");
		assertEquals(list.toStringReverse(), "[]");
		
		list.prepend(2);
		list.insertBefore(4, list.getHead());
		list.insertBefore(5, list.getHead());
		list.insertBefore(6, list.getHead());
		assertEquals(list.size(), 4);
		assertEquals(list.toString(), "[6, 5, 4, 2]");
		assertEquals(list.toStringReverse(), "[2, 4, 5, 6]");
		
		list.remove(list.getHead().successor());
		assertEquals(list.size(), 3);
		assertEquals(list.toString(), "[6, 4, 2]");
		assertEquals(list.toStringReverse(), "[2, 4, 6]");
		
		list.remove(list.getTail());
		assertEquals(list.size(), 2);
		assertEquals(list.toString(), "[6, 4]");
		assertEquals(list.toStringReverse(), "[4, 6]");
		
		list.remove(list.getTail().predecessor());
		assertEquals(list.size(), 1);
		assertEquals(list.toString(), "[4]");
		assertEquals(list.toStringReverse(), "[4]");
		
		list.remove(list.getHead());
		assertEquals(list.size(), 0);
		assertEquals(list.toString(), "[]");
		assertEquals(list.toStringReverse(), "[]");
	 }
}
