program Ejercicio20G3;
{ Leer desde un archivo números enteros, calcular y escribir el promedio de los elementos positivos y
distintos de cero que se encuentran entre dos negativos no consecutivos.
Ejemplos:
-7 6 -1 0 2 4 -8 -7 3 1 -24 6 7 0 9 ---> debe escribir : 6 3 2
 7 6 -1 0 2 4 -8 -7 3 1 -24 6 7 0 9 -8 ---> debe escribir : 3 2 7.33 }

var
  i:byte;
  prom:real;
  num,contNum,acumNum:integer;
  arch:text;

begin
  assign(arch, 'ejercicio20.txt');reset(arch);
  //Inicializo contadores y variable de control
  contNum:=0;
  acumNum:=0;
  i:=1;
  while not eof(arch) do
   begin
     read(arch,num);

     //Si el numero es mayor que cero acumula el numero prositivo e incrementa en uno el contador
     if (num>0) then
      begin
        contNum:=contNum+1;
        acumNum:=acumNum+num;

      end
     else
        if (num<0) then
          begin

             if (i<>1) and (contNum<>0) then    //Condicion que actualiza la variable prom siempre y cuando el numero no sea el primero.
              begin
                prom:=acumNum/contNum;
                writeln(prom:4:2);
              end;

        //Reinicio contador y acumulador e incremento en uno la variable de control cuando el numero es menor que cero.
        contNum:=0;
        acumNum:=0;
        i:=i+1;

      end;

   end;

  close(arch);
  readln

end.

