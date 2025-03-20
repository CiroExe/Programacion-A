program ej12;
const
  MaxElem=100;

type
  st20=string[20];
  TVR=array[1..MaxElem] of real;
  TVS=array[1..MaxElem] of st20;
  TVC=array[1..MaxElem] of char;

function esEspecial(car:char):boolean;
begin
  if (car in ['a'..'z']) or (car in ['A'..'Z']) or (car in ['0'..'9']) then
   esEspecial:=False
  else
    esEspecial:=True;
end;


procedure CargaDatos(var VClave:TVS;var VProm:TVR;var VCar:TVC;var N:byte);
var
  arch:Text;
  ultimaLetra,car,aux:char;
  contEspeciales,num1,num2,num3:integer;
  contraValida:st20;


begin
  assign(arch,'EJ12.TXT');reset(arch);
  N:=0;


  while not eof(Arch) do
    begin

      ContraValida:='';
      contEspeciales:=0;

      read(Arch,car);
      while car<>' ' do
       begin
        if not(esEspecial(car)) and (contEspeciales<=3) then
         contraValida:=contraValida+car
        else
         contEspeciales:=contEspeciales+1;

        ultimaLetra:=car;
        read(arch,car);
       end;

      read(arch, num1,num2,num3);

      read(arch,aux);
      while aux=' ' do
        read(arch, aux);

      if (aux<>' ') and (contEspeciales<=3) and (ultimaLetra<>aux) then
       begin
         N:=N+1;
         VProm[N]:=((num1+num2+num3)/3);
         VCar[N]:=aux;
         VClave[N]:=contraValida;
       end;
      readln(arch);

    end;
close(arch);

end;

procedure ClaveMax(VClave:TVS;VProm:TVR;VCar:TVC;N:byte);
var
 i:byte;
 max:real;
 X:char;
 claveMax:st20;
 seEncontro:boolean;
begin
 max:=-1;
 seEncontro:=False;
 write('Ingrese la letra que desea buscar ---> ');Readln(X);
 for i:=1 to N do
  begin

   if (VCar[i]=X) and (VProm[i]>Max) then
     begin
      Max:=VProm[i];
      seEncontro:=True;
      claveMax:=VClave[i];
     end;
   end;

  if (seEncontro) and (Max<>-1) then
   writeln('Para la letra ingresada ',X,' la clave con mayor promedio es ',claveMax)
  else
   writeln('No se encontro la clave con mayor promedio.');
end;

function buscaClave(VClave:TVS;X:st20;N:byte):byte;
var
 i:byte;
begin
 i:=1;
 while (i<=N) and (VClave[i]<>X) do
  i:=i+1;

 if i<=N then
  buscaClave:=i
 else
  buscaClave:=0;
end;

procedure informarClave(VClave:TVS;VCar:TVC;VProm:TVR;N:byte);
var
 i,pos:byte;
 clave:st20;

begin
 write('Ingrese la clave que desea buscar ---> ');Readln(clave);
 pos:=buscaClave(VClave,clave,N);
 if pos<>0 then
  begin
   writeln('Clave: ',VClave[pos]);
   writeln('Letra Asociada: ',VCar[pos]);
   writeln('Promedio: ',VProm[pos]:4:2);
  end
 else
   writeln('La clave no existe.');


end;

procedure MuestraClave(VClave:TVS;N:byte);
var
  i:byte;
begin
   for i:=1 to N do
    write(VClave[i],' ');
end;

procedure MuestraCar(VCar:TVC;N:byte);
var
  i:byte;
begin
 for i:=1 to N do
   write(VCar[i],' ');
end;

procedure MuestraProm(VProm:TVR;N:byte);
var
  i:byte;
begin
 for i:=1 to N do
   write(VProm[i]:4:2,' ');
end;



var
  VClave:TVS;
  VCar:TVC;
  VProm:TVR;
  N:byte;
begin
  CargaDatos(VClave,VProm,VCar,N);
  MuestraClave(VClave,N);
  writeln;
  MuestraCar(VCar,N);
  writeln;
  MuestraProm(VProm,N);
  writeln;

  //Inciso A
  ClaveMax(VClave,VProm,VCar,N);

  //IncisoB
  informarClave(VClave,VCar,VProm,N);


  readln;
end.
