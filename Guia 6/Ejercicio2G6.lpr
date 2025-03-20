program Ejercicio2G6;
const
  max=100;

type
  st15=string[15];
  TM=array[1..max,1..max] of real;
  TV=array[1..max] of st15;

procedure LeeArchivo(var Notas:TM;var Nbre:TV;var N,K:byte);
var
  arch:Text;
  car:char;
  i:byte;


begin
  assign(Arch,'ej2.txt');Reset(Arch);
  read(arch,K);
   N:=0;
  while not eof(Arch) do
   begin
     readln(arch);
     N:=N+1;
     read(arch,car);
     while car<>' ' do
      begin
        Nbre[N]:=Nbre[N]+car;
        read(arch,car);
      end;
     for i:=1 to K do
      read(Arch,Notas[N,i]);
   end;
  Close(Arch);
end  ;

procedure MuestraNbre(Nbre:TV;N:byte);
var
  i:byte;

begin
  for i:=1 to N do
   write(Nbre[i],' ');
  writeln;
end;

procedure MuestraMat(Notas:TM;N,K:byte);
var
  i,j:byte;

begin
  for i:=1 to N do
   begin
    for j:=1 to K do
     write(Notas[i,j], ' ');
    writeln;
   end;

end;

procedure Listado(Nbre:TV;Notas:TM;N,K:byte);
var
  i,j:byte;
  contAp:word;

begin
  contAp:=0;
  write('APROBADOS: ');
  for i:=1 to N do
   begin
    for j:=1 to K do
     if Notas[i,j]>5 then
      contAp:=contAp+1;
    if contAp=K then
     writeln(Nbre[i]);
   end;
end;

procedure Situacion(Nbre:TV;Notas:TM;N,K:byte;var M:byte;var Promocionados:TV);
var
  i,j:byte;
  acum,prom:real;

begin
  M:=0;
  for i:=1 to N do
   begin
    acum:=0;
    for j:=1 to K do
     acum:=acum+Notas[i,j];

    prom:=acum/K;
    if prom>=7 then
     begin
       M:=M+1;
       Promocionados[M]:=Nbre[i];
       writeln('ALUMNO: ',Nbre[i]);
       writeln('PROMEDIO: ',prom:4:2);
       writeln('SITUACION: Promociona.');
     end
    else
      if (prom>=5) and (prom<7) and (Notas[i,K]>=5) then
       begin
        writeln('ALUMNO: ',Nbre[i]);
        writeln('PROMEDIO: ',prom:4:2);
        writeln('SITUACION: Habilita.');
       end
      else
       begin
        writeln('ALUMNO: ',Nbre[i]);
        writeln('PROMEDIO: ',prom:4:2);
        writeln('SITUACION: Desaprobado.');
       end;
   end;
end;

procedure MuestraProm(Promocionados:TV;M:byte);
var
  i:byte;

begin
  for i:=1 to M do
   write(Promocionados[i],' ');
  writeln;
end;

var
  Promocionados,Nbre:TV;
  Notas:TM;
  N,M,K:byte;


begin
  LeeArchivo(Notas,N,K,Nbre);
  MuestraMat(Notas,N,K);
  MuestraNbre(Nbre,N);
  //Inciso A
  Listado(Nbre,Notas,N,K);
  //Inciso B
  Situacion(Nbre,Notas,N,K,M,Promocionados);
  MuestraProm(Promocionados,M);
  readln
end.

