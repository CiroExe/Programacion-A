program Ejercicio3G5;
const
  MaxElem=100;
type
  TV=array [1..MaxElem] of integer ;

procedure GeneraVec(var Vec:TV;var N:byte);
  var
    i,j:byte;
    num:integer;
begin
  write('Ingrese cantidad de elementos del vector ---> ');readln(N);
  for i:=1 to N do
   begin
     write('Ingrese dato para la posicion ',i,' ---> ');Readln(num);
     Vec[i]:=num;
   end;


end;

procedure CambiarOcurrencias(var Vec:TV;N:byte;K:integer);
var
  i:byte;
begin
  for i:=1 to N do
   begin
     if Vec[i]=K then
      Vec[i]:=0;
   end;
end;

procedure Muestra(Vec:TV;N:byte);
var
  i:byte;
begin
  for i:=1 to N do
   begin
     write(Vec[i],' ');
   end;
  writeln;
end;

var
  Vec:TV;
  N:byte;
  K:integer;

begin
  GeneraVec(Vec,N);
  writeln('Ingrese un numero K ');readln(K);
  CambiarOcurrencias(Vec,N,K);
  Muestra(Vec,N);
  readln
end.

