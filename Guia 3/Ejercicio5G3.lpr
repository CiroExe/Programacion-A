program Ejercicio5G3;
(* Generar y mostrar los múltiplos de K menores que un valor Q. (K y Q se leen de teclado).*)

var
  i:byte ;
  K,Q,MultiploK:real;


begin
  writeln('Ingrese un numero Q');readln(Q);
  writeln('Ingrese un numero K');readln(K);

  for i:=1 to 100 do
   begin
     MultiploK:=K*i;
     if MultiploK<Q then
      writeln(MultiploK:4:2)
   end;
  readln()
end.

