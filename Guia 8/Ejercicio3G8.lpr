program Ejercicio3G8;
function confuso(a,b:integer):integer;
begin
 if (b = 0) then
 confuso := 0
 else
 if (b mod 2 = 0) then
 confuso := confuso(a+a, b div 2)
 else
 confuso := confuso(a+a, b div 2) + a;
end;

begin
  writeln(confuso(2,17));
  writeln(confuso(4,25));
  //La funcion matematica que define confuso es una multiplicacion;
  readln
end.

