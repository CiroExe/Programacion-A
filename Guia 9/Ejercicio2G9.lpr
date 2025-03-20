program Ejercicio2G9;  {
Un Banco registra en TARJETAS.DAT el movimiento de las tarjetas de crédito de sus usuarios.
# NUMERO de TARJETA (1er campo de secuencia, clave primaria)
# NOMBRE del PROPIETARIO
# TOPE
# GASTO del MES (hasta el momento)
Además, se van ingresando (desde teclado ó archivo de texto) las compras con los siguientes datos:
- Número de Tarjeta (puede repetirse)
- Monto
- Código de operación
Procesar los datos, actualizando los gastos del mes, siempre que no supere el monto tope, en caso
contrario, rechazarlo y grabar en un archivo RECHAZADOS.DAT con la siguiente información:
# NUMERO de TARJETA
# CODIGO DE OPERACION
# MONTO }

const
  MAX=1000;

type
  st16=string[16];
  st17=string[17];
  TR= record
    numTarjeta:st16;
    nomPropietario:st17;
    tope,gastoMes:real;
  end;

  TR2= record
    numTarjeta:st16;
    monto:real;
    codOperacion:byte;
  end;

  TVTar=array[1..MAX] of st16;

  TA1=file of TR;
  TA2=file of TR2;

procedure LeeTarjetas(var TARJETAS:TA1);
var
  arch:Text;
  registro:TR;
  aux:char ;

begin
  assign(Arch,'tarjetas.txt');Reset(Arch);
  rewrite(TARJETAS);

  while not eof(arch) do
    begin
       with registro do
        readln(arch, numTarjeta,aux,nomPropietario, tope, gastoMes);

       write(TARJETAS, registro);

    end;
  close(arch);
  close(TARJETAS);
end;

procedure GeneraTabla(var VTarjetas:TVst;var TARJETAS:TA1);
var
  i:byte;
  registro:TR;
begin
  i:=0;

  reset(TARJETAS);

  while not eof(TARJETAS) do
    begin
       read(TARJETAS, registro);
       VTarjetas[i]=registro.numTarjeta;
       i:=i+1;
    end;

  close(TARJETAS);


end;

function Busca(VTarjetas:TVst; tarjeta:st16):word;
var
  i:byte;
begin
  i:=0;
  while tarjeta<>VTarjetas[i] do
    i:=i+1;

  Busca:=i;
end;

procedure Actualiza(var TARJETAS:TA1;var RECHAZADOS:TA2; VTarjetas:TVst);
var
  arch:Text;
  monto:real;
  R1:TR;
  R2:TR2;
  busqueda:word;


begin
  reset(TARJETAS);
  rewrite(RECHAZADOS);

  assign(arch,'compras.txt');
  reset(arch);

  while not eof(arch) do
     begin
        with R2 do
         begin
            readln(arch, numTarjeta,aux,codOperacion,monto);
            busqueda:=Busca(VTaretas,numTarjeta);
            seek(TARJETAS, busqueda-1);
            read(TARJETAS,R1);

            with R1 do
             begin
               if gastoMes+monto>tope then
                  write(RECHAZADOS, R2)
               else
                 begin
                   seek(TARJETAS,busqueda-1);
                   gastoMes:=gastoMes+monto;
                   write(TARJETAS, R1);
                 end;
             end;
         end;
     end;

  close(arch);
  close(TARJETAS);
  close(RECHAZADOS);
end;

procedure Imprime1(var TARJETAS:TA1);
var
  R1:TR;
begin
  reset(TARJETAS);

  writeln('Numero de Tarjeta  Nombre del Propietario       Tope      Gasto del Mes');
  while not eof(TARJETAS) do
    begin
      read(TARJETAS,R1);
      with R1 do
        writeln(numTarjeta,' ',nomPropietario,' $',tope:4:2,' $',gastoMes:4:2);
    end;
  close(TARJETAS);
end;


procedure Imprime2(var RECHAZADOS:TA2);
var
  R2:TR2;

begin
  reset(RECHAZADOS);

  writeln('Numero de Tarjeta  Codigo de Operacion    Monto  ');
  while not eof(RECHAZADOS) do
    begin
      read(RECHAZADOS, R2);
      with R2 do
       writeln(numTarjeta,' ', codOperacion,' $',monto);
    end;
  close(RECHAZADOS);
end;






begin
end.

