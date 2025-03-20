program Ejercicio5G8;
const
  max=100;

type
  TV=array[1..max] of integer;

procedure GeneraVec(var V:TV;var N:byte);
var
  i:byte;
begin
  write('Ingrese la cantidad de elementos ');readln(N);
  for i:=1 to N do
   readln(V[i]);
end;

function sumaRecursiva(V:TV;N:byte):integer;
begin
  if n=0 then
   sumaRecursiva:=0
  else
    sumaRecursiva:=V[N]+sumaRecursiva(V,N-1);
end;

procedure Muestra(V:TV;N:byte);
begin
  if N=1 then
   write(V[1],' ')
  else
    begin
      Muestra(V,N-1);
      write(V[N],' ');
    end;
end;

procedure MuestraInverse(V:TV;N:byte);
begin
  if N=1 then
   write(V[1],' ')
  else
    begin
      write(V[N],' ');
      MuestraInverse(V,N-1);
    end;

end;

function Maximo(V:TV;N:byte):integer;
begin
  if N=1 then
   Maximo:=V[1]
  else
    if V[N]>Maximo(V,N-1) then
     Maximo:=V[N]
    else
      Maximo:=Maximo(V,N-1);


end;

function Promedio(V:TV;N:byte):real;
begin
  Promedio:=SumaRecursiva(V,N)/N;
end;

var
  V:TV;
  N:byte;

begin
  GeneraVec(V,N);
  //Inciso A
  writeln('Suma recursiva ---> ',sumaRecursiva(V,N));
  Muestra(V,N);
  writeln;
  MuestraInverse(V,N);
  writeln;
  writeln('Maximo --> ',Maximo(V,N));
  writeln('Promedio --> ',Promedio(V,N):4:2);
  readln
end.

