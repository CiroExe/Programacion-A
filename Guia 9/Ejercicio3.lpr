program Ejercicio3;
type
  st3=string[3];
  st15=string[15];

  TR=Record
    codExcursion:st3;
    desc:st15;
    precio_base,precio_comida:Real;
  end;

  TR2=record
    codExcursion:st3;
    numBoleto:byte;
    incluyeComida:char;
  end;

  TArch=file of TR;
  TArch2=file of TR2;

  TTabla=array[0..1000] of st3;


procedure GrabaExcursiones(var EXCURSIONES:TArch);
var
  R:TR;
  arch:Text;
  aux:char;
begin
  assign(arch,'excursiones.txt');reset(arch);
  assign(EXCURSIONES,'EXCURSIONES.DAT');rewrite(EXCURSIONES);

  while not eof(arch) do
    begin
      with R do
        readln(Arch,codExcursion,aux,desc,precio_base,precio_comida);

      write(EXCURSIONES, R);
    end;
  close(arch);
  close(EXCURSIONES);
end;

procedure GrabaBoleteria(var BOLETERIA:TArch2);
var
  R2:TR2;
  arch:text;
  aux:char;
begin
  assign(Arch,'boleteria.txt');reset(arch);
  assign(BOLETERIA,'BOLETERIA.DAT');Rewrite(BOLETERIA);

  while not eof(Arch) do
    begin
      with R2 do
        readln(arch,codExcursion,numBoleto,aux,incluyeComida);

      write(BOLETERIA,R2);
    end;
  close(arch);
  close(BOLETERIA);
end;

procedure GeneraTabla(var EXCURSIONES:TArch;var Tabla:TTabla;var N:byte);
var
  R:TR;
begin
  reset(EXCURSIONES);
  N:=0;

  while not eof(EXCURSIONES) do
    begin
      read(EXCURSIONES, R);
      Tabla[N]:=R.codExcursion;
      N:=N+1;

    end;
  close(EXCURSIONES);
end;

function BuscaCod(Tabla:TTabla;CodigoExcursion:st3):byte;
var
  i:byte;
begin
  i:=0;
  while CodigoExcursion<>Tabla[i] do
    i:=i+1;

  BuscaCod:=i;
end;

procedure CorteControl(var EXCURSIONES:TArch;var BOLETERIA:TArch2;var Tabla:TTabla);
var
  R:TR;
  R2:TR2;
  excActual:st3;
  cantComida,cantBoletos:word;
  MontoTotal:real;


begin
  reset(EXCURSIONES);
  reset(BOLETERIA);

  read(BOLETERIA,R2);
  writeln('EXCURSION     CANTIDAD DE BOLETOS     CANTIDAD DE COMIDA     MONTO TOTAL');

  while not eof (BOLETERIA) do
    begin
      excActual:=R2.codExcursion;
      cantBoletos:=0;
      cantComida:=0;
      MontoTotal:=0;
      while excActual=R2.codExcursion do
        begin
          cantBoletos:=cantBoletos+1;
          seek(EXCURSIONES, BuscaCod(Tabla,R2.codExcursion));
          read(EXCURSIONES, R);
          if R2.incluyeComida='S' then
           begin
             MontoTotal:=MontoTotal+R.precio_base+R.precio_comida;
             cantComida:=cantComida+1;

           end
          else
            MontoTotal:=MontoTotal+R.precio_base;

          read(BOLETERIA,R2);
        end;
      writeln(excActual,'                   ',cantBoletos,'                        ',cantComida,'               ',MontoTotal:4:2);
      writeln('% de turistas que contrataron excursion con comida ---> %', cantComida/cantBoletos:4:2);


    end;

  close(EXCURSIONES);
  close(BOLETERIA);
end;

var
  EXCURSIONES:TArch;
  BOLETERIA:TArch2;
  Tabla:TTabla;
  N:byte;



begin
  GrabaExcursiones(EXCURSIONES);
  GrabaBoleteria(BOLETERIA);
  GeneraTabla(EXCURSIONES,Tabla,N);
  CorteControl(EXCURSIONES,BOLETERIA,Tabla);

  readln
end.

