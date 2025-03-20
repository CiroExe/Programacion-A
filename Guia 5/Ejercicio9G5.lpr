program Ejercicio9G5;
const
  MaxElem=100;

type
  TV=array[1..MaxElem] of integer;

procedure GeneraA(var VecA,VecB:TV;var N,M:byte);
var
  arch:TExt;
  anterior,sig:integer;

begin
  assign(arch,'ej9.txt');reset(Arch);
   M:=0;
   read(Arch, anterior);
  while not eof(Arch) do
   begin
     read(Arch,sig);

     if anterior<sig then
      begin
        M:=M+1;
        VecB[M]:=anterior;
        anterior:=Sig;
      end;
   end;
  close(Arch);

end;


procedure GeneraC(var VecC:TV;var K:byte;VecB:TV;M:byte);
var
  i:byte;
begin
  for i:=1 to M do
    begin
      if (VecB[i]
    end;
end;

procedure Muestra(VecA,VecB:TV;N,M:byte);
var
  i,j:byte;
begin

  for j:=1 to M do
    writeln(VecB[j]);

end;

var
  VecA,VecB:TV;
  N,M:byte;

begin
  GeneraA(VecA,VecB,N,M);
  Muestra(VecA,VecB,N,M);
  readln
end.

