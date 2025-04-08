//EL MUÑECO. tú tienes la decisión. ¿Qué harás
//Santiago Peña Hernández

// La clase se va a llamar acto, como los de una obra de teatro
class Acto {
  PImage img; 

  // cargar la imagen
  Acto(String archivo) {
    img = loadImage(archivo);
  }

  void mostrar() {
    image(img, 0, 0, width, height);
  }
}

// Variables declaradas (Usé la ayuda de cht para redactar el arreglo de imágenes ya que no lo sabía hacer muy bien)

Acto[] actos = new Acto[6]; 
// Arreglo de las 6 imagenes

int paso = 0;               
// los pasos son la parte de la historia en la que vas, va de 0 a 3

int finalActo = 3;          
// Acto final de la decisión (puede ser 3, 4 o 5)

boolean eligio = false;     
// evita que se tome otra decisión sin reiniciar el programa


void setup() {
  size(800, 800); // Tamaño de la ventana
  
  // Carga las imágenes en el arreglo de arriba
  for (int i = 0; i < actos.length; i++) {
    actos[i] = new Acto("imagen" + (i + 1) + ".png");
  }
}


void draw() {
  background(0); // Fondo negro, siempre se mantiene
  
  // Acto 1 y 2: historia inicial
  if (paso < 2) {
    actos[paso].mostrar();           
    // Muestra la imagen correspondiente
    
    mostrarTexto("Presiona ENTER"); 
    // Texto para avanzar
  } 
  
  // Acto 3: el muñeco ataca, muestra opciones
  else if (paso == 2 && !eligio) {
    
    actos[2].mostrar();     
    // Imagen del clímax
    
    mostrarOpciones();      
    // Texto guía
  } 
  
  // Acto 4: final según la elección
  else if (paso == 3 && eligio) {
    actos[finalActo].mostrar(); // Muestra el final elegido, ya sea quemar, encerrar o comunicarse
  }
}

//keyPressed
void keyPressed() {
  // ENTER para avanzar los primeros dos actos
  if (keyCode == ENTER && paso < 2) {
    paso++;
  } 
  
  // En el clímax (paso 2), elegir una opción con las teclas 1, 2 o 3
  else if (paso == 2) {
    if (key == '1') {
      finalActo = 3; paso = 3; eligio = true; // Final 1: quemarlo
    } else if (key == '2') {
      finalActo = 4; paso = 3; eligio = true; // Final 2: encerrarlo
    } else if (key == '3') {
      finalActo = 5; paso = 3; eligio = true; // Final 3: comunicarse 
    }
  }
}

// mousePressed
void mousePressed() {
  // Si ya eligió y está en el final, reinicia la historia y vuelve al acto 1
  if (paso == 3 && eligio) {
    paso = 0;
    eligio = false;
  }
}

// Texto de instrucciones en la esquina inferior izquierda
void mostrarTexto(String txt) {
  fill(255);         
  textSize(18);      
  text(txt, 20, height - 20); 
}

// Opciones en el mismo texto
void mostrarOpciones() {
  fill(255);
  textSize(18);
  text("¿Qué harás?", 20, height - 90);
  text("1. Quemarlo", 20, height - 60);
  text("2. Encerrarlo", 20, height - 40);
  text("3. Comunicarse", 20, height - 20);
}
