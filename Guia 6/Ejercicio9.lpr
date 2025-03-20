program Ejercicio9;
const
  max=100;

type
  TMC=array[1..max,1..max] of char;
  TMW=array[1..max,1..max] of word;


procedure GeneraMats(var T1:TMC;var T2:TMW;var N:byte);
var
  i,j:byte;

begin
  write('Ingrese cantidad de filas y columnas (NxN) ---> ');readln(N);
  for i:=1 to N do
   for j:=1 to N do
    begin
      write('Ingrese color de la ficha para la fila ',i,' columna ',j,' ');Readln(T1[i,j]);
      write('Ingrese cantidad de fichas del color ',T1[i,j],' en dicha posicion.');readln(T2[i,j]);
    end;
end;

procedure Muestra(T1:TMC;T2:TMW;N:byte);
var
  i,j:byte;
begin
  for i:=1 to N do
   begin
    for j:=1 to N do
     begin
      write(T1[i,j],' ');
      write('  ',T2[i,j],' ');
     end;
    writeln;
   end;

end;

function predominante(T1:TMC;N:byte):char;
var
  i,j:byte;
  contR,contA:word;
begin
  contR:=0;contA:=0;
  for i:=1 to N do
   for j:=1 to N do
    begin
     if T1[i,j]='R' then
      contR:=contR+1
     else
       contA:=contA+1;
    end;

  if contA>contR then
   predominante:='A'
   else
     predominante:='R';


end;

function acumFichas(T1:TMC;T2:TMW;N:byte):char;
var
  i,j:byte;
  acumR,acumA:word;

begin
  acumR:=0;acumA:=0;
  for i:=1 to N do
   for j:=1 to N do
    begin
     if T1[i,j]='A' then
      acumA:=acumA+T2[i,j]
     else
       acumR:=acumR+T2[i,j];

    end;

  if acumR>acumA then
   acumFichas:='R'
  else
    acumFichas:='A';



end;

procedure CantColumnas(T1:TMC;N:byte);
var
  i,j:byte;
  cant,contA,contR:word;

begin
  cant:=0;contA:=0;contR:=0;
  for j:=1 to N do
   begin
     for i:=1 to N do
      begin
       if T1[i,j]='A' then
        contA:=contA+1
       else
         if T1[i,j]='R' then
          contR:=contR+1;
      end;
     if (contA=N) or (contR=N) then
      cant:=cant+1

   end;

  writeln('Cantidad de columnas de un solo color ---> ',cant);


end;
var
  T1:TMC;
  T2:TMW;
  N:byte;


begin
  GeneraMats(T1,T2,N);
  writeln('Color mas predominante ---> ',predominante(T1,N));
  writeln('Color con mas fichas ---> ', acumFichas(T1,T2,N));
  cantColumnas(T1,N);
  readln
end.

