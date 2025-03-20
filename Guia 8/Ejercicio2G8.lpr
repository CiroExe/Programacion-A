program Ejercicio2G8;
function funcion(i:integer):integer;
begin
  if i=0 then
   funcion:=1
  else
    if odd(i) then
     funcion:=funcion(i-1)
    else
      funcion:=1+funcion(i-1);
end;

var
  i:integer;

begin
  write('Ingrese un numero --> ');Readln(i);
  writeln('Resultado --> ', funcion(i));
  readln
end.

