import java.util.ArrayList;

/*ACTIVIDAD DE TAREA: 
1.- Agregar una raqueta al sketch principal (este)
2.- Válidar que la raqueta no se salga de LA VENTANA
3.- Válidar la colisión de la pelota con la raqueta
4.- QUITAR la validación de la pelota con el límite inferior de la ventana
5.- Y si sale la pelota por el limite inferior que muestre el msj de "GAME OVER"
*/

Ladrillo ld1;
Pelota pelota; 
Raqueta raqueta;

boolean ban = false;
String msg = "BREAKOUT";
String tiempo = "";
String msgRaqueta = "";
ArrayList ladrillos;
int numeroDeLadrillos;

int segundos = 0, minutos = 0, counter;
int puntuacion = 0;
int vidas = 3;
PImage img1;

public void setup(){
    size(600,500);
    img1 = loadImage("Megatron.png");
    
    segundos = 0;
    minutos = 0;
    counter = 0;
    puntuacion = 0;
    vidas = 3;
    
    numeroDeLadrillos = 30;
    
    
    ladrillos= new ArrayList();
    
    //Agregada la linea 29 de tarea
    raqueta = new Raqueta(width/2-30, height-20, 60, 10);
    
    for(int j = 0; j < 3; j++){
      for(int i = 0; i < numeroDeLadrillos/3; i++){
        ld1 = new Ladrillo((60*i),(70+(j*20)), 60, 20, i);
        ladrillos.add(ld1);
      }
    }
    
    
    pelota = new Pelota(width/2, height-40,10);
    
}


public void draw(){   //Método cíclico siempre se ejcuta el draw. cuidado con fors
    //background(170);
    background(img1);
    fill(250,252,60);
    rect(1,10,90,48);
    fill(0,0,0);
    counter++;
    if(counter == 59){
      counter = 0;
      segundos++;
      if(segundos == 59){
          minutos++;
          segundos = 0;
      }
    }
    
    tiempo = "Time " + String.valueOf(minutos) + " : " + String.valueOf(segundos);
    textSize(15);
    text(tiempo, 3, 30);
    textSize(12);
    for(int i = 0; i < ladrillos.size(); i++){
        ld1 = (Ladrillo) ladrillos.get(i);
        ld1.dibujarLadrillo();
    }

    pelota.dibujarPelota();

    for(int i = 0; i < ladrillos.size(); i++){
        ld1 = (Ladrillo) ladrillos.get(i);
        if(ld1.colisionPelota(pelota)){
            puntuacion = puntuacion + 10;
            ladrillos.remove(i);
        } 
    }
    textSize(15);
    fill(250,252,60);
    rect(width-75,10,width-5,50);
    fill(0,0,0);
    text("Lifes: " + String.valueOf(vidas), width-70, 30);
    text("Top: " + String.valueOf(puntuacion), width-70, 50);
    
    
    /*if(ban){ //Este if me pinta el texto
        fill(0,255,0);
    }else{
        fill(255,0,0);
    }*/
    //text(msg, 20, 40);
    
    //Agregadas de tarea las lineas 79-84
    raqueta.dibujarRaqueta();
    fill(0);
    //text(msgRaqueta,20,60);
    
    //Agregada linea 84 de tarea
    raqueta.colisionPelota(pelota);
    
    if(pelota.ubicacion.y > height + pelota.diametro/2){
      if(vidas > 0 && puntuacion <= 300){
        msg = "CONTINUE";
      }else{
        msg = "GAME OVER";
      }
      text(msg,3,50); 
    }
 
    if(puntuacion >= 300){
      puntuacion = 0;
      delay(3000);
      setup();
    }
}


public void mouseClicked(){  //Checa lo que es un arreglo, Sólo se ejecuta cuando clickeo
    //msg = "No has seleccionado ningún ladrillo";
    ban = false;
    int k = -1;
    for(int i = 0; i < ladrillos.size(); i++){
        ld1 = (Ladrillo)ladrillos.get(i);
        if(ld1.isLadrillo(mouseX, mouseY)){
            ban = true;
            k = ld1.id;
            //msg = "Estás en el ladrillo " + ld1.id;
            ladrillos.remove(ld1);
            break;
        }
        ban = false;
    }
    
}


public void keyPressed(){
    
    if(keyCode == LEFT){
        //msgRaqueta = "IZQUIERDA, " + raqueta.x;
        
        //Agregada de tarea esta condicional
        if(raqueta.x >= 0){
          raqueta.x = raqueta.x - 10;
        }else{
          raqueta.x = raqueta.x;
        }
        
    }
    if(keyCode == RIGHT){
        //msgRaqueta = "DERECHA, " + raqueta.x;
        //Agregada de tarea esta condicional
        if(raqueta.x < width-60){
          raqueta.x = raqueta.x + 10;
        }else{
          raqueta.x = raqueta.x;
        }
    }
    
    if(keyCode == 'R'){
        //msg = "HAS EMPEZADO DE NUEVO";
        //Agregada de tarea esta condicional
        if(vidas > 0){
          pelota.ubicacion.x = width/2;
          pelota.ubicacion.y = height-40;
          pelota.velocidad.y = pelota.velocidad.y * -1;
          raqueta.x = width/2-30;
          raqueta.y = height-20;
          vidas--;
        }else{
          vidas = 0;
          setup();
        }
        
    }
    
}
