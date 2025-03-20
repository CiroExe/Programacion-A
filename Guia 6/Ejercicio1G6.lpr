program Ejercicio1G6;
const
  max=100;

type
  TM=array[1..max,1..max] of integer;
  TV=array[1..max] of integer;

procedure LeeArchivo(var Mat:TM;Var N,M:byte);
var
  arch:Text;
  i,j:byte;

begin
  assign(Arch,'ej6.txt');Reset(arch);
  readln(arch, N,M);

  for i:=1 to N do
   for j:=1 to M do

      read(arch,Mat[i,j]);

  close(arch);

end;

function MaxFila(Mat:TM;Fila,M:byte):integer;
var
  j:byte;
  max:integer;
begin
  max:=-9999;
  for j:=1 to M do
   if Mat[Fila,j]>max then
    max:=Mat[Fila,j];

  MaxFila:=max;
end;

function Impares(Mat:TM;N,Col:byte):boolean;
var
  i:byte;
  tieneImpares:boolean;

begin
  tieneImpares:=False;
  for i:=1 to N do
   if Mat[i,col] mod 2<>0 then
    tieneImpares:=True;

  Impares:=tieneImpares;
end;

function sumaImpares(Mat:TM;N,Col:byte):integer;
var
  i:byte;
  suma:integer ;
begin
  suma:=0;
  for i:=1 to N do
   if Mat[i,col] mod 2<>0 then
    suma:=suma+Mat[i,col];

  sumaImpares:=suma;
end;

procedure GeneraVec(Mat:TM;var A:TV;N,M:byte);
var
  i:byte;

begin

  for i:=1 to N do
     A[i]:=MaxFila(Mat,i,M);

end;

procedure GeneraB(Mat:TM;var B:TV;var K:byte;N,M:byte);
var
  j:byte;
begin
  K:=0;
  for j:=1 to M do
   if Impares(Mat,N,j) then
    begin
      K:=K+1;
      B[K]:=SumaImpares(Mat,N,j);
    end;

end;

function Promedio(Mat:TM;N,X:byte):real;
var
  i:byte;
  acum:integer;
begin
  acum:=0;
  for i:=1 to N do
   acum:=acum+Mat[i,X];

  Promedio:=acum/N;
end ;

procedure MuestraA(A:TV;N:byte);
var
  i:byte;
begin
  for i:=1 to N do
   write(A[i],' ');
  writeln;
end;

procedure MuestraB(B:TV;K:byte);
var
  j:byte;
begin
  for j:=1 to K do
   write(B[j],' ');
  writeln;
end;

var
  Mat:TM;
  A,B:TV;
  N,M,K,X:byte;


begin
  LeeArchivo(Mat,N,M);
  //Inciso A
  GeneraVec(Mat,A,N,M);
  MuestraA(A,N);
  //Inciso B
  GeneraB(Mat,B,K,N,M);
  MuestraB(B,K);
  //Inciso C
  write('Ingrese una columna ---> ');Readln(X);
  writeln('Promedio de los elementos en la columna ',X,' ',Promedio(Mat,N,X):4:2);
  readln
end.

