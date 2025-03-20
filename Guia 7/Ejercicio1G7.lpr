program Ejercicio1G7;
const
  max=100;

type
  st15=string[17];
  TRegF= Record
    Dia,mes:byte;
    Anio:word;
  end;

  TvRec= Record
    Nombre:st15;
    Fecha:TRegF;
  end;
  TVR=array[1..max] of TVRec;


procedure LeeArchivo(var Empleados:TVR;var N:byte);
var
  arch:Text;

begin
  assign(Arch,'empleados.txt');Reset(Arch);
  N:=0;

  while not eof(arch) do
   begin
    N:=N+1;
    readln(Arch, Empleados.Nombre[N], Empleados.Fecha.Dia[N], Empleados.Fecha.Mes[N], Empleados.Fecha.Anio[N]);
   end;
  close(Arch);
end;

function estacion(
begin
end.

