class Raqueta{
    
    float x ,y;
    float ancho, alto;
    
    Raqueta(float a, float b, float c, float d){
        x = a;
        y = b;
        ancho = c;
        alto = d;
    }
    
    public void dibujarRaqueta(){
        fill(27,170,100);
        
        rect(x,y,ancho,alto);
    }

//AGREGADO DE TAREA
    public boolean colisionPelota(Pelota a){
       
    if((a.ubicacion.x + a.diametro/2 > x && a.ubicacion.x - a.diametro/2 < (x+ancho))
      && ((a.ubicacion.y + a.diametro/2 < (y+alto)) && (a.ubicacion.y + a.diametro/2 > y))){
          //System.out.print("\nif numero 2"); 
          a.velocidad.y = -1*(a.velocidad.y);
          return true;
    }
    if((a.ubicacion.y + a.diametro/2 > y && a.ubicacion.y + a.diametro/2 < (y+alto))
       && (a.ubicacion.x - a.diametro/2 < (x+ancho) && a.ubicacion.x - a.diametro/2 > x)){
          //System.out.print("\nif numero 4"); 
          a.velocidad.x = -1*(a.velocidad.x);
          return true;
    }
       
       
      //Colision en parte izquierda
      if( ( (a.ubicacion.x - a.diametro/2 == x)) &&
      ( (a.ubicacion.y - a.diametro/2 > y) && (a.ubicacion.y - a.diametro/2 < y+alto) ) ){
          //System.out.print("\nif numero 5");
          a.velocidad.x = a.velocidad.x * -1;
          a.velocidad.y = a.velocidad.y * -1;
      }
      
      //Colision en parte derecha
    if( ( (a.ubicacion.x - a.diametro/2 == x+ancho)) &&
      ( (a.ubicacion.y - a.diametro/2 >= y) && (a.ubicacion.y - a.diametro/2 <= y+alto) ) ){
          //System.out.print("\nif numero 6");
          a.velocidad.x = a.velocidad.x * -1;
          a.velocidad.y = a.velocidad.y * -1;
      }
       
      return false;
    }
    
}
