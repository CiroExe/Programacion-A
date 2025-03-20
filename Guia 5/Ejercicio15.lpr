program Ejercicio15;
const
  max=30;

type
  st10=string[10];
  st7=string[7];
  TVS10=array[1..max] of st10;
  TVS7=array[1..max] of st7;
  TVR=array[1..max] of real;
  TVB=Array[1..max] of byte;


procedure LeeArchivo(var Clientes:TVS10;var Patentes:TVS7;var Tons:TVR;var tipoCereal:TVB;var N,M:byte);
var
  arch:text;
  car:char;


begin
  assign(Arch,'camiones.txt');Reset(arch);
  N:=0;
  M:=4;
  while not eof(Arch) do
   begin
     N:=N+1;
     Clientes[N]:='';
     Patentes[N]:='';
     read(Arch,car);
     while car<>' ' do
       begin
         Clientes[N]:=Clientes[N]+car;
         read(arch,car);
       end;

     while car=' ' do
       read(arch,car);

     while car<>' ' do
       begin
         Patentes[N]:=Patentes[N]+car;
         read(Arch,car);
       end;

     readln(Arch,tipoCereal[N],Tons[N]);
     readln(arch);

   end;
  close(Arch);
end;

procedure Porcentaje(Tons:TVR;tipoCereal:TVB;N:byte);
var
  i,j:byte;
  sumaTons,Trigo,Soja,Maiz,Girasol:real;
begin
  sumaTons:=0;
  Trigo:=0;
  Maiz:=0;
  Girasol:=0;
  Soja:=0;
  for i:=1 to N do
    sumaTons:=sumaTons+Tons[i];

  for j:=1 to N do
    begin
      case tipoCereal[j] of
      1:Trigo:=Trigo+Tons[j];
      2:Girasol:=Girasol+Tons[j];
      3:Soja:=Soja+Tons[j];
      4:Maiz:=Maiz+Tons[j];
      end;
    end;

  writeln('Trigo --> %',(Trigo*100)/sumaTons:4:2);
  writeln('Girasol --> %',(Girasol*100)/sumaTons:4:2);
  writeln('Soja --> %',(Soja*100)/sumaTons:4:2);
  writeln('Maiz --> %',(Maiz*100)/sumaTons:4:2);


end;

function buscaPatente(patente:st7;Patentes:TVS7;N:byte):byte;
var
  i:byte;
begin
  i:=1;
  while (i<=N) and (patente<>Patentes[i]) do
    i:=i+1;

  if i<=N then
   buscaPatente:=i
  else
    buscaPatente:=0;
end;

var
  Patentes:TVS7;
  Clientes:TVS10;
  N,M:byte;
  tipoCereal:TVB;
  patente:st7;
  pos:byte;
  Tons:TVR;
begin
  LeeArchivo(Clientes,Patentes,Tons,tipoCereal,N,M);
  //Inciso A
  porcentaje(Tons,tipoCereal,N);
  //Inciso B
  write('Ingrese patente que desea buscar ---> ');readln(patente);
  pos:=buscaPatente(patente,Patentes,N);
  if pos<>0 then
   begin
     writeln('PATENTE: ',Patentes[pos]);
     writeln('TIPO DE CEREAL: ',tipoCereal[pos]);
     writeln('CLIENTE: ',Clientes[pos]);
     writeln('TONELADAS TRANSPORTADAS: ',Tons[pos]:4:2);
   end
  else
   writeln('NO SE ENCONTRO LA PATENTE.');

  readln;
end.

