program Ejercicio8G5;
const
  MaxElem=100;

type
  TV=Array [1..MaxElem] of integer;

procedure GeneraV(var V:TV;var N:byte);
var
  i:byte;
begin
  write('Ingrese la cantidad de elementos que contendra el arreglo ---> ');Readln(N);
  for i:=1 to N do
   begin
    write('Ingrese el dato ',i,' de forma ascendente ---> ');Readln(V[i]);
   end;
end;

procedure InicializoW(var W:TV);
var
  i:byte;
begin
  for i:=1 to MaxElem do
   W[i]:=0;
end;

procedure GeneraW(var W:TV;var M:byte; V:TV;N:byte);
var
 i:byte;
begin
  InicializoW(W);
  M:=0;
  i:=1;
  while i<=N do
   begin
    M:=M+1;

    repeat
      W[M]:=W[M]+1;
      i:=i+1;
    until V[i]<>V[i-1] ;
   end;

end;

procedure Mostrar(W:TV;M:byte);
var
 i:byte;
begin
  for i:=1 to M do
   write(W[i],' ');
end;


var
 V,W:TV;
 N,M:byte;


begin
  GeneraV(V,N);
  GeneraW(W,M,V,N);
  Mostrar(W,M);
  readln
end.

