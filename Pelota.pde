class Pelota{
   
    float x_pos;
    float y_pos;
    float velocidad_x;
    float velocidad_y;
    float diametro;
    PVector ubicacion;      //Vector Estático
    PVector velocidad;      //Vector Dinámico
    
    Pelota(float a, float b, float c){
        x_pos = a;
        y_pos = b;
        diametro = c;
        ubicacion = new PVector(a,b);
        velocidad = new PVector(2.5,5);
    
    }
  
    public void dibujarPelota(){
        ubicacion.add(velocidad);
        ellipse(ubicacion.x, ubicacion.y, diametro, diametro);
        colisionParedes();
    
    }
    
    public void colisionParedes(){
         //pared         //derecha                          //izquierda
        if((ubicacion.x > width - diametro/2) || (ubicacion.x < diametro/2)){
            velocidad.x = velocidad.x * -1;
        }
        //Techo y piso    //fondo                          //superior
        if(/*(ubicacion.y > height + diametro/2) ||*/ (ubicacion.y < diametro/2)){
            velocidad.y = velocidad.y * -1;
        }
        

       
    }
}
