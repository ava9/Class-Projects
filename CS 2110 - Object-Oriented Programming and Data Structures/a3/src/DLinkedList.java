/* Time spent on a3:  2 hours and 0 minutes.

 * Name: Aditya Agashe (ava9) and Shankar Athinarayanan (sa625)
 * Netid: ava9, sa625
 * What I thought about this assignment:
 * It was fun.  We learned a lot.
 *
 */

/** An instance is a doubly linked list. */
public class DLinkedList<E> {
    private Node head; // first node of linked list (null if none)
    private Node tail; // last node of linked list (null if none)

    private int size; // Number of values in the linked list.

    /** Constructor: an empty linked list. */
    public DLinkedList() {
    }

    /** Return the number of values in this list. */
    public int size() {
        return size;
    }

    /** Return the first node of the list (null if the list is empty). */
    public Node getHead() {
        return head;
    }

    /** Return the last node of the list (null if the list is empty). */
    public Node getTail() {
        return tail;
    }

    /** Return the value of node e of this list.
     * Precondition: e must be a node of this list; 
     * it may not be null. */
    public E valueOf(Node e) {
        assert e != null;
        return e.value;
    }
    
    /** Return a representation of this list: its values, 
     * with adjacent ones separated by 
     * ", ", "[" at the beginning, and "]" at the end. <br>
     * 
     * E.g. for the list containing 6 3 8 in that order, 
     * the result it "[6, 3, 8]". */
    public String toString() {
    	
    	String listString = "";
    	
    	Node curNode = head;
    	
    	while (curNode != null){
    		listString += curNode.getValue();
    		
    		if(curNode.successor() != null){
    			listString += ", ";
    		}
    		curNode = curNode.successor();
	
    	}

        return "[" + listString + "]";
    }

    /** Return a representation of this list: its values in
     * reverse, with adjacent ones separated by ", ", "[" 
     * at the beginning, and "]" at the end. <br>
     * 
     * E.g. for the list containing 6 3 8 in that order,
     * the result it "[8, 3, 6]".*/
    public String toStringReverse() {
        // Write this method second. You can test it on the 
    	//empty list, which the constructor creates. You can't do 
    	//any more testing until you have written append.
    	//Then test toString, toStringReverse, and prepend together.
        
        // IMPORTANT: This method should NOT use field size. 
    	// In order to use toStringReverse for testing, 
    	//as we advocate in the handout, toStringReverse
        // uses only the tail and pred fields.
    	
    	String listString = "";
    	
    	Node curNode = tail;
    	
    	while (curNode != null){
    		listString += curNode.getValue();
    		
    		if(curNode.predecessor() != null){
    			listString += ", ";
    		}
    		curNode = curNode.predecessor();
	
    	}

        return "[" + listString + "]";
    }
 
    /** Insert value v in a new node at the beginning of the list and
     * return the new node */
    public Node prepend(E v) {
        
    	//List consists of only one node
        if(head == null){
        	head = new Node(null, null, v);       	
        	tail = head;
        }
        
        //Insert new node at beginning of list
        else{       	
        	head.pred = new Node(null, head, v);
        	head = head.pred;
        }
    	
        //We have a new head node
        size++;
        
        return head;
    }

    /** add value v in a new node at the end of the list and
     * return the new node. */
    public Node append(E v) {
        // Method append is the fourth function to write and test.
    	//Don't go on until you believe that it is correct.
    	
    	//List consists of only one node
        if(tail == null){
        	tail = new Node(null, null, v);       	
        	head = tail;
        }
        
        //Insert new node at end of list
        else{       	
        	tail.succ = new Node(tail, null, v);
        	tail = tail.succ;
        }
    	
        //We have a new tail node
        size++;
        
        return tail;
        
    }

    /** Insert value v in a new node before element e and
     * return the new node.
     * Precondition: e must be a node of this list; 
     * it may not be null. */
    public Node insertBefore(E v, Node e) {
        
    	//Insert new node at beginning of list
        if(e.predecessor() == null){
        	prepend(v);
        }
        
        else{
        	e.pred = new Node(e.pred, e, v);
        	e.pred.pred.succ = e.pred;
        	size++;
        }
        return null;
    }

    /** Insert value v in a new node after node e and
     * return the new node.
     * Precondition: e must be an node of this list; 
     * it may not be null. */
    public Node insertAfter(E v, Node e) {
        // Method insertAfter is the sixth function to write and test. 
    	//Don't go on until you believe that it is correct.
        // Here is a hint: There really are two cases: 
    	//inserting a node after the last node is different from 
    	//inserting one after any other node. Draw two pictures.
        // Can you do the first case in terms of a previously 
    	//written method?
        
    	//Insert new node at beginning of list
        if(e.successor() == null){
        	append(v);
        }
        
        else{
        	e.succ = new Node(e, e.succ, v);
        	e.succ.succ.pred = e.succ;
        	size++;
        }
        return null;
    }

    /** Remove node e from this list.
     * Precondition: e must be a node of this list; 
     * it may not be null. */
    public void remove(Node e) {
       
    	//Extreme case (base case)
    	if (e.predecessor() == null && e.successor() == null){
    		head = null;
    		tail = null;
    	}
    	
    	
    	else if (e.predecessor() == null){
        	head = e.successor();
        	e.succ.pred = null;
        }
    	
    	else if (e.successor() == null){
        	tail = e.predecessor();
        	e.pred.succ = null;
        }
    	
    	else {
        	e.predecessor().succ = e.successor();
        	e.successor().pred = e.predecessor();
        }
    	
        e = null;
        size--;
    } 
    
   
    /*********************/

    /** An instance is a node of this list. */
    public class Node {
        /** Predecessor of this node on the list 
         * (null if the list is empty). */
        private Node pred;

        /** The value of this element. */
        private E value; 

        /** Successor of this node on the list. 
         * (null if the list is empty). */
        private Node succ; 

        /** Constructor: an instance with predecessor p 
         * (p can be null), successor s (s can be null),
         * and value v. */
        private Node(Node p, Node s, E v) {
            pred= p;
            succ= s;
            value= v;
        }

        /** Return the value of this node. */
        public E getValue() {
            return value;
        }
        
        /** Return the predecessor of this node e in the list 
         * (null if e is the first node of this list). */
        public Node predecessor() {
            return pred;
        }

        /** Return the successor of this node in this list 
         * (null if e is the last node of this list). */
        public Node successor() {
            return succ;
        }
    }

}
