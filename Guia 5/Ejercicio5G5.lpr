program Ejercicio5G5;
const
  MaxElem=100;
type
  TV=array[1..MaxElem] of integer;
procedure GeneraVector(var VecA:TV;var N:byte);
var
  arch:text;
  num:integer;
begin
  assign(arch,'ej5g5.txt');Reset(Arch);
  N:=0;
  while not eof (Arch) do
   begin
     N:=N+1;
     read(arch, VecA[N]);
   end;
  close(arch);
end;

function Maximo(VecA:TV;N:byte):integer;
var
  i:byte;
  max:integer;
begin
  max:=-999;
  for i:=1 to N do
   begin
     if VecA[i]>max then
      max:=VecA[i];
   end;
  Maximo:=Max
end;

procedure GeneraMax(var VecB:TV;var M:byte;VecA:TV;N:byte);
var
  i:Byte;
  max, cont,acum:integer;
begin
  M:=0;
  acum:=0;
  cont:=0;
  max:=Maximo(VecA,N);

  for i:=1 to N do
   begin

   if VecA[i]<>0 then
    begin
     if (max mod VecA[i] = 0) then
      begin
        acum:=acum+VecA[i];
        cont:=cont+1;
        M:=M+1;
        VecB[M]:=VecA[i];
      end;
     end;


   end;

  writeln('Promedio de todos los numeros divisores del maximo (',max,'): ',(acum/cont):4:2);

end;

procedure MuestraA(VecA:TV;N:byte);
var
  i:byte;
begin
  for i:=1 to N do
   write(VecA[i],' ');
  writeln
end;

procedure MuestraB(VecB:TV;M:byte);
var
  i:byte;
begin
  for i:=1 to M do
   write(VecB[i],' ');
end;



var
  VecA,VecB:TV;
  N,M:byte;





begin
  GeneraVector(VecA,N);
  GeneraMax(VecB,M,VecA,N);
  MuestraA(VecA,N);
  MuestraB(VecB,M);
 readln
end.

