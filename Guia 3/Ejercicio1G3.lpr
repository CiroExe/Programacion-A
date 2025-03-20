program Ejercicio1G3;
(*Dados N números enteros, calcular e informar:
a) El máximo, qué lugar ocupa la primera aparición y cuántas ocurrencias tiene.
b) El mínimo de los impares (informar si no existe)
Ejemplo: N = 10, 78, 45, 80, 56, 80, 32, 90, 89, 90, 45
a) 90 - 7º lugar - 2 ocurrencias
b) 45      *)

var
  N,i,num:integer;
  Maximo, Minimo:integer;
  Posicion,Ocurrencias:integer;




begin
   write('Ingrese N numeros enteros');readln(N);
   Maximo:=-1;
   Minimo:=999;
   Ocurrencias:=0;
   for i:=1 to N do
    begin
      write('Ingrese un numero');readln(num);

      if num > Maximo then
       begin
        Maximo:=num;
        Posicion:=i
       end ;

     if Maximo=Num then
      Ocurrencias:=Ocurrencias+1;


      if odd(num) then
       begin
        if num<Minimo then
         Minimo:=Num;
       end;

    end;

   writeln('El maximo es el numero ',Maximo,' El lugar que ocupa la primera aparicion es ',i,' y tiene ', Ocurrencias,' Ocurrencias');
   writeln('El minimo de los impares es ', Minimo);
   readln
end.

