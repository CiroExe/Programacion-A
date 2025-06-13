program Ejercicio3;
const
  MAX=100;

type

  st3=string[3];
  st15=string[18];

  TRVec=Record
    codExc:st3;
    descripcion:st15;
    precioBase, precioComida:real;
  end;

  TRBoleteria= Record
    codExc:st3;
    numBoleto:byte;
    incluyeComida:char;
  end;

  TVec=array[1..50] of TRVec;

  TArchBoleteria= file of TRBoleteria;

procedure generaVec(var Excursiones:TVec;var n:byte);
var
  arch:text;
  aux:char;
begin
  assign(arch,'EXCURSIONES.txt');reset(arch);
  n:=0;
  while not eof(arch) do
        begin
          n:=n+1;
          with Excursiones[n] do
               begin
                    readln(arch, codExc, descripcion, precioBase, precioComida);
               end;
        end;
  close(arch);
end;

procedure generaBoleteria(var BOLETERIA:TArchBoleteria);
var
  arch:text;
  RB:TRBoleteria; // Registro Boleteria
  aux:char;
begin
  rewrite(BOLETERIA);
  assign(arch, 'BOLETERIA.txt');reset(arch);

  while not eof(arch) do
        begin
             readln(arch, RB.codExc, RB.numBoleto, aux, RB.incluyeComida);
             write(BOLETERIA, RB);
        end;
  close(arch);close(BOLETERIA);
end;

procedure MuestraBoleteria(var BOLETERIA:TArchBoleteria);
var
  RB:TRBoleteria;
begin
  reset(BOLETERIA);

  while not eof(BOLETERIA) do
        begin
             read(BOLETERIA, RB);
             writeln(RB.codExc,'    ', RB.numBoleto, '    ', RB.incluyeComida);
        end;
  close(BOLETERIA);
end;

procedure Listado(var BOLETERIA:TArchBoleteria; Excursiones:TVec;n:byte);
var
   RB:TRBoleteria;
   excAct:st3;
   cantBoletos, cantComida, cantComidaTotal, cantBoletosTotal:word;
   montoTotal:real;
   i:byte;
begin
  reset(BOLETERIA);read(BOLETERIA, RB);

  cantComidaTotal:=0;
  cantBoletosTotal:=0;
  i:=0;
  writeln('EXCURSION              CANT. BOLETOS       CANT. COMIDA       MONTO TOTAL');
  while not eof(BOLETERIA) do
        begin
          i:=i+1;
          excAct:=RB.codExc;
          cantComida:=0;
          cantBoletos:=0;
          montoTotal:=0;
          while (excAct=RB.codExc) and (not eof(BOLETERIA)) do
                begin
                  cantBoletos:=cantBoletos+1;
                  if RB.incluyeComida='S' then
                     cantComida:=cantComida+1;
                  read(BOLETERIA, RB);
                end;
          cantComidaTotal:=cantComidaTotal+cantComida;
          cantBoletosTotal:=cantBoletosTotal+cantBoletos;
          writeln(Excursiones[i].descripcion,'           ',cantBoletos,'                  ',cantComida,'           $', ((cantComida*Excursiones[i].precioComida) + (cantBoletos*Excursiones[i].precioBase)):4:2);
        end;
  writeln('% de turistas que contrataron excursion con comida: %',(cantComidaTotal/cantBoletosTotal)*100:4:2);
  close(BOLETERIA);
end;

var
  n:byte;
  BOLETERIA:TArchBoleteria;
  Excursiones:TVec;
begin
  n:=0;
  assign(BOLETERIA,'BOLETERIA.DAT');
  generaBoleteria(BOLETERIA);
  MuestraBoleteria(BOLETERIA);
  generaVec(Excursiones, n);
  Listado(BOLETERIA, Excursiones, n);
  readln;

end.

