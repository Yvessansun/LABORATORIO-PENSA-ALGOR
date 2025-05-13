//Este es el boceto (aún no es funcional) del minijuego que estoy desarrollando 
//Para la entrega final, es basado en imágenes y reacciones consecuentes a
//interacciones básicas como clic y enter
//Es por eso que usaré comandos como PImage y no comandos como void draw

//Escribo el código en inglés porque todo el juego será en inglés y es más fácil 
//coordinar los nombres si las imágenes y código están iguales.

PImage mainScreen;
PImage foodMenu, clothesMenu;
PImage[] foodOptions = new PImage[4];
PImage[] clothesOptions = new PImage[4];
PImage currentStateImage;
PImage keyboardImage;

//Estos serán iconos que incluiran las opiones de alimento y ropa 
//Que puedes escoger para aplicar al conejo.
//He usado boolean true para el teclado ya que es el que siempre se muestra
//en pantalla, sin importar el estado o actividad que tome lugar.

boolean showFoodMenu = false;
boolean showClothesMenu = false;
boolean showKeyboard = true;

//Outfit seleccionados (Actividad ropa) (Sólo se puede usar un top y un sombrero a la vez)
int selectedTop = -1;
int selectedHat = -1;

//Canvas básico estático
void setup() {
  size(1000, 1000);

  //Pantalla "Home" o MainScreen
  mainScreen = loadImage("main.png");

  //Menús
  foodMenu = loadImage("food_menu.png");
  clothesMenu = loadImage("clothes_menu.png");
  keyboardImage = loadImage("keyboard.png");

  //Opciones de comida (Hay 4: Zanahoria, Manzana, Galleta, Fresa)
  foodOptions[0] = loadImage("eat_carrot.png");
  foodOptions[1] = loadImage("eat_apple.png");
  foodOptions[2] = loadImage("eat_cookie.png");
  foodOptions[3] = loadImage("eat_strawberry.png");

  //Opciones de ropa (También hay 4: TOPS: Blue Overall, Pink Shirt. HATS: Duck Hat, Bucket Hat)
  clothesOptions[0] = loadImage("top_blue_overall.png");
  clothesOptions[1] = loadImage("top_pink_shirt.png");
  clothesOptions[2] = loadImage("hat_duck.png");
  clothesOptions[3] = loadImage("hat_bucket.png");

  //Estado inicial
  currentStateImage = mainScreen;
}

void draw() {
  background(255);
  image(currentStateImage, 0, 0);

  //Mostrar menús si están activos
  if (showFoodMenu) {
    image(foodMenu, 0, 0);
  }
  if (showClothesMenu) {
    image(clothesMenu, 0, 0);
  }
  if (showKeyboard) {
    image(keyboardImage, 0, height - 200); // Ejemplo de posición
  }
}

void mousePressed() {
  //Acción para dar clic en iconos principales, ya sea ropa, comida o teclado)
  if (overIcon(50, 500, 100, 100)) { // Icono comida
    showFoodMenu = true;
    showClothesMenu = false;
  } else if (overIcon(170, 500, 100, 100)) { // Icono ropa
    showClothesMenu = true;
    showFoodMenu = false;
  } else if (overIcon(290, 500, 100, 100)) { // Icono teclado
    showFoodMenu = false;
    showClothesMenu = false;
  }

  //Opciones de comida (4)
  if (showFoodMenu) {
    if (overIcon(100, 150, 100, 100)) currentStateImage = foodOptions[0]; // Carrot / Zanahoria
    if (overIcon(250, 150, 100, 100)) currentStateImage = foodOptions[1]; // Apple / Manzana
    if (overIcon(100, 300, 100, 100)) currentStateImage = foodOptions[2]; // Cookie / Galleta
    if (overIcon(250, 300, 100, 100)) currentStateImage = foodOptions[3]; // Strawberry / Fresa
    showFoodMenu = false;
  }

  //Opciones de ropa (top y sombrero por separado)
  if (showClothesMenu) {
    if (overIcon(100, 150, 100, 100)) selectedTop = 0;
    if (overIcon(250, 150, 100, 100)) selectedTop = 1;
    if (overIcon(100, 300, 100, 100)) selectedHat = 2;
    if (overIcon(250, 300, 100, 100)) selectedHat = 3;

    if (selectedTop != -1 && selectedHat != -1) {
      //Aquí se seleccionan las imágenes con la nomenclatura que diseñé para organizar
      //las imágenes necesarias para fhacer funcionar el sistema 
 
      currentStateImage = loadImage("outfit_" + selectedTop + "_" + selectedHat + ".png");
    }

    showClothesMenu = false;
  }

  //Teclado
  if (showKeyboard && mouseY > height - 200) {
    int keyIndex = (mouseX - 50) / 70;
    playNote(keyIndex);
  }
}

// Detecta clic en región rectangular (Música)
boolean overIcon(int x, int y, int w, int h) {
  return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
}

// Reproducir nota musical (aún no hay sonido real)
void playNote(int index) {
  String[] notas = {"Do", "Re", "Mi", "Fa", "Sol", "La", "Si", "Do"};
  if (index >= 0 && index < notas.length) {
    println("Nota: " + notas[index]);
    // Aquí se usaría Minim para importar los sonidos correspondientes)
    
    //Usé la ayuda de chatgpt para corregir unas partes de los códigos en las cuales las variables
    //se emzclaban y hacían complicado de leer el código sin embargo traté de incluir todas las funciones
    //que van a ser implementadas en el minijuego final
  }
}
