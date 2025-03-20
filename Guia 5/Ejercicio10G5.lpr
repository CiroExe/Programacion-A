program Ejercicio10G5;
const
  MaxElem=100;

type
  TV=array [1..MaxElem] of integer;


procedure GeneraVectorA(var VecA:TV;var N:byte);
var
  arch:text;
  num:integer;
begin
  assign(Arch, 'ej10.txt');Reset(arch);
  N:=0;
  while not eof(arch) do
   begin
     N:=N+1;
     read(arch, num);
     VecA[N]:=num;
   end;
  close(Arch);
end;

procedure GeneraB(var VecB:TV;var M:byte;VecA:TV;N:byte);
var
  i:byte;
  suma:integer;

begin
  M:=0;
  suma:=0;
  for i:=1 to N do
   begin
     if VecA[i]<0 then   // Analiza si el elemento del vector A es negativo
      begin
        if M>0 then
         VecB[M]:=suma;
        M:=M+1;                 //Inicializa variables en caso de que el elemento sea negativo
        suma:=0;

      end
     else
      suma:=suma+VecA[i];


   end;


end;

procedure GeneraC(var VecC:TV;var K:byte;VecA:TV;N:byte);
var
  i:byte;
  contSuma:integer;
begin
  K:=0;
  contSuma:=0;

  for i:=1 to N do
   begin
     if VecA[i]<0 then
      begin
        if K>0 then
         VecC[K]:=contSuma;
        contSuma:=0;
        K:=K+1;
      end
       else
   contSuma:=contSuma+1;
   end;

end;

procedure Muestra(VecB,VecC:TV;M,K:byte);
var
  i,j:byte;
begin
  for i:=1 to M do
    writeln(VecB[i]);

  writeln;

  for j:=1 to K do
   writeln(VecC[j]);
end;

var
  VecA,VecB,VecC:TV;
  N,M,K:byte;


begin
  GeneraVectorA(VecA,N);
  GeneraB(VecB,M,VecA,N);
  GeneraC(VecC,K,VecA,N);

  Muestra(VecB,VecC,M,K);
  readln

end.

