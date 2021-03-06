import java.util.ArrayList; 
ArrayList<Ingredient> ingredients; //array list for ingredients
ArrayList<Ingredient> burger; //array list for ingredients in burger
BottomBun bottomBun; //one bottomBun object  
Order order; //one order object
PImage []ings = new PImage[5]; //makes images of ingredients into an array
float tip = 0; //initializes tip with a 0
int count;
PImage city;

void setup() {
  size(400, 600);
  ingredients = new ArrayList<Ingredient>(); //creates an array of ingredients 
  burger = new ArrayList<Ingredient>(); //creates an array of ingredients under 'burger' variable name
  bottomBun = new BottomBun(); //creates a bottomBun
  city = loadImage("city.jpg");
  city.resize(width, height); //to fit the dimensions of the window

  for (int i = 0; i < ings.length; i++) { //loads images of all ingredients
    ings[i] = loadImage("ing" + i +".png");
  }
  order = new Order(); //creates an older
  ingredients.add(new Ingredient()); //creates an ingredient
}

void draw() {
  background(city);  
  //creates a translucent rectangle at the top
  fill(128, 128, 128, 128);
  stroke(128, 128, 128, 128);
  rect(-10, -10, width + 10, 75);
  noFill();

  //to display the price
  fill(0);
  rect(-10, 5, 80, 25);
  noFill();
  textSize(17);
  fill(255);
  text("$" + String.format("%.2f", tip), 5, 24); //price to two significant figures

  //to display the tip
  fill(0);
  rect(-10, 35, 80, 25);
  noFill();
  textSize(17);
  fill(255);
  text(int(tip)/4 + "% tip", 5, 55); 

  if (frameCount % 100 == 0 && !order.complete) {   
    ingredients.add(new Ingredient()); //add a new ingredient to the array
  }

  bottomBun.setLocation(mouseX, 520); //sets location of bottomBun at the bottom of the screen, moving with the x-coordinate of the mouse
  bottomBun.display(); 
  order.display();

  for (int i = 0; i < ingredients.size(); i++ ) { //goes through all elements of the ingredients arrayList
    if (bottomBun.intersect(ingredients.get(i)) && !ingredients.get(i).inBurger) { //checks if the ingredient intersects with the bottomBun
      burger.add(ingredients.get(i));
      ingredients.get(i).caught();
    }
    ingredients.get(i).move(); 
    ingredients.get(i).display(); 
    if (ingredients.get(i).y > height) ingredients.remove(i); //remove the ingredient from the array when it leaves the screen at the bottom
  }
}
