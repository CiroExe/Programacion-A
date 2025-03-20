program Ejercicio11G5;
const
  MaxElem = 100;

type
  st15 = string[15];
  TVS = array[1..MaxElem] of st15;
  TVI = array[1..MaxElem] of integer;

procedure LeeDatos(var VNom: TVS; var VLanzamiento1, VLanzamiento2, VMarca: TVI; var N: byte);
var
  arch: text;
  i: byte;
begin
  assign(arch, 'atletas.txt.txt'); reset(arch);
  readln(arch, N);
  for i := 1 to N do
  begin
    readln(arch, VNom[i]);
    readln(arch, VLanzamiento1[i], VLanzamiento2[i]);
    VMarca[i] := VLanzamiento1[i] + VLanzamiento2[i];
  end;
  Close(arch);
end;

function Superan(VLanzamiento1, VLanzamiento2: TVI; N: byte): integer;
var
  i: byte;
  cont: integer;
begin
  cont := 0;
  for i := 1 to N do
    if VLanzamiento2[i] > VLanzamiento1[i] then
      cont := cont + 1;
  Superan := cont;
end;

function Marca(VNom: TVS; VMarca: TVI; N: byte): st15;
var
  i: byte;
  NombreMax: st15;
  max: integer;
begin
  max := VMarca[1];
  for i := 2 to N do
    if VMarca[i] > max then
    begin
      max := VMarca[i];
      NombreMax := VNom[i];
    end;
  Marca := NombreMax;
end;

function Busca(Nombre: st15; VNom: TVS; N: byte): byte;
var
  i: byte;
begin
  i := 1;
  while (i <= N) and (Nombre <> VNom[i]) do
    i := i + 1;

  if i <= N then
    Busca := i
  else
    Busca := 0;
end;

procedure MuestraMarca(VNom: TVS; VLanzamiento1, VLanzamiento2, VMarca: TVI; N: byte);
var
  pos: byte;
  Nombre: st15;
begin
  write('Ingrese el nombre del atleta que desea mostrar: '); readln(Nombre);
  pos := Busca(Nombre, VNom, N);
  if pos <> 0 then
  begin
    writeln('Atleta ---> ', VNom[pos]);
    writeln('1er Lanzamiento ---> ', VLanzamiento1[pos]);
    writeln('2do Lanzamiento ---> ', VLanzamiento2[pos]);
    writeln('Marca ---> ', VMarca[pos]);
  end
  else
    writeln('NO SE ENCONTRO AL ATLETA.');
end;

procedure GeneraNuevo(X: integer; VNom: TVS; VLanzamiento1, VLanzamiento2, VMarca: TVI; N: byte; var VSemi: TVS; var M: byte);
var
  i: byte;
begin
  M := 0;
  for i := 1 to N do
    if (VLanzamiento1[i] > X) or (VLanzamiento2[i] > X) then
    begin
      M := M + 1;
      VSemi[M] := VNom[i];
    end;
end;

procedure Muestra(VNom, VSemi: TVS; N, M: byte);
var
  i, j: byte;
begin
  write('Atletas: ');
  for i := 1 to N do
    write(VNom[i], ' ');

  writeln;
  write('Atletas que pasaron a la semifinal: ');
  for j := 1 to M do
    write(VSemi[j], ' ');
end;

var
  VNom, VSemi: TVS;
  VLanzamiento1, VLanzamiento2, VMarca: TVI;
  N, M: byte;
  X: integer;
  Nombre: st15;

begin
  LeeDatos(VNom, VLanzamiento1, VLanzamiento2, VMarca, N);
  writeln(Superan(VLanzamiento1, VLanzamiento2, N), ' fueron los jugadores que superaron con el 2do lanzamiento al 1ero.');
  writeln(Marca(VNom, VMarca, N), ' es el jugador que registro la mejor marca.');
  MuestraMarca(VNom, VLanzamiento1, VLanzamiento2, VMarca, N);
  write('Puntaje para pasar a la semifinal ---> '); readln(X);
  GeneraNuevo(X, VNom, VLanzamiento1, VLanzamiento2, VMarca, N, VSemi, M);
  Muestra(VNom, VSemi, N, M);
  readln;
end.

