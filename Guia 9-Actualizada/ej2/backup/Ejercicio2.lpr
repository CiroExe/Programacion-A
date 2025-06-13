program Ejercicio2;

type
    st8=string[8];
    st20=string[20];
    TRTarjeta= Record
      numTarjeta:st8;
      propietario:st20;
      tope, gastoMes:real;
    end;

    TRRechazados = Record
      numTarjeta:st8;
      montoCompra:real;
      codOperacion:integer;
    end;

    TArchTarjetas=file of TRTarjeta;
    TArchRechazados=file of TRRechazados;
    TVTarjetas=array[0..100] of st8;

procedure GeneraTARJETAS(var TARJETAS:TArchTarjetas);
var
  arch:text;
  RT:TRTarjeta;// Registro Tarjeta
  aux:char;
begin
  assign(arch, 'TARJETAS.txt');reset(arch);
  rewrite(TARJETAS);

  while not eof(arch) do
        begin
          readln(arch, RT.numTarjeta, aux,RT.propietario, RT.tope, RT.gastoMes);
          write(TARJETAS, RT);
        end;
  close(TARJETAS);close(arch);
end;

procedure MuestraTARJETAS(var TARJETAS:TArchTarjetas);
var
  RT:TRTarjeta;
begin
  reset(TARJETAS);  read(TARJETAS, RT);

  while not eof(TARJETAs) do
        begin
          with RT do
               begin
                    write('Numero de tarjeta: ',numTarjeta,'     ');
                    write('Propietario: ', propietario,'       ');
                    write('Tope: ', tope:4:2,'      ');
                    writeln('Gastos del mes', gastoMes:4:2,'      ');
               end;
          read(TARJETAS, RT);
        end;
end;

procedure generaTabla(var TARJETAS:TArchTarjetas; var Tabla:TVTarjetas; var n:byte);
var
  RT:TRTarjeta;
begin
     reset(TARJETAS);
     n:=0;
     while not eof(TARJETAS) do
           begin
             read(TARJETAS, RT);
             Tabla[n]:=RT.numTarjeta;
             n:=n+1;
           end;
     close(TARJETAS);
end;

function buscaTabla(Tabla:TVTarjetas; numTarjeta:st8):byte;
var
  i:byte;
begin
     i:=0;
     while Tabla[i]<>numTarjeta do
           i:=i+1;
     buscaTabla:=i;
end;

procedure Actualiza(var TARJETAS:TArchTarjetas; var RECHAZADOS:TArchRechazados; Tabla:TVTarjetas);
var
   Tarjeta:st8;
   monto:real;
   codigo:byte;
   RT:TRTarjeta;
   RR:TRRechazados;
begin
     reset(TARJETAS);
     rewrite(RECHAZADOS);

     write('Ingrese numero de tarjeta(999 para finalizar): ');readln(Tarjeta);

     while(Tarjeta<>'999') do
           begin
             write('Ingrese monto de la compra: ');readln(monto);
             write('Ingrese codigo de operacion: ');readln(codigo);
             seek(TARJETAS, buscaTabla(Tabla, Tarjeta));
             read(TARJETAS, RT);
             if(RT.gastoMes+monto > RT.tope) then
                 begin
                   with RR do
                        begin
                          numTarjeta:=Tarjeta;
                          montoCompra:=monto;
                          codOperacion:=codigo;
                        end;
                   write(RECHAZADOS, RR);
                 end
             else
                 begin
                      RT.gastoMes:=RT.gastoMes+monto;
                      write(TARJETAS,RT);
                 end;
             write('Ingrese numero de tarjeta(999 para finalizar): ');readln(Tarjeta);
           end;
     close(RECHAZADOS);close(TARJETAS);
end;

procedure MuestraRECHAZADOS(var RECHAZADOS:TArchRechazados);
var
   RR:TRRechazados;

begin
     reset(RECHAZADOS);
     while not eof(RECHAZADOS) do
           begin
             read(RECHAZADOS, RR);
             write('Numero de Tarjeta Rechazada: ', RR.numTarjeta);
             write('Codigo de operacion: ', RR.codOperacion);
             writeln('Monto: ', RR.montoCompra:4:2);
           end;
     close(RECHAZADOS);
end;

var
  TARJETAS:TArchTarjetas;
  RECHAZADOS:TArchRechazados;
  Tabla:TVTarjetas;
  n:byte;
begin
  assign(RECHAZADOS, 'RECHAZADOS.DAT');
  assign(TARJETAS, 'TARJETAS.DAT');
  generaTarjetas(TARJETAS);
  MuestraTARJETAS(TARJETAS);
  generaTabla(TARJETAS,Tabla,n);
  Actualiza(TARJETAS,RECHAZADOS,Tabla);
  MuestraRECHAZADOS(RECHAZADOS);
  readln;
end.

