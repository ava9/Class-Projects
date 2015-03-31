import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import java.awt.geom.*;
import java.awt.geom.Line2D.Double;
import java.awt.Toolkit;
import java.util.*;

/**  This class represents the painting canvas and implements all relevant
 * functionality. */
public class DrawingCanvas extends JPanel implements MouseListener, MouseMotionListener  {
	/** This is useful for creating custom cursors. */
	private static Toolkit tk = Toolkit.getDefaultToolkit();
	
	private final Color defColor= Color.BLACK; // Default foreground color
	
	private BufferedImage img; // The image.
    private int width;  // width of the image
	private int height;  // height of the image
	
	private PaintGUI window; // main window of the program
	
	private Tool activeTool; // the active tool.
	private int toolSize; // size of the tool.
	private double half; // half = toolSize/2.0
	
	private Point2D.Double pMouse; // Position of mouse
    private Point2D.Double prevMousePos; // previous mouse position (used to interpolate)
	
	private boolean pointGiven;       // State for line drawing. */
	private Point2D.Double linePoint; // State for line drawing.

	
	private boolean centerGiven;  // State for circle drawing
	private Point2D.Double center; // State for circle drawing
	
	private Color color;  // Foreground color (used for drawing).
	private Color backColor; // Background color (used for erasing).

	/** Random generator for airbrush. */
	private Random gen= new Random(System.currentTimeMillis());

	
	/**  Constructor: a new drawing pane.
	 * 
	 * @param window Main window of application.
	 * @param width Width of image.
	 * @param height Height of image.
	 * @param bckColor Background color.
	 * @param toolSize Tool size.
	 */
	public DrawingCanvas(PaintGUI window, int width, int height, Color bckColor, int toolSize) {
		this.window= window;
		this.width= width;
		this.height= height;
		this.activeTool= null;
		setToolSize(toolSize);
		
		// Create image with background color bckColor
		img= new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
		Graphics2D g2d= (Graphics2D) img.getGraphics();
		g2d.setColor(bckColor);
		g2d.fillRect(0, 0, width, height);
		
		color= defColor;
		backColor= bckColor;
		
		pMouse = new Point2D.Double(0, 0);
		
		addMouseListener(this);
		addMouseMotionListener(this);
	}
	
	/** Set the foreground color to c.
	 * Throw an IllegalArgumentException if c is null */
	public void setColor(Color c) {
		if (c == null)
			throw new IllegalArgumentException();
		
		color= c;
		
		if (activeTool == Tool.LINE  &&  pointGiven) {
			repaint();
		}
		if (activeTool == Tool.CIRCLE  &&  centerGiven) {
			repaint();
		}
	}
	
	/** Set the background color to c.
     * Throw an IllegalArgumentException if c is null */
	public void setBackColor(Color c) {
		if (c == null)
			throw new IllegalArgumentException();
		
		backColor= c;
	}
	
	/** return the Foreground color.  */
	public Color getColor() {
		return color;
	}
	
	/** Return the Background color. */
	public Color getBackColor() {
		return backColor;
	}
	
	/** Return the image. */
	public BufferedImage getImg() {
		return img;
	}
	
	/** Return the tool size. */
	public int getToolSize() {
		return toolSize;
	}
	
	/** Set the tool size to v+1.
	 * Throw an IllegalArgumentException if v < 0. */
	public void setToolSize(int v) {
		if (v < 0)
			throw new IllegalArgumentException("setToolSize: v < 0");
		toolSize= v+1;
		half= toolSize / 2.0;
	}
	
	/** Create new blank image of width w and height h with
	 * background color c. */
	public void newBlankImage(int w, int h, Color c) {
		width= w;
		height= h;
		
		//reset line/circle state
		pointGiven= false;
		centerGiven= false;
		
		img= new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
		Graphics2D g2d= (Graphics2D) img.getGraphics();
		g2d.setColor(c);
		g2d.fillRect(0, 0, w, h);
		
		repaint();
		revalidate();
	}
	
	/** Change the image to img. */
	public void newImage(BufferedImage img) {
		System.out.println("newImage");
		
		//reset line/circle state
		pointGiven= false;
		centerGiven= false;

		width= img.getWidth();
		height= img.getHeight();
		this.img= img;
		
		repaint();
		revalidate();
	}
	

	/** Return the dimension of this image. */
	public Dimension getPreferredSize() {
		return new Dimension(width, height);
	}
	
	/** Paint this component using g. */
	@Override
	public void paintComponent(Graphics g) {
		System.out.println("Paint drawing pane.");
		
		super.paintComponent(g);
		Graphics2D g2d = (Graphics2D) g;

		// Draw a border around the image.
		int z= 0;
		for (int i= 0; i<5; i++) {
			Color c= new Color(z,z,z);
			g2d.setColor(c);
			g2d.drawLine(0, height+i, width+i, height+i);
			g2d.drawLine(width+i, 0, width+i, height+i);
			z += 63;
		}

		
		g2d.drawImage(img, 0, 0, null);
			
		if (activeTool == Tool.LINE && pointGiven){
			
			Line2D.Double line = new Line2D.Double(linePoint.x, linePoint.y, pMouse.x, pMouse.y);
			Stroke extend= new BasicStroke(toolSize);
			g2d.setStroke(extend);
			g2d.setColor(color);
			g2d.draw(line);
		     
		}
		 else if (activeTool == Tool.CIRCLE && centerGiven){
			 
			 	double r = Math.sqrt(Math.pow(pMouse.x - center.x, 2) + Math.pow(pMouse.y - center.y, 2));
				double upLX = center.x - r; 
				double upLY = center.y - r; 
				Shape cir = new Ellipse2D.Double(upLX, upLY, r*2, r*2);
				Stroke thickCir = new BasicStroke(toolSize);
				g2d.setStroke(thickCir);
				g2d.setColor(color);
				g2d.draw(cir);

		 }
			
		setVisible(true);
	}

		
	
	
	/** Return the active tool. */
	public Tool getActiveTool() {
		return activeTool;
	}

	/** Set the active tool to t. */
	public void setActiveTool(Tool t) {
		// reset line/circle state
		pointGiven= false;
		centerGiven= false;
		
		// Change cursor.
		if (t == Tool.PENCIL) {
			Point hotspot= new Point(2,30);
			Image cursorImage= tk.getImage("pencil-cursor.png");
			Cursor cursor= tk.createCustomCursor(cursorImage, hotspot, "Custom Cursor");
			setCursor(cursor);
		}
		else if (t == Tool.ERASER) {
			Point hotspot= new Point(5,27);
			Image cursorImage= tk.getImage("eraser-cursor.png");
			Cursor cursor= tk.createCustomCursor(cursorImage, hotspot, "Custom Cursor");
			setCursor(cursor);
		}
		else if (t == Tool.COLOR_PICKER) {
			Point hotspot= new Point(9,23);
			Image cursorImage= tk.getImage("picker-cursor.png");
			Cursor cursor= tk.createCustomCursor(cursorImage, hotspot, "Custom Cursor");
			setCursor(cursor);
		}
		else if (t == Tool.AIRBRUSH) {
			Point hotspot= new Point(1,25);
			Image cursorImage= tk.getImage("airbrush-cursor.png");
			Cursor cursor= tk.createCustomCursor(cursorImage, hotspot, "Custom Cursor");
			setCursor(cursor);
		}
		else if (t == Tool.LINE) {
			Point hotspot= new Point(0,0);
			Image cursorImage= tk.getImage("line-cursor.png");
			Cursor cursor= tk.createCustomCursor(cursorImage, hotspot, "Custom Cursor");
			setCursor(cursor);
		}
		else if (t == Tool.CIRCLE) {
			Point hotspot= new Point(16,16);
			Image cursorImage= tk.getImage("circle-cursor.png");
			Cursor cursor= tk.createCustomCursor(cursorImage, hotspot, "Custom Cursor");
			setCursor(cursor);
		}
		else {
			System.err.println("setActiveTool " + t);
		}

		activeTool= t;		
	}
	
	public void mouseClicked(MouseEvent e) {
		// Nothing to do here.
	}
	
	public void mouseEntered(MouseEvent e) {
		// Nothing to do here.
	}
	
	/** Update the position of the mouse to the position given by e. */
	private void updateMousePosition(MouseEvent e) {
		int x = e.getX();
		int y = e.getY();
		
		//center of pixel
		pMouse = new Point2D.Double(x + 0.5, y + 0.5);
	}
	
	/** Process the press of the mouse, given by e. */
	public void mousePressed(MouseEvent e) {
		updateMousePosition(e);
		System.out.println("mousePressed: " + pMouse + ", active tool: " + getActiveTool());
		
		Graphics2D g2d = (Graphics2D) img.getGraphics();
		g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON); // anti-aliasing
		
		if (activeTool == Tool.PENCIL) {
			System.out.println("mousePressed: pencil");

			Shape rect = new Rectangle2D.Double(pMouse.x - half, pMouse.y - half, toolSize, toolSize);
			g2d.setColor(color);
			g2d.fill(rect);


		}
		else if (activeTool == Tool.ERASER) {
			System.out.println("mousePressed: eraser");
			
			Shape rect = new Rectangle2D.Double(pMouse.x - half, pMouse.y - half, toolSize, toolSize);
			g2d.setColor(backColor);
			g2d.fill(rect);
			

		}
		else if (activeTool == Tool.COLOR_PICKER) {
			System.out.println("mousePressed: pick color");
			if ((e.getX() < this.width) && (e.getY() < this.height)){
				
				//We must get color based on mouse position
				Color newColor = new Color(img.getRGB(e.getX(), e.getY()));
	 			if (e.getButton() == MouseEvent.BUTTON1) {
	 				color = newColor;
	 				window.updateColor();
	 			}
	 			else if (e.getButton() == MouseEvent.BUTTON3) {
	 				backColor = newColor;
	 				window.updateBackColor();
	 			}
			}
		}
		else if (activeTool == Tool.AIRBRUSH) {
			System.out.println("mousePressed: airbrush");
			int n = (int) (0.5 * (toolSize) * (toolSize));
			int count = 0;
			for (int k = 1; k <= n; k++){
				double x = (gen.nextDouble() * this.toolSize) + pMouse.x;
				double y = (gen.nextDouble() * this.toolSize) + pMouse.y;
				Shape s = new Rectangle2D.Double(x, y, 1, 1);
				if (count % 4 == 0){
					g2d.setColor(color);
					g2d.fill(s);
				}
				count++;
			}
			
		}
		else if (activeTool == Tool.LINE){
			System.out.println("mousePressed: line");

			//Start our line
			if(!pointGiven){
				if ((pMouse.x < this.width) && (pMouse.y < this.height)){
					linePoint = pMouse;
					pointGiven = true;
				}
			}
			
			//Since we have one point, let's draw the line
			else{
				pointGiven = false;
				Line2D.Double line = new Line2D.Double(linePoint.x, linePoint.y, pMouse.x, pMouse.y);
				Stroke s = new BasicStroke(toolSize);
				g2d.setStroke(s);
				g2d.setColor(color);
				g2d.draw(line);

			}
			
		}
		else if (activeTool == Tool.CIRCLE){
			System.out.println("mousePressed: circle");
			
			//Start our circle
			if (!centerGiven){
				if ((pMouse.x < this.width) && (pMouse.y < this.height)){
					center = pMouse;
					centerGiven = true;
				}

			}
			
			//If we have one point, draw the rest of the circle
			else{
				centerGiven = false;
				double r = Math.sqrt(Math.pow(pMouse.x - center.x, 2) 
						+ Math.pow(pMouse.y - center.y, 2));
				Shape c = new Ellipse2D.Double(center.x - r, center.y - r, r*2, r*2);
				Stroke s = new BasicStroke(toolSize);
				g2d.setStroke(s);
				g2d.setColor(color);
				g2d.draw(c);

			}
			
		}
		else {
			System.err.println("Unknown tool: " + activeTool);
		}
		
		// set prevMousePos
		prevMousePos= pMouse;
		window.setImageUnsaved();
		repaint();
	}
	
	public void mouseExited(MouseEvent e) {
		// Nothing to do here.
	}
	
	public void mouseReleased(MouseEvent e) {
		// End of drawing, reset prevMousePos.
		prevMousePos= null;
		repaint();
		
		
	}

	/** Draw a certain polygon that encloses points from and to, which are
	 * expected to be opposite corners of a square. half is expected to be
	 * half the width/height of the interpolated square. You have to execute
	 * this by hand to see the polygon that is being drawn.
	 * 
	 * YOU DO NOT HAVE TO USE THIS METHOD IF YOU DON'T WANT TO.
	 * 
	 * If you choose to use it, you need to read it and understand it.
	 * This might be useful for drawing with the pencil and for erasing.
	 *
	 * @param from Start point.
	 * @param to End point.
	 * @param half Half the width/height of the interpolated square.
	 * @return
	 */
	private static Path2D.Double createPolygon(Point2D.Double from, Point2D.Double to, double half) {
		Path2D.Double polygon= new Path2D.Double();
		
		// W.l.o.g. from.y <= to.y
		if (from.y > to.y) {
			Point2D.Double tmp= from;
			from= to;
			to= tmp;
		}
		
		// So, there are two cases to examine:
		// (1) from.x <= to.x
		// (2) from.x > to.x
		boolean fromXLess = from.x <= to.x;
		
		// Start point
		double startX = from.x-half;
		double startY = from.y-half;
		
		// 6 points: A,B,C,D,E,F
		Point2D.Double pA = new Point2D.Double(startX, startY);
		Point2D.Double pB = new Point2D.Double(from.x+half, startY);
		
		Point2D.Double pC;
		if (fromXLess)
			pC = new Point2D.Double(to.x+half, to.y-half);
		else
			pC = new Point2D.Double(from.x+half, from.y+half);
		
		Point2D.Double pD = new Point2D.Double(to.x+half, to.y+half);
		Point2D.Double pE = new Point2D.Double(to.x-half, to.y+half);
		
		Point2D.Double pF;
		if (fromXLess)
			pF = new Point2D.Double(startX, from.y+half);
		else
			pF = new Point2D.Double(to.x-half,to.y-half);
		
		// Draw the polygon
		polygon.moveTo(pA.x,pA.y);
		polygon.lineTo(pB.x,pB.y);
		polygon.lineTo(pC.x,pC.y);
		polygon.lineTo(pD.x,pD.y);
		polygon.lineTo(pE.x,pE.y);
		polygon.lineTo(pF.x,pF.y);
		polygon.lineTo(pA.x,pA.y);
		
		return polygon;
	}
	
	/** Process the dragging of the mouse given by e. */
	public void mouseDragged(MouseEvent e) {
		updateMousePosition(e);
		//can remove later (line below)
		window.setMousePosition(e.getX(), e.getY());
		System.out.println("mouseDragged: " + pMouse + ", active tool: " + activeTool);		
		
		Graphics2D g2d = (Graphics2D) img.getGraphics();
		g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		
		if (activeTool == Tool.PENCIL) {
			Path2D.Double p = DrawingCanvas.createPolygon(prevMousePos, pMouse, half);
			if (toolSize == 1){
				p = DrawingCanvas.createPolygon(prevMousePos, pMouse, toolSize);
			}
			g2d.setColor(color);
			g2d.fill(p);
			
		}
		else if (activeTool == Tool.ERASER) {
			Path2D.Double p = DrawingCanvas.createPolygon(prevMousePos, pMouse, half);
			g2d.setColor(backColor);
			g2d.fill(p);
			
		}
		else if (activeTool == Tool.COLOR_PICKER) {
			// Nothing to do here.
		}
		else if (activeTool == Tool.AIRBRUSH) {
			int n = (int) (0.5 * (toolSize)* (toolSize));
			int count = 0;
			for (int k = 1; k <= n; k++){
				double x = (gen.nextDouble() * toolSize) + pMouse.x;
				double y = (gen.nextDouble() * toolSize) + pMouse.y;
				Shape s = new Rectangle2D.Double(x, y, 1, 1);
				if (count % 4 == 0){
					g2d.setColor(color);
					g2d.fill(s);
				}
				count++;
			}
			
		}
		else {
			System.err.println("active tool: " + activeTool);
		}
		
		// update prevMousePos
		prevMousePos= pMouse;
		window.setImageUnsaved();
		repaint();
	}
	
	public void mouseMoved(MouseEvent e) {
		updateMousePosition(e);
		window.setMousePosition(e.getX(), e.getY());
		repaint();
		
	}

}
