program Ejercicio8;
const
  max=100;

type
  TM=array[1..max,1..max] of integer;
  TV=Array[1..max] of integer;

procedure GeneraVec(var Mat:TM;var N,M:byte);
var
  i,j:byte;
begin
  write('Cantidad de filas --> ');Readln(N);
  write('Cantidad de columnas --> ');Readln(M);
  for i:=1 to N do
   for j:=1 to M do
    readln(Mat[i,j]);
end;

function Maximo(Mat:TM;fila,j:byte):integer;
begin
  if j=1 then
   Maximo:=Mat[Fila,1]
  else
    begin
      if Mat[Fila,j]>Maximo(Mat,fila,j-1) then
       Maximo:=Mat[fila,j]
      else
        Maximo:=Maximo(Mat,fila,j-1);
    end;
end;

procedure GeneraV(var V:TV;Mat:TM;N,M:byte);
begin
  if N=1 then
   V[1]:=Maximo(Mat,1,M)
  else
    begin
     V[N]:=Maximo(Mat,N,M);
     GeneraV(V,Mat,N-1,M);
    end;

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
var
  Mat:TM;
  V:TV;
  N,M:byte;
begin
  GeneraVec(Mat,N,M);
  GeneraV(V,Mat,N,M);
  Muestra(V,N);
  readln
end.

