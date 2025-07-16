program totalizador;
type
  st5=string[5];
  st20=string[20];

  TRCarreras=Record
    escuderia:st5;
    nomPiloto:st20;
    tiempo:byte;
  end;

  TRHistorico=Record
    escuderia:st5;
    carreras_ganadas:byte;
    mejorTiempoProm:word;
  end;

  TArchCarreras=file of TRCarreras;
  TArchHistorico=file of TRHistorico;

procedure CargaCarreras(var CARRERAS:TArchCarreras);
var
  arch:text;
  RC:TRCarreras;
  aux:char;
begin
  rewrite(CARRERAS);
  assign(arch, 'carreras.txt');reset(arch);
  while not eof(arch) do
        begin
             readln(arch, RC.escuderia, RC.nomPiloto, RC.tiempo);
             write(CARRERAS,RC);
        end;
  close(CARRERAS);
  close(arch);
end;
procedure CargaHistorico(var HISTORICO:TArchHistorico);
var
  arch:text;
  RH:TRHistorico;
begin
  rewrite(HISTORICO);
  assign(arch, 'historico.txt');reset(arch);
  while not eof(arch) do
        begin
             readln(arch, RH.escuderia, RH.carreras_ganadas, RH.mejorTiempoProm);
             write(HISTORICO,RH);
        end;
  close(HISTORICO);
  close(arch);
end;

procedure MuestraHistorico(var HISTORICO:TArchHistorico);
var
  RH:TRHistorico;

begin
  reset(HISTORICO);read(HISTORICO,RH);
  while not eof(HISTORICO) do
        begin
             writeln(RH.escuderia,'       ',RH.carreras_ganadas,'       ',RH.mejorTiempoProm);
             read(HISTORICO,RH);
        end;
  close(HISTORICO);
end;

procedure Enfrenta(var CARRERAS:TArchCarreras;var HISTORICO:TArchHistorico);
var
  RC:TRCarreras;
  RH:TRHistorico;
  Temp:TArchHistorico;
  RT:TRHistorico;
  escAct,escMejorTiempo:st5;
  MejorTiempo,MejorTiempoAct,AcumTiempo, contCarreras:word;
  pilotoMejorTiempo:st20;

begin
  reset(CARRERAS);
  reset(HISTORICO);
  read(CARRERAS,RC);
  read(HISTORICO,RH);
  assign(Temp,'Temp.DAT');rewrite(Temp);

  MejorTiempo:=9999;

  while (not eof(CARRERAS)) or (not eof(HISTORICO)) do
        begin
             if RC.escuderia > RH.escuderia then
                begin
                  writeln(RH.escuderia,' No gano ninguna en el año');
                  write(Temp, RH);read(HISTORICO,RH);
                end
             else
                 if RC.escuderia<RH.escuderia then
                    begin
                      escAct:=RC.escuderia;
                      RT.carreras_ganadas:=0;
                      AcumTiempo:=0;

                      while escAct= RC.escuderia do
                            begin
                                 RT.carreras_ganadas:=RT.carreras_ganadas+1;
                                 AcumTiempo:=AcumTiempo+RC.tiempo;
                                 if RC.tiempo < MejorTiempo then
                                    begin
                                      MejorTiempo:=RC.tiempo;
                                      escMejorTiempo:=escAct;
                                      pilotoMejorTiempo:=RC.nomPiloto;
                                    end;
                                 read(CARRERAS, RC);
                            end;
                      RT.escuderia:=escAct;
                      RT.mejorTiempoProm:=AcumTiempo div RT.carreras_ganadas;
                      write(Temp,RT);
                    end
                 else
                     begin
                          escAct:=RC.escuderia;
                          contCarreras:=0;
                          AcumTiempo:=0;
                          while escAct = RC.escuderia do
                                begin
                                     RH.carreras_ganadas:=RH.carreras_ganadas+1;
                                     AcumTiempo:=AcumTiempo+RC.tiempo;
                                     contCarreras:=contCarreras+1;
                                     if RC.tiempo < MejorTiempo then
                                        begin
                                             MejorTiempo:=RC.tiempo;
                                             escMejorTiempo:=escAct;
                                             pilotoMejorTiempo:=RC.nomPiloto;
                                        end;
                                     read(CARRERAS, RC);
                                end;
                          MejorTiempoAct:=AcumTiempo div contCarreras;
                          if MejorTiempoAct < RH.mejorTiempoProm then
                             RH.mejorTiempoProm:=MejorTiempoAct;
                          write(Temp,RH);read(HISTORICO, RH);
                     end;
        end;
  write(Temp,RH);
  close(CARRERAS);close(HISTORICO);close(Temp);
  Erase(HISTORICO);rename(Temp,'HISTORICO.DAT');
  writeln('El piloto ',pilotoMejorTiempo,' tuvo el mejor tiempo en el ultimo año para la escuderia ',escMejorTiempo);

end;

var
  CARRERAS:TArchCarreras;
  HISTORICO:TArchHistorico;


begin
  assign(CARRERAS,'CARRERAS.DAT');
  CargaCarreras(CARRERAS);
  assign(HISTORICO,'HISTORICO.DAT');
  CargaHistorico(HISTORICO);
  MuestraHistorico(HISTORICO);
  writeln;
  Enfrenta(CARRERAS,HISTORICO);
  writeln;
  MuestraHistorico(HISTORICO);

  readln;
end.

