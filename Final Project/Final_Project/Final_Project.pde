import java.util.ArrayList; 
ArrayList<Ingredient> ingredients;
ArrayList<Ingredient> burger;

BottomBun bottomBun; //one bottomBun object  
TopBun topBun; //one topButton object  
//Order order;
Timer timer; //one timer object
PImage []ings = new PImage[4]; //makes images of ingredients into an array
int totalIngredients = 0; //total ingredients
int cnt = 0;

void setup() {
  size(400, 600);
  ingredients = new ArrayList<Ingredient>();
  burger = new ArrayList<Ingredient>();
  //order = new Order();
  bottomBun = new BottomBun(); //creates a bottomBun
  bottomBun.setLocation(mouseX, 500); //sets location of bottomBun at the bottom of the screen, moving with the x-coordinate of the mouse
  topBun = new TopBun(); //creates a topBun

  timer = new Timer(300); //creates a timer that goes off every 300 milliseconds
  timer.start(); //starting the timer

  for (int i = 0; i < ings.length; i++) { //loads images of all ingredients
    ings[i] = loadImage("ing" + i +".png");
  }
  ingredients.add(new Ingredient());
  ingredients.add(new Ingredient());
}

void draw() {
  background(255);
  fill(128, 128, 128, 128);
  stroke(128, 128, 128, 128);
  rect(-10, -10, width + 10, 75);
  noFill();

  fill(0);
  rect(-10, 5, 80, 25);
  noFill();
  textSize(17);
  fill(255);
  text("$" + cnt, 5, 24); 

  fill(0);
  rect(-10, 35, 80, 25);
  noFill();
  textSize(17);
  fill(255);
  text(cnt + "% tip", 5, 55); 

  if (frameCount % 100 == 0) {  
    ingredients.add(new Ingredient());
    ingredients.add(new Ingredient());
    ingredients.add(new Ingredient());
    ingredients.add(new Ingredient());
  }

  bottomBun.setLocation(mouseX, 500); //sets location of bottomBun at the bottom of the screen, moving with the x-coordinate of the mouse
  bottomBun.display(); 
  //order.display();

  for (int i = 0; i < ingredients.size(); i++ ) { //goes through all elements of the ingredients arrayList
    if (bottomBun.intersect(ingredients.get(i)) && !ingredients.get(i).inBurger) { //checks if the ingredient intersects with the bottomBun
      burger.add(ingredients.get(i));
      ingredients.get(i).caught(); //calls the caught function for the ingredients
    }
    ingredients.get(i).move(); //calls the move function for the ingredient
    ingredients.get(i).display(); //calls the display function for the ingredient
    if (ingredients.get(i).y > height) ingredients.remove(i); //remove the ingredient from the array when it leaves the screen
  }

  topBun.move();
  //topBun.display();
  if (bottomBun.intersect(topBun)) { //checks if the ingredient intersects with the bottomBun
    topBun.caught(); //calls the caught function
  }
}

//println(burger.size()); //for debugging
