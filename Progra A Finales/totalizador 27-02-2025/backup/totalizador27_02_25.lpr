program totalizador27_02_25;
const
  MAX=100;

type
  st20=string[20];

  TRBodegas=Record
    bodega:st20;
    variedad:word;
    zona,tipo:byte;
    cant:real;
  end;

  TRHistoria=Record
    bodega:st20;
    Granel,Botellas:real;
  end;

  TArchBodegas=file of TRBodegas;
  TArchHistoria=file of TRHistoria;


procedure CargaHistoria(var HISTORIA:TArchHistoria);
var
  RH:TRHistoria;
  arch:text;

begin
  assign(arch,'historia.txt');reset(arch);
  rewrite(HISTORIA);

  while not eof(arch) do
        begin
             readln(arch,RH.bodega, RH.Granel, RH.Botellas);
             write(HISTORIA, RH);
        end;
  close(arch);close(HISTORIA);
end;
procedure CargaBodegas(var BODEGAS:TArchBodegas);
var
  RB:TRBodegas;
  arch:text;

begin
  assign(arch,'bode.txt');reset(arch);
  rewrite(BODEGAS);

  while not eof(arch) do
        begin
             readln(arch,RB.bodega, RB.variedad, RB.zona, RB.tipo, RB.cant);
             write(BODEGAS, RB);
        end;
  close(arch);close(BODEGAS);
end;

procedure MuestraArch(var BODEGAS:TArchBodegas);
var
  RB:TRBodegas;
begin
  Reset(BODEGAS);
  read(BODEGAS,RB);

  while not eof(BODEGAS) do
        begin
             writeln(RB.bodega,'     ', RB.variedad,'       ',RB.zona,'    ',RB.tipo,'     ',RB.cant:4:2);
             read(BODEGAS,RB);
        end;
  close(BODEGAS);

end;

procedure MuestraArchHistoria(var HISTORIA:TArchHistoria);
var
  RH:TRHistoria;
begin
  reset(HISTORIA);
  read(HISTORIA, RH);

  while not eof(HISTORIA) do
        begin
             writeln(RH.bodega,'   ', RH.Granel:4:2,'    ',RH.Botellas:4:2);
             read(HISTORIA, RH);
        end;
  close(HISTORIA);
end;
procedure Enfrenta(var BODEGAS:TArchBodegas; var HISTORIA:TArchHistoria);
var
  RB:TRBodegas;
  RH:TRHistoria;
  RT:TRHistoria;
  Temp:TArchHistoria;
  BodAct:st20;
  VarAct:word;
  ZonaMax:byte;
  Max,cantBotellas,cantGranel:real;
begin
  reset(HISTORIA);read(HISTORIA,RH);
  reset(BODEGAS);read(BODEGAS, RB);
  assign(Temp,'Temp.dat');rewrite(Temp);

  while (not eof(HISTORIA)) or (not eof(BODEGAS)) do
        begin
             if RH.bodega < RB.bodega then
                begin
                  write(Temp, RH);
                  read(HISTORIA,RH);
                end
             else
                 if RH.bodega > RB.bodega then
                    begin
                         cantGranel:=0;
                         cantBotellas:=0;
                         BodAct:=RB.bodega;
                         while BodAct=RB.bodega do
                               begin
                                    if RB.tipo=1 then
                                       cantGranel:=cantGranel+RB.cant
                                    else
                                      cantBotellas:=cantBotellas+RB.cant;
                                    read(BODEGAS,RB);
                               end;
                         RT.bodega:=BodAct;
                         RT.Granel:=cantGranel/1000;
                         RT.Botellas:=cantBotellas/1000;
                         write(Temp,RT);
                    end
                 else
                     begin
                          BodAct:=RB.bodega;
                          writeln('BODEGA: ',BodAct);
                          writeln('VARIEDAD          TOTAL LITROS A GRANEL         TOTAL BOTELLAS FRACCIONADO');
                          Max:=-1;

                          while BodAct=RB.bodega do
                                begin
                                     VarAct:=RB.variedad;
                                     cantGranel:=0;
                                     cantBotellas:=0;

                                     while(BodAct=RB.bodega) and (VarAct=RB.variedad) do
                                           begin
                                                if(RB.tipo=1) then
                                                   cantGranel:=cantGranel+RB.cant
                                                else
                                                    begin
                                                         cantBotellas:=cantBotellas+RB.cant;
                                                         if(RB.cant > Max) then
                                                            begin
                                                                 Max:=RB.cant;
                                                                 ZonaMax:=RB.zona;
                                                            end;
                                                    end;
                                                read(BODEGAS,RB);
                                           end;
                                     writeln(VarAct,'                           ',cantGranel/1000:4:2,'                   ',cantBotellas/1000:4:2);
                                     RH.Granel:=RH.granel+cantGranel;
                                     RH.Botellas:=RH.Botellas+cantBotellas;
                                end;
                          if Max=0 then
                             writeln('No hay ninguna zona que haya fabricado mas botellas')
                          else
                            writeln('Zona de mayor produccion de botellas ',ZonaMax);
                          write(Temp,RH);
                          read(HISTORIA,RH);
                          writeln;
                     end;
        end;
  write(Temp,RH);
  close(BODEGAS);
  close(HISTORIA);
  close(Temp);
  Erase(HISTORIA);
  Rename(Temp,'HISTORIA.DAT');
end;


var
  HISTORIA:TArchHistoria;
  BODEGAS:TArchBodegas;


begin
  assign(HISTORIA,'HISTORIA.DAT');
  assign(BODEGAS,'BODEGAS.DAT');
  CargaBodegas(BODEGAS);
  CargaHistoria(HISTORIA);
  MuestraArch(BODEGAS);
  writeln;
  writeln;
  MuestraArchHistoria(HISTORIA);
  Enfrenta(BODEGAS,HISTORIA);
  MuestraArchHistoria(HISTORIA);
  readln;
end.

