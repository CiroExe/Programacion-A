program Ejercicio2G5;
const
  MaxElem=100;
type
  TV=array[1..MaxElem] of integer;


procedure GeneraVectores(var VecImp,VecPar:TV;var N,M:byte);
var
  i:byte;
  arch:Text;
  num:integer;
begin
  assign(arch, 'ej2g5.txt');Reset(Arch);
  N:=0;
  while not eof(arch) do
   begin
     read(arch, num);
     while num=0 do
      read(ARch,num);
     if num mod 2=0 then
      begin
       N:=N+1;
       VecPar[N]:=num;
       write(VecPar[N],' ');
      end
     else
        if num mod 2<>0 then
          begin
           writeln;
           M:=M+1;
           VecImp[M]:=num;
           write(VecImp[M],' ' );
          end;
   end;
  Close(arch);
end;



var
  VecImp,VecPar:TV;
  N,M:byte;
begin
  GeneraVectores(VecImp,VecPar,N,M);
  readln;
end.

