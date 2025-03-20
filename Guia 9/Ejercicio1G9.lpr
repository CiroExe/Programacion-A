program Ejercicio1G9;
const
  MAX=100;
type
  st15=string[15];
  TR= record
    codPaquete:byte;
    peso:real;
    codDestino:byte;
    monto:Real;
        end;

  TR2= record
    codDestino:byte;
    nombre:st15;
  end;

  TA1= file of TR;
  TA2=file of TR2;

  TVR=array[1..MAX] of TR2;




procedure LeePaquetes(var PAQUETES:TA1);
var
  R:TR;
  arch:Text;
begin
  assign(PAQUETES,'PAQUETES.DAT'); rewrite(PAQUETES);
  assign(arch,'paquetes.txt');Reset(Arch);

  while not eof(arch) do
   begin
     with R do
       readln(arch, codPaquete,peso,codDestino, monto);

     write(PAQUETES, R);
   end;

  close(Arch);
  close(PAQUETES);

end;


procedure LeeDestinos(var DESTINOS:TA2);
var
  R:TR2;
  arch:Text;
  codPaquete:byte;
  aux:char;
  descripcion:st15;
begin
  assign(DESTINOS,'DESTINOS.DAT');rewrite(DESTINOS);
  assign(arch,'destinos.txt');Reset(Arch);

  while not eof(arch) do
   begin
     with R do
       readln(arch, codPaquete,aux,descripcion);

     write(DESTINOS, R);
   end;

  close(Arch);
  close(DESTINOS);

end;

procedure GeneraTabla(Var Tabla:TVR;var N:byte;var DESTINOS:TA2);
var
  i:byte;
  R2:TR2;
  codDestino:byte;
  nombre:St15;

begin
  reset(DESTINOS);
  i:=0;

  while not eof(DESTINOS) do
   begin
     read(DESTINOS,R2);
     Tabla
   end;
  close(DESTINOS);
end;

function Busca(Tabla:TVR;codDestino:byte):byte;
var
  i:byte;

begin
  i:=0;
  while codDestino<>Tabla[i].codDestino do
   i:=i+1;

  Busca:=i;
end;

procedure imprime(Tabla:TVR);
var
  i:byte;
begin
  for i:=1 to MAX do
    writeln(Tabla[i].Nombre)
end;

procedure lista(var PAQUETES:TA1;Tabla:TVR);
var
  DESTINOS:TA2;
  R:TR;
  R2:TR2;
  cantPaquetes,tot_Paquetes:word;
  acumPeso,tot_monto:Real;
  codDes_act:byte;



begin
  assign(DESTINOS,'DESTINOS.DAT');reset(DESTINOS);
  reset(PAQUETES);




  tot_Paquetes:=0;
  acumPeso:=0;
  tot_monto:=0;

  writeln('Destino      Cantidad de Paquetes');

  read(PAQUETES, R);
  while not eof(PAQUETES) do
    begin
      cantPaquetes:=0;
      tot_Paquetes:=tot_Paquetes+1;
      tot_monto:=tot_monto+R.monto;
      acumPeso:=acumPeso+R.peso;

      codDes_act:=R.codDestino;
      while codDes_Act=R.codDestino do
        begin
          cantPaquetes:=cantPaquetes+1;
          read(PAQUETES,R);
        end;
      writeln(Tabla[Busca(Tabla,R.codDestino)].nombre,' ',cantPaquetes);

    end;
  close(PAQUETES);
  close(DESTINOS);

  writeln('TOTAL          ',tot_paquetes);
end;


var
  PAQUETES:TA1;
  DESTINOS:TA2;
  Tabla:TVR;


begin
  LeePaquetes(PAQUETES);
  LeeDestinos(DESTINOS);
  imprime(Tabla);
  lista(PAQUETES,Tabla);
  readln;
end.

