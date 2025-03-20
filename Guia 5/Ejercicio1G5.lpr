program Ejercicio1G5;
type
  TV=array[1..100] of real;


procedure LeeVector(var Vec:TV;var N:byte);
var
  i:byte;
begin
  writeln('Ingrese la cantidad de elementos del vector --->');readln(N);
  for i:=1 to N do
    begin
     writeln('Guardar el elemento ',i);readln(Vec[i]);
    end;
end;

function suma(Vec:TV;N:byte):real;
var
  i:byte;
  sum:real;
begin
  sum:=0;
  for i:=1 to N do
     sum:=sum+Vec[i] ;

  suma:=sum;
end;

procedure MuestraPosPar(Vec:TV;N:byte);
var
  i:byte;

begin
  for i:=1 to N do
     begin
       if i mod 2=0 then
        writeln(Vec[i]);
     end;
end;

procedure MaxMin(Vec:TV;N:byte);
var
  Max,Min:real;
  i:byte;

begin
  Max:=-999;
  Min:=999;
  for i:=1 to N do
     begin
       if Vec[i]>Max then
        Max:=Vec[i];

       if Vec[i]<Min then
        Min:=Vec[i];

     end;

  writeln('Maximo: ',Max:4:2);
  writeln('Minimo: ',Min:4:2);
end;

procedure GeneraVecB(var VecB:TV;var M:byte;Vec:TV;N:byte);
var
  i:byte;

begin
  M:=0;
  for i:=N downto 1 do
     begin
      M:=M+1;
      VecB[M]:=Vec[i];
     end;

end;

procedure Muestra(VecB:TV;M:byte);
var
  i:byte;
begin
  for i:=1 to M do
     write(VecB[i]:4:2,' ');
end;

var
  Vec, VecB:TV;
  N,M,i:byte;

begin
  LeeVector(Vec,N);
  writeln('La suma de los elementos del vector es: ',suma(Vec,N):4:2);
  MaxMin(Vec,N);
  GeneraVecB(VecB,M,Vec,N);
  Muestra(VecB,M);


  readln



end.

