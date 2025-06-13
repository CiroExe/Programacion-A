program ej5;
const
  MAX=100;
type
  st4=string[4];

  TRAlumnos=Record
    matricula:st4;
    notaMat, notaFis, notaQui:byte;
  end;

  TRInscriptos=Record
    matricula:st4;
    insQui, insFis:byte;
  end;

  TArchAlumnos=file of TRAlumnos;
  TArchInscriptos=file of TRInscriptos;

procedure cargaALUMNOS(var ALUMNOS:TArchAlumnos);
var
  arch:text;
  RA:TRAlumnos;
begin
  rewrite(ALUMNOS);
  assign(arch, 'ALUMNOS.txt');reset(arch);

  while not eof(arch) do
        begin
             readln(arch, RA.matricula, RA.notaMat, RA.notaFis, RA.notaQui);
             write(ALUMNOS, RA);
        end;
  close(ALUMNOS);close(arch);
end;

procedure cargaINSCRIPTOS(var INSCRIPTOS:TArchInscriptos);
var
  arch:text;
  RI:TRInscriptos;
begin
  rewrite(INSCRIPTOS);
  assign(arch,'INSCRIPTOS.txt');reset(arch);

  while not eof(arch) do
        begin
             readln(arch, RI.matricula, RI.insQui, RI.insFis);
             write(INSCRIPTOS, RI);
        end;
  close(arch);close(INSCRIPTOS);
end;

procedure MuestraAlumnos(var ALUMNOS:TArchAlumnos);
var
  RA:TRAlumnos;
begin
  reset(ALUMNOS);

  while not eof(ALUMNOS) do
        begin
             read(ALUMNOS, RA);
             if(RA.matricula<>'ZZZZ') then
                writeln(RA.matricula,' ',RA.notaMat,' ', RA.notaFis,' ', RA.notaQui);
        end;
  close(ALUMNOS);
end;

procedure MuestraInscriptos(var INSCRIPTOS:TArchInscriptos);
var
  RI:TRInscriptos    ;
begin
  reset(INSCRIPTOS);

  while not eof(INSCRIPTOS) do
        begin
             read(INSCRIPTOS, RI);
             if(RI.matricula<>'ZZZZ') then
                writeln(RI.matricula,' ',RI.insQui,' ',RI.insFis);
        end;
  close(INSCRIPTOS);
end;

procedure Enfrenta(var ALUMNOS:TArchAlumnos;var INSCRIPTOS:TArchInscriptos);
var
  RA:TRAlumnos;
  RI:TRInscriptos;

begin
  reset(ALUMNOS);
  reset(INSCRIPTOS);
  read(ALUMNOS, RA);read(INSCRIPTOS, RI);

  writeln('              ALUMNOS RECHAZADOS');
  while (not eof(ALUMNOS)) or (not eof(INSCRIPTOS)) do
        begin
             if(RA.matricula<RI.matricula) then
                begin
                  read(ALUMNOS,RA);
                  writeln('Pase por aca');
                end
             else
                 if(RA.matricula>RI.matricula) then
                      begin
                         read(INSCRIPTOS, RI);
                         writeln('Pase por aca');
                      end
                 else
                     begin
                          if((RI.insQui=1) and (RA.notaQui< 4)) or ((RI.insFis=1) and ((RA.notaMat<4) or (RA.notaFis<4))) then
                             writeln(RA.matricula);
                          read(ALUMNOS,RA);read(INSCRIPTOS, RI);
                     end;

        end;
  close(ALUMNOS);
  close(INSCRIPTOS);
end;

var
  ALUMNOS:TArchAlumnos;
  INSCRIPTOS:TArchInscriptos;
begin
  assign(ALUMNOS,'ALUMNOS.DAT');
  assign(INSCRIPTOS,'INSCRIPTOS.DAT');
  cargaALUMNOS(ALUMNOS);
  cargaINSCRIPTOS(INSCRIPTOS);
  MuestraAlumnos(ALUMNOS);
  MuestraInscriptos(INSCRIPTOS);
  Enfrenta(ALUMNOS, INSCRIPTOS);
  readln;
end.

