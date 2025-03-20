program Ejercicio2;
type
  st17=String[17];
  st8=string[8];

  TR= Record
    numTarjeta:st8;
    nomProp:st17;
    tope,gastoMes:real;
  end;

  TR2= Record
    numTarjeta:st8;
    codOperacion:byte;
    monto:real;
  end;

  TArch= file of TR;
  TArch2=file of TR2;

  TTabla=Array[0..1000] of st8;

procedure GrabaTarjetas(Var TARJETAS:TArch);
var
  arch:text;
  R:TR;
  aux:char;

begin
  assign(arch, 'tarjetas.txt');Reset(Arch);
  assign(TARJETAS,'TARJETAS.DAT');rewrite(TARJETAS);

  while not eof(arch) do
    begin
      with R do
        readln(Arch,numTarjeta,aux,nomProp,tope,gastoMes);

      write(TARJETAS,R);


    end;
  close(arch);
  close(TARJETAS);

end;

procedure GeneraTabla(var Tabla:TTabla;var N:byte;var TARJETAS:TArch);
var
  R:TR;

begin
  reset(TARJETAS);
  N:=0;

  while not eof(TARJETAS) do
    begin
      read(TARJETAS, R) ;
      Tabla[N]:=R.numTarjeta;
      N:=N+1;
    end;

  close(TARJETAS);

end;

function BuscaTarjeta(Tabla:TTabla;Tarjeta:st8):byte;
var
  i:byte;

begin
  i:=0;
  while Tarjeta<>Tabla[i] do
    i:=i+1;
  BuscaTarjeta:=i;
end;

procedure GeneraRechazados(var RECHAZADOS:TArch2;var TARJETAS:TArch;Tabla:TTabla );
var
  R:TR;
  R2:TR2;
  Tarjeta:st8;
  montoCompra:Real;
  codigo_Operacion:byte;



begin
  assign(RECHAZADOS,'RECHAZADOS.DAT');rewrite(RECHAZADOS);
  reset(TARJETAS);
  write('Ingrese Numero de tarjeta que desea ingresar --> ');readln(Tarjeta);
  write('Ingrese Monto --> ');Readln(montoCompra);
  write('Ingrese codigo de operacion --> ');Readln(codigo_Operacion);

  while Tarjeta<>'XXX' do
    begin
      seek(TARJETAS,BuscaTarjeta(Tabla,Tarjeta));
      read(TARJETAS, R);
      with R do
        begin
          if montoCompra<tope then
            begin
            gastoMes:=gastoMes+montoCompra ;
            write(TARJETAS, R);
            end
          else
            begin
              with R2 do
                begin
                  numTarjeta:=Tarjeta;
                  codOperacion:=codigo_Operacion;
                  monto:=monto;
                end;
            end;
        end;
      write('Ingrese Numero de tarjeta que desea ingresar --> ');readln(Tarjeta);
    end;

  close(TARJETAS);
  close(RECHAZADOS);

end;

procedure ListadoTarjetas(var TARJETAS:TArch);
var
  R:TR;

begin
  reset(TARJETAS);
  writeln('Numero de Tarjeta   Propietario   Tope   Gastos del mes');

  while not eof(TARJETAS) do
    begin
      read(TARJETAS,R);
      with R do
        begin
          writeln(numTarjeta,'   ',nomProp,'   ',tope:4:2,'   ',gastoMes:4:2);
        end;
    end;
  Close(TARJETAS);
end;



procedure ListadoTarjetasAct(var TARJETAS:TArch);
var
  R:TR;

begin
  reset(TARJETAS);
  writeln('Numero de Tarjeta   Propietario   Tope   Gastos del mes');

  while not eof(TARJETAS) do
    begin
      read(TARJETAS,R);
      with R do
        begin
          writeln(numTarjeta,'   ',nomProp,'   ',tope:4:2,'   ',gastoMes:4:2);
        end;
    end;
  Close(TARJETAS);
end;

procedure ListadoRechazados(var RECHAZADOS:TArch2);
var
  R2:TR2;

begin
  reset(RECHAZADOS);
  writeln('Numero de Tarjeta    Codigo de operacion    Monto');

  while not eof(RECHAZADOS) do
  begin
    read(RECHAZADOS, R2);
    with R2 do
      begin
        writeln(numTarjeta,'    ',codOperacion,'    ',monto:4:2);

      end;
  end;
    close(RECHAZADOS);
end;

var
  TARJETAS:TArch;
  RECHAZADOS:TArch2;
  Tabla:TTabla;
  N:byte;

begin
  GrabaTarjetas(TARJETAS);
  GeneraTabla(Tabla,N,TARJETAS);
  ListadoTarjetas(TARJETAS);
  GeneraRechazados(RECHAZADOS,TARJETAS,Tabla);
  ListadoTarjetasAct(TARJETAS);
  ListadoRechazados(RECHAZADOS);


  readln;
end.

