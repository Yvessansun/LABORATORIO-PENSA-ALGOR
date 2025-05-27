//Hola, esta es mi entrega fianl para pensamiento algorítmico "Bunny Day!"
//Este es un minujuego en el cual pasarás un día cuidando y compartiendo tiempo
//Con Joy, un conejito amarillo. A lo largo del día deberás alimentar, cambiar de ropa
//y tocar música junto a Joy, hay varias posibilidades de opciones para jugar una y otra
//vez. 

//Santiago Peña Hernández 202314893

//Inspiración: Nintendogs, Animal Crossing

//Tuve que hacer cambios en la estructura del juego porque al realizarlo, tenía una lista
//larguísima de variables y funciones y nomenclaturas para organizar las más de 45 imágenes necesarias para correr el juego en una base 
//"multiple choice" entonces, simplifiqué y ahora es una experiencia dinámica y lineal pero que mantiene la esencia 
//tierna y carismática del código pasado. Todas las imágenes las dibujé a mano digitalmente para que mantuviera una cohesión estética a lo largo del juego.
//Estoy muy orgulloso de esta entrega y espero que sea de su agrado :)

//Minim para sonido
import ddf.minim.*;

//Aclaración importante: gameState es lo que ayuda a que el juego identifique en qué estado va la historia y mostrar la imagen correspondiente al flujo.
//Las escenas son las diferentes imagenes hechas para una parte específica del juego.
PImage[] scenes = new PImage[17];
int gameState = 0;

//Declaración de variables de menús
int foodChoice = -1;
int outfitChoice = -1;

//bgmusic es la música de fondo que se reproduce durante todo el juego
Minim minim;
AudioPlayer bgMusic;
AudioPlayer[] notes = new AudioPlayer[8];

boolean playedThanksFood = false;
boolean playedThanksOutfit = false;
boolean playedThanksFinal = false;

//Setup del canvas
void setup() {
  size(1000, 1000);

  minim = new Minim(this);

  bgMusic = minim.loadFile("bgmusic.mp3");
  bgMusic.loop();
  bgMusic.setGain(-15); //Utlicé la ayuda de chat para comandos como estos, no los había usado antes y no entendía bien como se usaba

  //Notas musicales para el teclado 
  notes[0] = minim.loadFile("rosado.MP3"); // tecla rosada: Do
  notes[1] = minim.loadFile("moradore.MP3"); //Tecla morada: Re
  notes[2] = minim.loadFile("indigomi.MP3"); // Tecla Indigo: Mi
  notes[3] = minim.loadFile("azulfa.MP3"); //Tecla Azul: Fa
  notes[4] = minim.loadFile("verdesol.MP3"); //Tecla Verde: Sol
  notes[5] = minim.loadFile("amarillola.MP3"); //Tecla Amarilla: La
  notes[6] = minim.loadFile("naranjasi.MP3"); //Tecla Naranja: Si
  notes[7] = minim.loadFile("rojodo.MP3"); //Tecla Roja: Do

  // Cargar escenas en orden de aparición, en los menús sólo se muestra la escena correspondiente, las otras 3 son descartadas
  scenes[0] = loadImage("title.PNG");
  scenes[1] = loadImage("intro_hungry.PNG");
  scenes[2] = loadImage("food_menu.PNG");
  scenes[3] = loadImage("eat_carrot.PNG");
  scenes[4] = loadImage("eat_apple.PNG");
  scenes[5] = loadImage("eat_cookie.PNG");
  scenes[6] = loadImage("eat_strawberry.PNG");
  scenes[7] = loadImage("thank_you_food.PNG");
  scenes[8] = loadImage("ask_outfit.PNG");
  scenes[9] = loadImage("clothes_menu_fixed.PNG");
  scenes[10] = loadImage("duck_blue.PNG");
  scenes[11] = loadImage("duck_pink.PNG");
  scenes[12] = loadImage("bucket_blue.PNG");
  scenes[13] = loadImage("bucket_pink.PNG");
  scenes[14] = loadImage("ask_music.PNG");
  scenes[15] = loadImage("keyboard_fixed.PNG");
  scenes[16] = loadImage("thank_you_final.PNG");
}

void draw() {
  background(255);
  image(scenes[gameState], 0, 0);

  //Detonantes booleanos para sonido en escenas de agardecimiento después de una actividad
  if (gameState == 7 && !playedThanksFood) { //Gracias por la comida
    minim.loadFile("thankumusic_fixed.MP3").play();
    playedThanksFood = true;
  }

  // Agradecimiento por el outfit
  if ((gameState >= 10 && gameState <= 13) && !playedThanksOutfit) {
    minim.loadFile("thankumusic_fixed.MP3").play();
    playedThanksOutfit = true;
  }

  // Agradecimiento por jugar con Joy al final.
  if (gameState == 16 && !playedThanksFinal) {
    minim.loadFile("thankumusic_fixed.MP3").play();
    playedThanksFinal = true;
  }

  //if para pausar música cuando el teclado aparece en pantalla
  if (gameState == 15 && bgMusic.isPlaying()) {
    bgMusic.pause();
  }

  //if para continuar música cuando se sale del teclado
  if (gameState != 15 && !bgMusic.isPlaying()) {
    bgMusic.rewind();
    bgMusic.loop();
  }
}

void mousePressed() {
  switch (gameState) {

    case 0: case 1: case 8: case 14:
      gameState++; //Función para avanazar
      break;

    case 7:
      gameState = 8;
      break;

    case 16:
      resetGame(); //Volver a iniciar el jugo cuando se llega al final.
      break;

//OverIcon es la variable que indica como funcionan los botones dentro del juego y delimitar las coordenadas de los mismos.
//en este caso, son los botones del menú de comida (Carrot, Apple, Cookie, Strawberry)
    case 2:
      if (overIcon(234, 232, 221, 230)) { foodChoice = 0; gameState = 3; }
      else if (overIcon(528, 217, 219, 278)) { foodChoice = 1; gameState = 4; }
      else if (overIcon(261, 604, 202, 201)) { foodChoice = 2; gameState = 5; }
      else if (overIcon(515, 592, 196, 189)) { foodChoice = 3; gameState = 6; }
      break;

    case 3: case 4: case 5: case 6:
      gameState = 7;
      break;

//OverIcon para las coordenadas del menú de outfits) (Duck Hat + Blue Overall, Duck Hat + Pink Shirt, Bucket Hat + Blue Overall, Bucket Hat + Pink Shirt)
    case 9:
      if (overIcon(274, 211, 153, 276)) { outfitChoice = 0; gameState = 10; }
      else if (overIcon(564, 206, 159, 287)) { outfitChoice = 1; gameState = 11; }
      else if (overIcon(275, 537, 158, 269)) { outfitChoice = 2; gameState = 12; }
      else if (overIcon(563, 536, 160, 271)) { outfitChoice = 3; gameState = 13; }
      break;

    case 10: case 11: case 12: case 13:
      gameState = 14; //Todas estas son avances de escena
      break;

//OverIcon para las teclas del teclado que desencadenan la reproducción de audio específico (8 teclas de colores)
    case 15:
      if (overIcon(124, 447, 77, 220)) playNote(0);
      else if (overIcon(221, 448, 76, 220)) playNote(1);
      else if (overIcon(317, 448, 73, 220)) playNote(2);
      else if (overIcon(412, 447, 76, 219)) playNote(3);
      else if (overIcon(519, 449, 70, 219)) playNote(4);
      else if (overIcon(608, 448, 75, 219)) playNote(5);
      else if (overIcon(704, 448, 77, 220)) playNote(6);
      else if (overIcon(799, 447, 77, 222)) playNote(7);
      else if (overIcon(878, 12, 104, 107)) {
        gameState = 16;
      }
      break;
  }
}

//Devuelve el juego a gameState 0 y limpia las acciones anteriores.
void resetGame() {
  gameState = 0;
  foodChoice = -1;
  outfitChoice = -1;
  playedThanksFood = false;
  playedThanksOutfit = false;
  playedThanksFinal = false;

  if (!bgMusic.isPlaying()) {
    bgMusic.rewind();
    bgMusic.loop();
  }
}

//Utilicé ayuda de chat en esta parte para la redacción de conectores lógicos.
boolean overIcon(int x, int y, int w, int h) {
  return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
}

//Toca las notas del teclado y las rebobina para que se reproduzcan de manera completa cada vez.
void playNote(int index) {
  if (index >= 0 && index < notes.length) {
    notes[index].rewind();
    notes[index].play();
  }
}
