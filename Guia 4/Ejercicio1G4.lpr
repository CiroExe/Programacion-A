program Ejercicio1G4;


function esLetra(car:char):boolean;
begin
  if (Car in ['a'..'z']) or (Car in ['A'..'Z']) then
   esLetra:=True
  else
    esLetra:=False;
end;

var
  car:char;
begin
  writeln('Ingrese una letra');readln(car);
  if esLetra(Car) then
   writeln('El caracter ',car,' es una letra')
  else
    writeln('No es una letra');

  readln

end.

