program Ejercicio4G8;
function PalabraInverse(palabra:string;N:byte):string;
begin
  if n=1 then
   PalabraInverse:=palabra[N]
  else
    PalabraInverse:=palabra[N]+PalabraInverse(palabra,N-1);


end;

var
  palabra:string;
  N:byte;
begin
  write('Ingrese una palabra --> ');readln(palabra);
  N:=length(palabra);
  writeln('Palabra invertida --> ',PalabraInverse(palabra,N));
  readln;
end.

