class Ladrillo{
  
  float ancho;
  float alto;
  float x;
  float y;
  int id;
  
  Ladrillo(float a, float b, float c, float d, int e){ //Constructor
      x = a;
      y = b;
      ancho = c;
      alto = d;
      id = e;
  }
  
  public void dibujarLadrillo(){
      fill(255,0,0);   //RGB
      rect(x,y,ancho,alto);
      fill(0);
      //text(""+id, x+ancho/2-3, y+alto/2+4);  //para que la letra se vea en la parte media
  }
  
  public boolean isLadrillo(float a, float b){
      if(a >= x && a <= x+ancho){
          if(b >= y && b <= y+alto){ 
              return true;          
          }
      }
      return false;
  }
  
  boolean colisionPelota(Pelota a){
    
    //Colisión inferior
      if((a.ubicacion.x + a.diametro/2 > x && a.ubicacion.x - a.diametro/2 < (x+ancho))
      && ((a.ubicacion.y - a.diametro/2 < (y+alto)) && (a.ubicacion.y - a.diametro/2 > y))){
           
          a.velocidad.y = -1*(a.velocidad.y);
          return true;
      }
      
      //Colisión superior
      if((a.ubicacion.x + a.diametro/2 > x && a.ubicacion.x - a.diametro/2 < (x+ancho))
      && ((a.ubicacion.y + a.diametro/2 < (y+alto)) && (a.ubicacion.y + a.diametro/2 > y))){
           
          a.velocidad.y = -1*(a.velocidad.y);
          return true;
      }else if((a.ubicacion.y + a.diametro/2 > y && a.ubicacion.y + a.diametro/2 < (y+alto))
       && (a.ubicacion.x + a.diametro/2 > x && a.ubicacion.x + a.diametro/2 < (x+ancho))){
          
          a.velocidad.x = -1*(a.velocidad.x);
          return true;
      }
      
      if((a.ubicacion.y + a.diametro/2 > y && a.ubicacion.y + a.diametro/2 < (y+alto))
       && (a.ubicacion.x - a.diametro/2 < (x+ancho) && a.ubicacion.x - a.diametro/2 > x)){
          
          a.velocidad.x = -1*(a.velocidad.x);
          return true;
      }
      
      return false;
      
  }
}
