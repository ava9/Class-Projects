import static org.junit.Assert.*;

import org.junit.Test;


public class ElephantTester {

	@Test
	public void testConstructor1(){
		
		//Create Female Elephant 
		String n = "Ellie";
		char g = 'F';
		int y = 2014;
		int m = 5;
		Elephant e = new Elephant (n, g, y, m);
		
		//Test Get Methods
		assertEquals("Ellie", e.getName());
		assertEquals(2014, e.getYear());
		assertEquals(5, e.getMonth());
		assertEquals(true, e.isFemale());
		assertEquals(null, e.getMom());
		assertEquals(null, e.getDad());
		assertEquals(0, e.getChildren());
	
		//Create Male Elephant
		String n1 = "Eli";
		char g1 = 'M';
		int y1 = 2014;
		int m1 = 5;
		Elephant e1 = new Elephant (n1, g1, y1, m1);
		
		//Test Get Methods
		assertEquals("Eli", e1.getName());
		assertEquals(2014, e1.getYear());
		assertEquals(5, e1.getMonth());
		assertEquals(false, e1.isFemale());
		assertEquals(null, e1.getMom());
		assertEquals(null, e1.getDad());
		assertEquals(0, e1.getChildren());
	}
	@Test
	public void testGroupB(){
		
		//Create Child Elephant
		String n = "Child";
		char g = 'M';
		int y = 2014;
		int m = 5;
		Elephant child = new Elephant (n, g, y, m);
		
		//Create Father Elephant
		String n1 = "Father";
		char g1 = 'M';
		int y1 = 2010;
		int m1 = 5;
		Elephant father = new Elephant (n1, g1, y1, m1);
		
		//Father is now Child's dad
		child.addDad(father);
		
		//Test Setter Method
		assertEquals(father, child.getDad());
		assertEquals(0, child.getChildren());
		assertEquals(1, father.getChildren());
		
		//Create Mother Elephant
		String n2 = "Mother";
		char g2 = 'F';
		int y2 = 2010;
		int m2 = 5;
		Elephant mother = new Elephant (n2, g2, y2, m2);
		
		//Mother is now Child's mom
		child.addMom(mother);
				
		//Test Setter Method
		assertEquals(mother, child.getMom());
		assertEquals(0, child.getChildren());
		assertEquals(1, mother.getChildren());
	}
	@Test
	public void testGroupC(){
		
		//Create Father Elephant
		String n = "Father";
		char g = 'M';
		int y = 2010;
		int m = 5;
		Elephant father = new Elephant (n, g, y, m);
		
		//Create Mother Elephant
		String n1 = "Mother";
		char g1 = 'F';
		int y1 = 2010;
		int m1 = 5;
		Elephant mother = new Elephant (n1, g1, y1, m1);
		
		//Create Male Child Elephant
		String n2 = "Child";
		char g2 = 'M';
		int y2 = 2014;
		int m2 = 5;
		Elephant child = new Elephant (n2, g2, y2, m2, mother, father);
		
		//Test Get Methods
		assertEquals("Child", child.getName());
		assertEquals(2014, child.getYear());
		assertEquals(5, child.getMonth());
		assertEquals(false, child.isFemale());
		assertEquals(mother, child.getMom());
		assertEquals(father, child.getDad());
		assertEquals(0, child.getChildren());
		
		assertEquals(1,father.getChildren());
		assertEquals(1,mother.getChildren());
		
		//Create Female Child Elephant
		String n3 = "Child2";
		char g3 = 'F';
		int y3 = 2014;
		int m3 = 5;
		Elephant child2 = new Elephant (n3, g3, y3, m3, mother, father);
				
		//Test Get Methods
		assertEquals("Child2", child2.getName());
		assertEquals(2014, child2.getYear());
		assertEquals(5, child2.getMonth());
		assertEquals(true, child2.isFemale());
		assertEquals(mother, child2.getMom());
		assertEquals(father, child2.getDad());
		assertEquals(0, child2.getChildren());
		
		assertEquals(2,father.getChildren());
		assertEquals(2,mother.getChildren());

	}
	@Test
	public void testGroupD(){
		//Create Elephant1
		String n = "1";
		char g = 'F';
		int y = 2014;
		int m = 5;
		Elephant e1 = new Elephant (n, g, y, m);
		
		//Create Elephant2
		n = "2";
		g = 'M';
		y = 2012;
		m = 5;
		Elephant e2 = new Elephant (n, g, y, m);
		
		//Create Elephant3
		n = "3";
		g = 'F';
		y = 2012;
		m = 5;
		Elephant e3 = new Elephant (n, g, y, m);
		
		//Create Elephant4
		n = "4";
		g = 'M';
		y = 2014;
		m = 6;
		Elephant e4 = new Elephant (n, g, y, m);
		
		//Test isOlder()
		assertEquals(false,e1.isOlder(e1));
		assertEquals(false,e1.isOlder(e2));
		assertEquals(false,e1.isOlder(e3));
		assertEquals(true,e1.isOlder(e4));
		
		assertEquals(true,e2.isOlder(e1));
		assertEquals(false,e2.isOlder(e2));
		assertEquals(false,e2.isOlder(e3));
		assertEquals(true,e2.isOlder(e4));
		
		assertEquals(true,e3.isOlder(e1));
		assertEquals(false,e3.isOlder(e2));
		assertEquals(false,e3.isOlder(e3));
		assertEquals(true,e3.isOlder(e4));
		
		assertEquals(false,e4.isOlder(e1));
		assertEquals(false,e4.isOlder(e2));
		assertEquals(false,e4.isOlder(e3));
		assertEquals(false,e4.isOlder(e4));
		
		//Create Elephant S1
		String n1 = "1";
		char g1 = 'F';
		int y1 = 2014;
		int m1 = 5;
		Elephant s1 = new Elephant (n1, g1, y1, m1, e1, e2);
		
		//Create Elephant S2
		g1 = 'M';
		Elephant s2 = new Elephant (n1, g1, y1, m1, e1, e2);
		
		//Create Elephant S3
		g1 = 'M';
		Elephant s3 = new Elephant (n1, g1, y1, m1, e3, e4);
		
		//Create Elephant S3
		g1 = 'M';
		Elephant s4 = new Elephant (n1, g1, y1, m1, e3, e2);
				
		
		//Test isSibling()
		assertEquals(false, s1.isSibling(s1)); // same object
		assertEquals(false, e1.isSibling(e2)); // 2 null moms and dads
		assertEquals(false, s1.isSibling(e1)); // 1 real mom, 1 null mom
		assertEquals(false, s2.isSibling(e2)); // 1 real dad, 1 null dad
		assertEquals(false, s1.isSibling(s3)); // 2 different real moms and dads
		assertEquals(false, s3.isSibling(s1)); // 2 different real moms and dads
		assertEquals(true, s1.isSibling(s2)); // 2 same real moms and dads
		assertEquals(true, s1.isSibling(s2)); // 2 same real moms and dads
		assertEquals(true, s3.isSibling(s4)); 
		assertEquals(true, s4.isSibling(s3)); 
		assertEquals(true, s4.isSibling(s2)); 
		assertEquals(true, s2.isSibling(s4)); 
	}

}
