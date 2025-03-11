//IMPORTANTE: EJECUTAR DURANTE TODA LA DURACIÓN DE LA CANCIÓN
//Mi composición va de la mano con la canción the chase ya que la atmósfera del sonido es bastante
//etérea y de colores pastel (la portada del álbum y el mv tiene los mismos colores)
//El contraste en sonidos de la canción era algo que quería enfatizar por lo que el juego con "luces"
//y el fondo cambiante dramático es algo crucial pero las flores al final crecen como la melodía
//de la canción.

// Importar programa de audio
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

//Variables
int x = 0;
int y = 50;
float rad;
float level;

void setup() {
  size (800, 800);
  background (137, 207, 240);
  frameRate(800);
 
// Canción es The Chase de Hearts2Hearts
  minim = new Minim(this);
  player = minim.loadFile("thechase.mp3", 1024);
  player.play();

  fft = new FFT(player.bufferSize(), player.sampleRate());
}

//Aquí usaré millis y ya que es por miles, la divido por mil para que sea un poco más facil calcular los segundos de la canción
void draw() {
  fft.forward(player.mix);
  int segundos = millis() / 1000;
 
 //este comando no supe cómo organizarlo entonces usé la ayuda de chat para organizarlo, más yo puse los comandos
 //ayuda de chat va desde las líneas 42 a 51
if ((segundos >= 39 && segundos <= 68) || 
    (segundos >= 100 && segundos <= 114) || 
    (segundos >= 160 && segundos <= 175)) {
  fill(0, 0, 0, 10); // Fondo negro para darle un efecto dramático en los coros, 
  //también refleja el cambio de beat de la canción
} else if (segundos >= 145 && segundos <= 160) {
  fill(255, 255, 255, 10); // Fondo blanco para el "bridge" ya que tiene un sonido más angelical
} else {
  fill(137, 207, 240, 10); // Azul celeste "default" del cielo
}

rect(0, 0, width, height);
  float level= fft.getBand(30);
  rad = (level * width/10);

  float r = random(0, 100);
  float g = random(100, 255);
  float b = random(200, 255);

//Aquí utilicé millis como normalmente se usaría ya que no necesitaba calcular los segundos
//de una manera tan estricta

  int m = millis();
  

  stroke(r, g, b);
  fill(244, 194, 194, 10);
  triangle(x, y, rad, rad, y, x);
  
  //Estas son las flores que aparte de los trángulos que van con los beats, estas flores irán apareciendo
  //y se iluminarán con los mismos beats, van apareciendo a medida que la canción avanza

// Flor amarilla
  if (m > 5000) {
    fill(255, 241, 215);
    stroke(255, 255, 0);
    circle (700, 100, level);
    circle (700, 110, level);
    circle (710, 100, level);
    circle (710, 110, level);
  }

// Flor morada
  if (m > 23000) {
    fill(201, 201, 255);
    stroke(128, 0, 128);
    circle (100, 700, level);
    circle (100, 720, level);
    circle (120, 700, level);
    circle (120, 720, level);
  }

//Flor roja
  if (m > 46000) {
    fill(255, 189, 189);
    stroke(255, 0, 0);
    circle (700, 700, level);
    circle (700, 720, level);
    circle (720, 700, level);
    circle (720, 720, level);
  }
  
  //Flor azul
    if (m > 46000) {
    fill(200, 200, 255);
    stroke(0, 0, 255);
    circle (100, 100, level);
    circle (100, 120, level);
    circle (120, 100, level);
    circle (120, 120, level);
  }
  
  
  //Flor Verde
      if (m > 55000) {
    fill(213, 247, 213);
    stroke(0, 255, 0);
    circle (400, 700, level);
    circle (400, 720, level);
    circle (420, 700, level);
    circle (420, 720, level);
}
    
    //Flor rosada
    if (m > 55000) {
      fill(241, 203, 255);
      stroke(255, 105, 180);
    circle (700, 400, level);
    circle (700, 420, level);
    circle (720, 400, level);
    circle (720, 420, level);
    }
    
    //Flor Naranja
        if (m > 84000) {
      fill(255, 233, 186);
      stroke(254, 151, 2);
    circle (100, 400, level);
    circle (100, 420, level);
    circle (120, 400, level);
    circle (120, 420, level);
    }
    
    // Flor rosa pálido
            if (m > 84000) {
      fill(255, 230, 220);
      stroke(255, 180, 200);
    circle (400, 100, level);
    circle (400, 120, level);
    circle (420, 100, level);
    circle (420, 120, level);
    }
  
  //Flor blanca inicial
              if (m > 115000) {
      fill(255, 255, 255, 10);
      stroke(255, 255, 255);
    circle (400, 400, level * 5);
    circle (400, 420, level * 5);
    circle (420, 400, level * 5);
    circle (420, 420, level * 5);
    }
    
    
    // NUEVAS FLORES BLANCAS AL FINAL
    //Estas sólo aparecerán para cambiar de aspecto las originales en el último coro
    
     if (m > 162000) {
    fill(255, 255, 255, 50);
    stroke(255, 255, 255);
    circle (700, 100, level * 3);
    circle (700, 110, level * 3);
    circle (710, 100, level * 3);
    circle (710, 110, level * 3);
  }

// Flor Amarilla
  if (m > 162000) {
    fill(255, 255, 255, 50);
    stroke(255, 255, 255);
    circle (100, 700, level * 3);
    circle (100, 720, level * 3);
    circle (120, 700, level * 3);
    circle (120, 720, level * 3);
  }

//Flor morada
  if (m > 162000) {
    fill(255, 255, 255, 50);
    stroke(255, 255, 255);
    circle (700, 700, level * 3);
    circle (700, 720, level * 3);
    circle (720, 700, level * 3);
    circle (720, 720, level * 3);
  }
  
  //Flor roja
    if (m > 162000) {
    fill(255, 255, 255, 50);
    stroke(255, 255, 255);
    circle (100, 700, level * 3);
    circle (100, 720, level * 3);
    circle (120, 700, level * 3);
    circle (120, 720, level * 3);
  }
  
  //Flor azul
      if (m > 162000) {
    fill(255, 255, 255, 50);
    stroke(255, 255, 255);
    circle (100, 100, level * 3);
    circle (100, 120, level * 3);
    circle (120, 100, level * 3);
    circle (120, 120, level * 3);
  }
  
  //Flor Verde
      if (m > 162000) {
    fill(255, 255, 255, 50);
    stroke(255, 255, 255);
    circle (400, 700, level * 3);
    circle (400, 720, level * 3);
    circle (420, 700, level * 3);
    circle (420, 720, level * 3);
}

   //Flor rosada 
    if (m > 162000) {
      fill(255, 255, 255, 50);
      stroke(255, 255, 255);
    circle (700, 400, level * 3);
    circle (700, 420, level * 3);
    circle (720, 400, level * 3);
    circle (720, 420, level * 3);
    }
    
    //Flor naranja
        if (m > 162000) {
      fill(255, 255, 255, 50);
      stroke(255, 255, 255);
    circle (100, 400, level * 3);
    circle (100, 420, level * 3);
    circle (120, 400, level * 3);
    circle (120, 420, level * 3);
    }
    
    //Flor rosa pálido
            if (m > 162000) {
      fill(255, 255, 255, 50);
      stroke(255, 255, 255);
    circle (400, 100, level * 3);
    circle (400, 120, level * 3);
    circle (420, 100, level * 3);
    circle (420, 120, level * 3);
    }
    
  
  


  x++;

  if (x > width) {
    x = 0;
    y += 80;
  }

  if (y > height) {
    y = 0;
  }

  for (int i = 0; i < fft.specSize(); i++) {
    float frequency = (i + 0.5) * fft.getBandWidth();
    println ("Banda " + i + ": " + frequency + "Hz, Amplitud: " + fft.getBand(i));
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
