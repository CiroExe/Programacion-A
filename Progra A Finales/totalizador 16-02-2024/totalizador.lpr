program totalizador;
const
  MAX=10;

type
    st15=string[15];
    st8=string[8];
    st3=string[3];

    TREmpleados=Record
      legajo:integer;
      nombre:st15;
      sueldo:real;
    end;

    TRHoras=Record
      legajo:integer;
      fecha:st8;
      cantHoras:byte;
      codPozo:st3;
    end;

    TRPozo=Record
      codPozo:st3;
      descripcion:st15;
      valor_hora:word;
    end;
    TVPozo=Array[1..MAX] of TRPozo;
    TVHoras=Array[1..MAX] of byte;

    TArchEmpleados=file of TREmpleados;
    TArchHoras=file of TRHoras;
    TArchPozo=file of TRPozo;

procedure CargaEmpleados(var EMPLEADOS:TArchEmpleados);
var
  RE:TREmpleados;
  arch:text;
  aux:char;

begin
  rewrite(EMPLEADOS);
  assign(arch,'empleados.txt');reset(arch);
  while not eof(arch) do
        begin
          readln(arch, RE.nombre,RE.legajo,RE.sueldo);
          write(EMPLEADOS, RE);
        end;
  close(EMPLEADOS);
  close(arch);
end;

procedure CargaHoras(var HORAS:TArchHoras);
var
  RH:TRHoras;
  arch:text;
  aux:char;

begin
  rewrite(HORAS);
  assign(arch,'horas.txt');reset(arch);
  while not eof(arch) do
        begin
          readln(arch, RH.legajo,aux,RH.fecha,RH.cantHoras,aux,RH.codPozo);
          write(HORAS, RH);
        end;
  close(HORAS);
  close(arch);
end;

procedure MuestraHoras(var HORAS:TArchHoras);
var
  RH:TRHoras;

begin
  reset(HORAS);
  read(HORAS,RH);

  while not eof(HORAS) do
        begin
          writeln(RH.legajo);
          read(HORAS,RH);
        end;
  close(HORAS);
end;

procedure CargaVecPozos(var VecPozos:TVPozo);
var
  RP:TRPozo;
  arch:text;
  i:byte;
  aux:char;

begin
  assign(arch,'pozos.txt');reset(arch);
  i:=1;
  while not eof(arch) do
        begin
          readln(arch, VecPozos[i].codPozo,aux,VecPozos[i].descripcion, VecPozos[i].valor_hora);
          i:=i+1;
        end;
  close(arch);
end;

function esPrimeraQuincena(fecha: st8): boolean;
begin
  esPrimeraQuincena := (Copy(fecha, 7, 2) >= '01') and (Copy(fecha, 7, 2) <= '15');
end;

function BuscaPozo(VecPozos:TVPozo; codigo:st3):byte;
var
  i:byte;
begin
  i:=1;
  while VecPozos[i].codPozo <> codigo do
        i:=i+1;
  BuscaPozo:=i;
end;

procedure Enfrenta(var EMPLEADOS:TArchEmpleados; var HORAS:TArchHoras;VecPozos:TVPozo; var VecHoras:TVHoras);
var
  RE:TREmpleados;
  RH:TRHoras;
  Temp:TArchEmpleados;
  i,j,k:byte;
  noTrabajo, error:word;
  legajoAct:integer;

begin
  reset(EMPLEADOS);read(EMPLEADOS, RE);
  reset(HORAS);read(HORAS, RH);
  assign(Temp, 'Temp.dat');rewrite(Temp);
  noTrabajo:=0;
  error:=0;
  for k:=1 to MAX do
      VecHoras[k]:=0;

  while (not eof(EMPLEADOS)) or (not eof(HORAS)) do
        begin
             if RE.legajo < RH.legajo then
                begin
                  noTrabajo:=noTrabajo+1;
                  write(Temp,RE);
                  read(EMPLEADOS,RE);
                end
             else
                 begin
                      if RE.legajo>RH.legajo then
                         begin
                           error:=error+1;
                           legajoAct:=RH.legajo;
                           while legajoAct=RH.legajo do
                                 read(HORAS, RH);
                         end
                      else
                          begin
                               legajoAct:=RH.legajo;

                               while legajoAct=RH.legajo do
                                     begin
                                          i:=BuscaPozo(VecPozos, RH.codPozo);
                                          RE.sueldo:=RE.sueldo+(RH.cantHoras*VecPozos[i].valor_hora);
                                          if (esPrimeraQuincena(RH.fecha)) then
                                             VecHoras[i]:=VecHoras[i]+RH.cantHoras;
                                          read(HORAS, RH);
                                     end;
                               write(Temp, RE);
                               read(EMPLEADOS, RE);
                          end;
                 end;
        end;
  close(EMPLEADOS);
  close(HORAS);
  close(Temp);
  ERASE(EMPLEADOS);
  RENAME(Temp, 'EMPLEADOS.DAT');
  if error<>0 then
     writeln('Hubo ',error,' legajos erroneos.')
  else
    writeln('No hubo legajos erroneos');

  if noTrabajo<>0 then
     writeln('No trabajaron ', noTrabajo,' empleados el mes anterior.')
  else
    writeln('Todos trabajaron el pasado mes.');
  writeln('Codigo Pozo          Descripcion       CantHoras Quincena         Monto 1era Quincena');
  for j:=1 to MAX do
      writeln(VecPozos[j].codPozo,'                   ',VecPozos[j].descripcion,'          ',VecHoras[j],'                  $',(VecPozos[j].valor_hora*VecHoras[j]));

end;

procedure MuestraEmpleados(var EMPLEADOS:TArchEmpleados);
var
  RE:TREmpleados;

begin
  reset(EMPLEADOS);

  while not eof(EMPLEADOS) do
        begin
         read(EMPLEADOS,RE);
          writeln(RE.legajo,'       ',RE.nombre,'       $',RE.sueldo:4:2);
        end;
  close(EMPLEADOS);
end;

var
  EMPLEADOS:TArchEmpleados;
  HORAS:TArchHoras;
  VecPozos:TVPozo;
  VecHoras:TVHoras;

begin
  assign(EMPLEADOS,'EMPLEADOS.DAT');
  assign(HORAS,'HORAS.DAT');

  CargaEmpleados(EMPLEADOS);
  CargaHoras(HORAS);
  CargaVecPozos(VecPozos);
  MuestraEmpleados(EMPLEADOS);
  Enfrenta(EMPLEADOS, HORAS, VecPozos, VecHoras);
  writeln;
  MuestraEmpleados(EMPLEADOS);
  readln;

end.

