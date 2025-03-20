program Ejercicio1G8;

function potencia(X,n:integer):real;
begin
  if n<0 then
   potencia:=x/ potencia(x,1-n)
  else
   if n=0 then
    potencia:=1
   else
    potencia:=x*potencia(x,n-1);
end;

var
  X,n:integer;

begin
  write('Ingrese un numero base --> ');readln(X);
  write('Ingrese potencia --> ');Readln(n);
  write('Resultado --> ',potencia(X,n):2:1);
  readln
end.

