// Este es un código que utiliza un csv de kaggle de las especies que se encuentran en diferentes
//parques, también indica si están en estado de peligro de extinción o están
//en un estado estable de conservación. Los factores interactivos de esta visualización
//son que al pasar el mouse sobre una barra, mostrará los nombres de las especies 
//pertenecientes a esa categoría, también, los nombres de las especies en peligro
//aparecerán en rojo 

///Utilicé la ayuda de chatgpt para sintetizar algunos comandos que aún no tengo muy claros
//pero pude resolver mis dudas 

// Cargar la tabla de especies
Table species;
String selectedCategory = "";

//categorías de especies
String[] categorias = {"Mammal", "Bird", "Amphibian", "Reptile", "Fish", "Vascular Plant"};
color[] colores = {
  color(255, 100, 100),    // Rojo para mamíferos
  color(100, 150, 255),    // Azul claro para aves
  color(150, 255, 150),    // Verde para anfibios
  color(255, 200, 100),    // Naranja para reptiles
  color(100, 255, 255),    // Cian para peces
  color(200, 100, 255)     // Lila para plantas
};

// Arreglo número de especies por categoría
int[] conteo = new int[6];

void setup() {
  size(1200, 700);
  species = loadTable("species.csv", "header");
  
  // Contar especies por categoría
  for (TableRow row : species.rows()) {
    String cat = row.getString("Category");
    for (int i = 0; i < categorias.length; i++) {
      if (cat.equals(categorias[i])) conteo[i]++;
    }
  }
  
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);
  textSize(14);
  fill(255);

  // obtener el valor máximo para escalar las barras
  int max = max(conteo);
  
  // Barras
  for (int i = 0; i < categorias.length; i++) {
    float x = 100 + i * 150;
    float h = map(conteo[i], 0, max, 0, height - 150);  // Escalar altura

    fill(colores[i]);
    rect(x, height - h - 100, 100, h); 

    fill(255); 
    text(categorias[i], x + 50, height - 75);
    text(conteo[i], x + 50, height - h - 110); // Número total de especies

    // Si el mouse está sobre una barra, actualizar la categoría seleccionada (if)
    if (mouseX > x && mouseX < x + 100 && mouseY > height - h - 100 && mouseY < height - 100) {
      selectedCategory = categorias[i];
    }
  }

  // Línea que separa las secciones
  line(width - 220, 50, width - 220, height - 50);

  // Título
  textSize(16);
  text("Visualización de especies por categoría", width / 2, height - 30);

  // Si hay una categoría seleccionada, mostrar los nombres comunes (Common Names en el csv)
  if (!selectedCategory.equals("")) {
    mostrarNombres();
  }
}

// Mostrar nombres en blanco o rojo si está en peligro de extinción
void mostrarNombres() {
  float x = width - 180;  
  float y = 100;         

  textAlign(LEFT, CENTER);
  textSize(12);
  fill(255);
  text("Especies: " + selectedCategory, x, y - 30); 

  int i = 0;
  for (TableRow row : species.rows()) {
    if (row.getString("Category").equals(selectedCategory)) {
      String nombre = row.getString("Common Names");  // Nombre
      String estado = row.getString("Conservation Status");  // Estado de conservación

      // Si la especie está en peligro, mostrar en rojo
      if (estado != null && estado.equals("Endangered")) {
        fill(255, 0, 0);  // Rojo
      } else {
        fill(255);  // Blanco
      }

      
      text(nombre, x, y + i * 18);
      i++;
    }
  }

  // Restaurar
  textAlign(CENTER, CENTER);
}
