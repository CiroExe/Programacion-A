program Ejercicio7G8;
type
  TM=Array[1..100,1..100] of integer;


procedure generaMat(var Mat:TM;var N:byte);
var
  i,j:byte;
begin
  write('Cantidad de elementos de la matriz: ');readln(N);
  for i:=1 to N do
   for j:=1 to N do
     readln(Mat[i,j]);
end;

{function MinCol(Mat:TM;i,Col,  n  :byte):integer;
begin
  if i=1 then
   MinCol:=Mat[1,col]
  else
    begin
     if Mat[i,col]<MinCol(Mat,i-1,col,N) then
      MinCol:=Mat[i,col]
     else
      MinCol:=MinCol(Mat,i-1,col,N);
    end;
end;

function MinGeneral(Mat:TM;j,N:byte):integer;
begin
  if j=1 then
   MinGeneral:=MinCol(Mat,N,1,N)
  else
   begin
    MinGeneral:=MinCol(Mat,N,j,N);
    if MinCol(Mat,N,j-1,N)<MinGeneral then
     MinGeneral:=MinCol(Mat,N,j-1,N)
    else
     MinGeneral(Mat,j-1,N);
   end;
end;     }

function Minimo(Mat:TM;i,j,N:byte):integer;
begin
  if (i=n) and (j=n) then
   Minimo:=Mat[n,n]
  else
    begin
      if J<n then
       if Mat[i,j]<Minimo(Mat,i,j+1,N) then
        Minimo:=Mat[i,j]
       else
         Minimo:=Minimo(Mat,i,j+1,N)
      else
         Minimo:=Minimo(Mat,i+1,1,N);
    end;
end;

{function Minimo(Mat:TM;i,j,N:byte):integer;
begin
  if (i=1) and (j=1) then
   Minimo:=Mat[1,1]
  else
    begin
      if J=1 then
       if Mat[i,j]<Minimo(Mat,i-1,j,N) then
        Minimo:=Mat[i,j]
       else
         Minimo:=Minimo(Mat,i-1,,N)
      else
         Minimo:=Minimo(Mat,i,j-1,N);
    end;
end;      }

var
  Mat:TM;
  N:byte;

begin
  generamat(Mat,N);
  writeln('Minimo de la matriz ---> ',Minimo(Mat,1,1,N));
  readln;
end.

