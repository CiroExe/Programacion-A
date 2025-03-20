program Ejercicio7G3;
(* ) Dado un conjunto de alumnos, no se sabe cuántos son, de cada uno de ellos se conoce:
- Nombre (‘***’ indica fin de datos)
- Nota1, Nota2 y Nota3
Ingresar la información e informar:
a) El promedio de cada alumno y su condición:
 − ‘Aprobado’ si su promedio es mayor o igual a 4
− ‘Desaprobado’ si su promedio es menor a 4.
 b) Porcentaje de alumnos Aprobados*)
type
  st10=string[10];

var
  Nombre:st10;
  Nota1,Nota2,Nota3,cont_alumnos, cont_aprobados:byte;
  prom:real;
  porcentaje_aprobados:real;

begin
  cont_alumnos:=0;
  cont_aprobados:=0;
  write('Ingrese nombre del alumno (*** para finalizar): ');Readln(Nombre);
  while Nombre<>'***' do
   begin
     cont_alumnos:=cont_alumnos+1;

     writeln('Ingrese Nota 1: ');readln(Nota1);
     writeln('Ingrese Nota 2: ');readln(Nota2);
     writeln('Ingrese Nota 3: ');readln(Nota3);

     prom:=(Nota1+Nota2+Nota3)/3;

     if prom<4 then
      writeln('El alumno esta desaprobado')
     else if prom>4 then
            begin
              writeln('El alumno esta aprobado');
              cont_aprobados:=cont_aprobados+1;
            end;


     write('Ingrese nombre del alumno (*** para finalizar): ');Readln(Nombre);
   end;
  writeln(cont_Aprobados,' ', cont_alumnos);
  porcentaje_aprobados:=(cont_aprobados*100) div cont_alumnos;
  writeln(porcentaje_aprobados:0:2,' es el porcentaje de alumnos aprobados');
  readln()
end.


