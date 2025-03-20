program Ejercicio4G5;
const
  MaxElem=100;

type
  TV=array[1..MaxElem] of integer;

procedure GeneraVecA(Var VecA:TV;var N:byte);
var
  i:byte;
begin
  write('Ingrese cantidad de elementos que contendra el arreglo ---> ');Readln(N);
  for i:=1 to N do
   begin
     write('Ingrese dato para la posicion ',i,' ---> ');readln(VecA[i]);
   end;

end;

procedure GeneraVecB(var VecB:TV;var M:byte; VecA:TV;N:byte);
var
  i:Byte;
begin
  M:=0;
  for i:=1 to N do
   begin
     if VecA[i]<>0 then
      begin
        M:=M+1;
        VecB[M]:=VecA[i];
      end;
   end;
end;

procedure Muestra(VecA,VecB:TV;N,M:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
   write(VecA[i],' ');
  writeln;

  for j:=1 to M do
   write(VecB[j],' ');
  writeln;
end;

var
  VecA,VecB:TV;
  N,M:byte;


begin
  GeneraVecA(VecA,N);
  GeneraVecB(VecB,M,VecA,N);
  Muestra(VecA,VecB,N,M);
  readln

end.

