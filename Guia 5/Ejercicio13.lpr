program Ejercicio13;
const
  MaxElem=20;
  Hora=24;
  tarifaMoto=150;
  tarifaAuto=300;
  tarifaCamioneta=300;
  tarifaCamion=470;
  tarifaColectivo=390;

type
  TVI=array[1..MaxElem] of integer;
  TVR=array[1..MaxElem] of real;

procedure IniciaVehiculos(var Vehiculos:TVI);
var
  i:byte;
begin
  for i:=1 to MaxElem do
   Vehiculos[i]:=0;
end;

procedure IniciaImporte(var Importe:TVR);
var
  i:byte;
begin
  for i:=1 to MaxElem do
   Importe[i]:=0;
end;

procedure LeeArchivo(var Vehiculos:TVI;var Importe:TVR;var N:byte);
var
 arch:Text;
 i:byte;
 cabina,tipoVehiculo:byte;
 hora:integer;

begin
 assign(arch,'ej13.txt');Reset(Arch);
 IniciaVehiculos(Vehiculos);
 IniciaImporte(Importe);
 readln(arch, N);



 while not eof(Arch) do
  begin
   readln(arch, cabina, tipoVehiculo, hora);
   Vehiculos[cabina]:=Vehiculos[cabina]+1;
   case tipoVehiculo of
    1:Importe[cabina]:=Importe[cabina]+tarifaAuto;
    2:Importe[cabina]:=Importe[cabina]+(tarifaMoto);
    3:Importe[cabina]:=Importe[cabina]+(tarifaCamioneta);
    4:Importe[cabina]:=Importe[cabina]+(tarifaCamion);
    5:Importe[cabina]:=Importe[cabina]+(tarifaColectivo);
    end;

   //Calcula incremento
   if (hora>=10) and (hora<=18) then
    Importe[cabina]:=Importe[cabina]*1.1;

  end;
 close(arch);

end;

procedure MuestraVehiculos(Vehiculos:TVI;N:byte);
var
 i:byte;
begin
 for i:=1 to maxElem do
  write(Vehiculos[i],' ');
end;

procedure MuestraImporte(Importe:TVR;N:byte);
var
 i:byte;
begin
 for i:=1 to maxElem do
  write(Importe[i]:4:2,' ');
end;

function masRecaudo(Importe:TVR;N:byte):byte;
var
 i:byte;
 max:real;
 pos:byte;
begin
 max:=-999;
 pos:=0;
 for i:=1 to N do
   if Importe[i]>max then
    begin
      max:=Importe[i];
      pos:=i;
    end;

 masRecaudo:=pos;

end;

var
 Vehiculos:TVI;
 Importe:TVR;
 N:byte;

begin
  LeeArchivo(Vehiculos,Importe,N);
  MuestraVehiculos(Vehiculos,N);
  writeln;
  MuestraImporte(Importe,N);
  writeln;
  writeln('La cabina que mas dinero recaudo fue la ',masRecaudo(Importe,N));
  readln

end.

