program Ejercicio6;
const
  max=100;

type
  TM=Array[1..max,1..max] of integer;



procedure GeneraArchivo(var Mat:TM;N:byte);
var
  i,j,k:byte;

begin
  i:=1;
  j:=N div 2 +1;
  for k:=1 to N*N do
   begin
     Mat[i,j]:=k;
     if k mod N= 0 then
      i:=i+1
     else
       begin
         if i=1 then
          i:=N
         else
           i:=i-1;

         if j=N then
          j:=1
         else
           j:=j+1
       end;

   end;

end;

procedure Muestra(Mat:TM;N:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
   begin
     for j:=1 to N do
      write(Mat[i,j],' ');
     writeln;
   end;
end;

var
  Mat:TM;
  N:byte;

begin
  write('Ingrese N ');readln(N);
  GeneraArchivo(Mat,N);
  Muestra(Mat,N);
  readln

end.

