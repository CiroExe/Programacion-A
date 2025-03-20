program Ejercicio4G3;
(* Ingresar N números enteros (ordenados en forma descendente), informar cual es la máxima
diferencia entre dos números consecutivos y qué posición ocupa ese par de números dentro de la
secuencia.
Ejemplo: 25 19 11 9 3 -3, la máxima diferencia es 8 y corresponde al par 2

Nota: La diferencia se calcula sobre un par de números, por lo tanto deben estar en memoria dos valores
consecutivos (Pri y Seg), que se actualizan en cada repetición. *)
var
  N, i, posicion:byte;
  Pri,Seg,dif,difmax:integer;


begin
  writeln('Ingrese la cantidad de numeros que desea escribir');readln(N);
  write('Ingrese el primer numero ');readln(Pri);
  difmax:=-1;
  for i:=2 to N do
   begin
     write('Ingrese el siguiente numero en forma descendente ');readln(Seg);
     dif:=Pri-Seg;

     if dif>difmax then
      begin
       difmax:=dif;
       posicion:=((i-1)*2) div 2;
      end;


     Pri:=Seg;



   end;

  writeln('La maxima diferencia entre dos numeros consecutivos es ',difmax,' y se encuentra en la posicion ',posicion);
  readln()
end.
