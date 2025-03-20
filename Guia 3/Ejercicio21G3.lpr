program Ejercicio21G3;
{ Leer un conjunto de números enteros, la presencia de ceros intermedios indica fin de un
subconjunto y comienzo del siguiente, dos ceros consecutivos es fin de datos. Se pide calcular e informar
el máximo en cada subconjunto y el orden del subconjunto más numeroso.
Ejemplo: 3,5,2,0,6,7,4,7,0,2,1,0,0
Respuesta: subconjunto Máximo
                     1 5
                     2 7
                     3 2
El subconjunto con más elementos es: 2 }
var
  i:byte;
  arch:text;
  num,contElementos,Max:integer;
  apareceCero:boolean;


begin
  assign(arch,'ej21.txt');reset(Arch);
  i:=1;
  Max:=-999;
  contElementos:=0;
  apareceCero:=False;

  while not eof(arch) do
   begin
     read(arch, num);
     if num<>0 then
      begin
        if num>max then
          max:=num;
        contElementos:=contElementos+1;
      end
     else
        if num=0 then
         begin
           if (apareceCero) and (max<>-999) then
            begin
              writeln('Subconjunto    Maximo');
              writeln('   ',i,'             ',max);
              i:=i+1;
            end;

           apareceCero:=True;
           contElementos:=0;
           max:=-999;
         end;

   end;
  close(Arch);
  readln

end.

