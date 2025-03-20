program Ejercicio5;
type
  st6=string[6];
  TR=Record
    matricula:st6;
    notaMat, notaFis, notaQca:byte;
  end;

  TR2=Record
    matricula:st6;
    inscriptoQca, inscriptoFis:byte;
  end;

  TArch=file of TR;
  TArch2=file of TR2;

  TTabla=Array[0..1000] of st6;


procedure GrabaAlumnos(var ALUMNOS:TArch);
var
  arch:Text;
  R:TR;

begin
  assign(arch,'alumnos.txt');Reset(arch);
  assign(ALUMNOS,'ALUMNOS.DAT');rewrite(ALUMNOS);

  while not eof(Arch) do
    begin
      with R do
       readln(arch,matricula,notaMat,notaFis,notaQca);

      write(ALUMNOS, R);
    end;
  close(arch);
end;

procedure GrabaInscriptos(var INSCRIPTOS:TArch2);
var
  arch:text;
  R2:TR2;

begin
  assign(arch,'inscriptos.txt');reset(arch);
  assign(INSCRIPTOS,'INSCRIPTOS.DAT');rewrite(INSCRIPTOS);

  while not eof(Arch) do
    begin
      with R2 do
       readln(arch, matricula, inscriptoQca,inscriptoFis);

      write(INSCRIPTOS, R2);
    end;

  close(INSCRIPTOS);
end;

procedure GeneraTabla(var Tabla:TTabla;var N:byte;var ALUMNOS:TArch);
var
  R:TR;

begin
  reset(ALUMNOS);
  N:=0;

  while not eof(ALUMNOS) do
    begin
      read(ALUMNOS,R);
      Tabla[N]:=R.matricula;
      N:=N+1;
    end;

  close(ALUMNOS);
end;

function BuscaMatricula(Tabla:TTabla;matricula:st6):byte;
var
  i:byte  ;
begin
  i:=0;
  while matricula<>Tabla[i] do
    i:=i+1;

  BuscaMatricula:=i;
end;

procedure Listado(var ALUMNOS:TArch;var INSCRIPTOS:TArch2;Tabla:TTabla);
var
  R:TR;
  R2:TR2;

begin
  reset(ALUMNOS);
  reset(INSCRIPTOS);

  writeln('MATRICULAS QUE NO CUMPLEN CON LOS REQUISITOS');
  read(INSCRIPTOS, R2);

  while not eof(INSCRIPTOS) do
    begin
      seek(ALUMNOS,BuscaMatricula(Tabla,R2.matricula));
      read(ALUMNOS,R);
      if ((R2.inscriptoQca=1) and (R.notaQca<4)) or ((R2.inscriptoFis=1) and ((R.notaMat<4) or (R.notaFis<4))) then
        writeln(R.matricula);


      read(INSCRIPTOS, R2);

    end;
  close(ALUMNOS);
  close(INSCRIPTOS);
end;

var
  ALUMNOS:TArch;
  INSCRIPTOS:TArch2;
  Tabla:TTabla;
  N:byte;

begin
  GrabaAlumnos(ALUMNOS);
  GrabaInscriptos(INSCRIPTOS);
  GeneraTabla(Tabla,N,Alumnos);
  Listado(ALUMNOS, INSCRIPTOS,Tabla);

  readln;
end.

