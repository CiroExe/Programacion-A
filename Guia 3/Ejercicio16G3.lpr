program Ejercicio16G3;
{Una empresa de autos de alquiler posee N vehículos y ha registrado la siguiente información de los
viajes realizados, por cada uno de ellos:
 Patente
 Total de litros de combustible consumidos
Y por cada viaje realizado
 - Kilómetros recorridos. (0 indica fin de datos).
Se pide ingresar los datos e informar:
a) Por cada vehículo el consumo que tuvo (cantidad de litros por km. recorrido)
b) Patente del vehículo que más viajes hizo.
c) Total de litros consumidos por el auto que hizo la menor cantidad de kms.}
var
  N,cont_viajes,MaxViajes:integer;
  Patente, patenteMaxViajes:string;
  total_LitrosConsumidos, consumo, MenorLitrosConsumidos:real ;
  Km_recorridos, acumKm,MinKm:integer;
  arch:Text;



begin
  assign(arch, 'Viajes.txt');reset(arch);
  maxViajes:=-999;
  MinKm:=999;
  readln(arch, N);
  while not eof(arch) do
   begin
     readln(arch, Patente);
     readln(arch, total_LitrosConsumidos);
     read(arch, Km_recorridos);
     cont_viajes:=0;
     acumKm:=0;
     while Km_Recorridos<>0 do
      begin
        inc(cont_viajes);
        read(arch, Km_recorridos);
        acumKm:=acumKm+Km_recorridos;
      end;


     if acumKm<MinKm then
      begin
       MinKm:=acumKm;
       MenorLitrosConsumidos:=total_litrosConsumidos;
      end;

     if cont_viajes>maxViajes then
      begin
       maxViajes:=cont_viajes;
       patenteMaxViajes:=Patente;
      end;

     consumo:=total_LitrosConsumidos/acumKm;

     writeln('Patente: ',Patente);
     writeln('Consumo: ', consumo:4:2);
     readln(arch);
   end;
  close(arch);
  writeln('Patente que mas viajes realizo: ',patenteMaxViajes);
  writeln(MenorLitrosConsumidos,' fue la cantidad total de litros consumidos por el auto que menor cantidad de viajes realizo');
  readln
end.

