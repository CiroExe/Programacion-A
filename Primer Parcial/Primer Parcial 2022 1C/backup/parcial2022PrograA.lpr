program parcial2022PrograA;
const
  MOTO=1000;
  AUTO=2000;
  CAMION=5000;
  MAX=100;

type

  st3=string[3];
  st7=string[7];

  TVVehiculo=array[1..MAX] of byte;
  TVVelocidad=array[1..MAX] of real;
  TVZona=array[1..MAX] of st3;
  TVPatente=array[1..MAX] of st7;

  TVFraccion=array[1..MAX] of real;


procedure InsertaOrdenado(var vehiculos:TVVehiculo; var velocidades:TVVelocidad; var zonas:TVZona; var patentes:TVPatente;var N:byte;zona:st3;tipoVehiculo:byte;patente:st7;velocidad:real);
var
  k:byte;

begin
  k:=N;

  while ((zona < zonas[k])and (k>0)) do
     begin
       velocidades[k+1]:=velocidades[k];
       vehiculos[k+1]:= vehiculos[k];
       zonas[k+1]:=zonas[k];
       patentes[k+1]:=patentes[k];
       k:=k-1;
     end;

  zonas[k+1]:=zona;
  patentes[k+1]:=patente;
  velocidades[k+1]:=velocidad;
  vehiculos[k+1]:=tipoVehiculo;

  N:=N+1;

end;

function buscaZona(zonas2:TVZona; zona:st3; N:byte):boolean;
var
  i:byte;

begin
  i:=1;

  while((zonas2[i] <> zona) and (i<N)) do
     i:=i+1;

  buscaZona:=zonas2[i] = zona;
end;

procedure CargaVec(var vehiculos:TVVehiculo; var velocidades:TVVelocidad; var zonas:TVZona; var patentes:TVPatente;var N:byte);
var
  archR:text;
  noCorresponden:word;
  tipoVehiculo:byte;
  velocidad:real;
  aux:char;
  patente:st7;
  zona:st3;


begin
  assign(archR, 'RADAR.TXT');reset(archR);
  noCorresponden:=0;
  while not eof(archR) do
     begin
       N:=N+1;
       readln(archR, tipoVehiculo, velocidad,aux, zona,aux, patente);
       case tipoVehiculo of
         1: if velocidad > 100 then
             InsertaOrdenado(vehiculos, velocidades, zonas, patentes, N, zona, tipoVehiculo, patente, velocidad)
            else
              noCorresponden:=noCorresponden+1;
         2: if velocidad > 110 then
             InsertaOrdenado(vehiculos, velocidades, zonas, patentes, N, zona, tipoVehiculo, patente, velocidad)
            else
              noCorresponden:=noCorresponden+1;
         3: if velocidad > 90 then
             InsertaOrdenado(vehiculos, velocidades, zonas, patentes, N, zona, tipoVehiculo, patente, velocidad)
            else
              noCorresponden:=noCorresponden+1;
       end;
     end;
  writeln(noCorresponden, ' Lecturas no corresponden a infracciones');
  close(archR);
end;

procedure CargaZonas(var zonas2:TVZona; var fraccion:TVFraccion;var M:byte);
var
  archZ:text;

begin
  assign(archZ, 'ZONAS.TXT');reset(archZ);

  while not eof(archZ) do
     begin
       M:=M+1;
       readln(archZ, zonas2[M], fraccion[M]);
     end;
  close(archZ);
end;

procedure maxZonas(fraccion:TVFraccion;zonas, zonas2:TVZona; patentes:TVPatente; velocidades:TVVelocidad; vehiculos:TVVehiculo; N, M:byte);
var
  i,j:byte;
  MultaAct,max:real;
  maxPatente:st7;



begin

  for i:=1 to M do
     begin
       max:=-1;
       for j:=1 to N do
          begin
            if zonas[j]=zonas2[i] then
               begin
                 case vehiculos[j] of
                   1: MultaAct:=MOTO*fraccion[i];
                   2: MultaAct:=AUTO*fraccion[i];
                   3: MultaAct:=CAMION*fraccion[i];
                 end;

                 if MultaAct > max then
                    begin
                      max:=MultaAct;
                      maxPatente:=patentes[j];
                    end;

               end;

          end;
       writeln('Para zona=',zonas2[i],' Patente=',maxPatente);
     end;
end;

function cantInfracciones(zonas:TVZona;zona:st7;N:byte):word;
var
  i:byte;
  cont:word;
begin

  cont:=0;
  for i:=1 to N do
     if zonas[i]=zona then
        cont:=cont+1;

  cantInfracciones:=cont;
end;


var
  N,M:byte;
  vehiculos:TVVehiculo;
  velocidades:TVVelocidad;
  zonas,zonas2:TVZona;
  patentes:TVPatente;
  zona:st7;
  fraccion:TVFraccion;
  busca:boolean;



begin
  N:=0;M:=0;
  CargaVec(vehiculos, velocidades, zonas, patentes, N);
  CargaZonas(zonas2,fraccion,M);

  maxZonas(fraccion, zonas, zonas2, patentes, velocidades, vehiculos, N, M);

  writeln('Ingrese zona que desea buscar');
  readln(zona);

  busca:=buscaZona(zonas2, zona, N);
  if busca then
     writeln('Cantidad de infracciones en la zona -> ',zona,' ',cantInfracciones(zonas, zona, N))
  else
    writeln('El codigo de la zona no existe.');

  readln;


end.

