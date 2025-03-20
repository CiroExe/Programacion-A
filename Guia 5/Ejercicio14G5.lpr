program Ejercicio14G5;
const
  MaxElem = 100;

type
  st7 = string[7];
  TVR = array[1..MaxElem] of real;
  TVS = array[1..MaxElem] of st7;

Procedure IniciaRecaudado(var Recaudado: TVR);
var
  i: byte;
begin
  for i := 1 to MaxElem do
    Recaudado[i] := 0;
end;

function buscaPatente(Patente: st7; Patentes: TVS; N: byte): byte;
var
  i: byte;
begin
  i := 1;
  while (i <= N) and (Patente <> Patentes[i]) do
    i := i + 1;

  if i <= N then
    buscaPatente := i
  else
    buscaPatente := 0;
end;

procedure LeeArchivo(var Patentes: TVS; var Recaudado: TVR; var N: byte);
var
  arch: Text;
  Patente: st7;
  Recaudad: real;
  pos: byte;
begin
  assign(arch, 'ej14.txt.txt'); reset(arch);
  N := 0;
  IniciaRecaudado(Recaudado);

  while not eof(arch) do
  begin
    read(arch, Patente, Recaudad);
    pos := buscaPatente(Patente, Patentes, N);
    if pos = 0 then
    begin
      N := N + 1;
      Patentes[N] := Patente;
      Recaudado[N] := Recaudado[N] + Recaudad;
    end
    else
      Recaudado[pos] := Recaudado[pos] + Recaudad;
    readln(arch);
  end;
  close(arch);
end;

procedure Muestra(Recaudado: TVR; N: byte);
var
  i: byte;
begin
  for i := 1 to N - 1 do
    write(Recaudado[i]:4:2, ' ');
  writeln;
end;

procedure PromAutos(Recaudado: TVR; N: byte);
var
  i: byte;
  suma: real;
begin
  suma := 0;
  for i := 1 to N - 1 do
    suma := suma + Recaudado[i];

  writeln('El promedio recaudado por auto es: $', (suma / (N - 1)):2:2);
end;

procedure superanX(Patentes: TVS; Recaudado: TVR; N: byte; X: real);
var
  i: byte;
begin
  for i := 1 to N - 1 do
    if Recaudado[i] > X then
      write(Patentes[i], ' ');
  writeln;
end;

procedure MenosRecaudo(Patentes: TVS; Recaudado: TVR; N: byte);
var
  min: real;
  i: byte;
  pos: byte;
  MenorRecaudo: st7;
begin
  min := 999;
  for i := 1 to N - 1 do
    if Recaudado[i] < min then
    begin
      min := Recaudado[i];
      MenorRecaudo := Patentes[i];
    end;

  writeln('La patente que menos recaudo fue ---> ', MenorRecaudo);
end;

var
  Patentes: TVS;
  Recaudado: TVR;
  N: byte;
  X: real;

begin
  LeeArchivo(Patentes, Recaudado, N);
  Muestra(Recaudado, N);
  // Inciso A
  PromAutos(Recaudado, N);
  // Inciso B
  write('Ingrese un tope de recaudo ---> '); readln(X);
  superanX(Patentes, Recaudado, N, X);
  // Inciso C
  MenosRecaudo(Patentes, Recaudado, N);
  readln;
end.

