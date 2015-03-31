//I checked the JavaDoc output and it was OK.
//Aditya Agashe, netid: ava9, 9/3/2014
public class Elephant {
	/** An instance (i.e. object) maintains info about an elephant. */
	
	private String nickName; //Elephant nickname. length()>0
	private int birthYear; //Birth year of Elephant. >=2000
	private int birthMonth; //Birth month of Elephant. Range: 1-12
	private char gender; //M or F
	private Elephant mother; //Mother of Elephant Object
	private Elephant father; //Father of Elephant Object
	private int numberOfChildren; //Count of Elephant's children
	/**
	 * 
	 * Constructor: an instance with nickname n, gender g,
	 * birth year y, and birth month m.  Its parents are unknown,
	 * and it has no children. 
	 * 
	 * Precondition: n has at least 1 character, y >= 2000, 
	 * m is in 1..12, and g is 'M' for male or 'F' for female.
	 * */
	public Elephant(String n, char g, int y, int m){
		//Check Preconditions
		assert n.length()>=1; 
		assert y>=2000;
		assert m>=1 && m<=12;
		assert g=='M' || g=='F';
		
		//Assign inputs to field variables
		nickName = n;
		gender = g;
		birthYear = y;
		birthMonth = m;
		mother = null;
		father = null;
		numberOfChildren = 0;
	}
	/**
	 * Return this elephant's nickname
	 */
	public String getName() {
		return nickName;
	}
	/**
	 * Return the year this elephant was born
	 */
	public int getYear() {
		return birthYear;
	}
	/**
	 * Return the month this elephant was born
	 */
	public int getMonth() {
		return birthMonth;
	}
	/**
	 *  Return the value of "this elephant is a female"
	 */
	public boolean isFemale() {
		return gender=='F';
	}
	/**
	 *  Return this elephant's mother (null if unknown)
	 */
	public Elephant getMom() {
		return mother;
	}
	/**
	 *  Return this elephant's father (null if unknown)
	 */
	public Elephant getDad() {
		return father;
	}
	/**
	 * Return the number of children of this elephant
	 */
	public int getChildren() {
		return numberOfChildren;
	}
	/**
	 * Add e as this elephant's mother. 
	 * 
	 * Precondition: this elephant’s mother is unknown and e is female.
	 */
	public void addMom(Elephant e){
		assert mother == null;
		assert e.isFemale()==true;
		mother = e;
		e.numberOfChildren++;
	}
	/**
	 * Add e as this elephant's father. 
	 * 
	 * Precondition: This elephant's father is unknown and e is male.
	 */
	public void addDad(Elephant e){
		assert father == null;
		assert e.isFemale()==false;
		father = e;
		e.numberOfChildren++;
	}
	/**
	 * Constructor: an elephant with nickname n, gender g, 
	 * birth year y, birth month m, mother ma, and father pa.
	 * 
	 * Precondition: n has at least 1 character, y >= 2000, 
	 * g is ‘F’ for female or ‘M’ for male, m is in 1..12, 
	 * ma is a female, and pa is a male.
	 * */
	public Elephant(String n, char g,int y, 
			int m, Elephant ma, Elephant pa){
		//Check Preconditions
		assert n.length()>=1; 
		assert y>=2000;
		assert m>=1 && m<=12;
		assert g=='M' || g=='F';
		assert (ma!=null) && (ma.isFemale() == true);
		assert (pa!=null) && (pa.isFemale() == false);
		
		//Assign inputs to field variables
		nickName = n;
		gender = g;
		birthYear = y;
		birthMonth = m;
		mother = ma;
		father = pa;
		numberOfChildren = 0;
		
		ma.numberOfChildren++;
		pa.numberOfChildren++;
	}
	/**
	 * Return value of "this elephant is older than e.” 
	 * 
	 * Precondition: e is not null
	 * */
	public boolean isOlder(Elephant e){
		assert e!= null;
		return ((this!=e) && ((birthYear < e.getYear()) 
				|| ((birthYear == e.getYear())  && 
						(birthMonth < e.getMonth()))));
	}
	/**
	 * Return value of "this Elephant and e are siblings.” 
	 * (note: if e is null they can't be siblings, 
	 * so false should be returned).
	 * */
	public boolean isSibling(Elephant e){
		return ((this!=e) && (((e.getMom()!=null && mother!=null &&
				mother==e.getMom()) || (e.getDad()!=null && father!=null
				&& father==e.getDad()))));
	}   
}
