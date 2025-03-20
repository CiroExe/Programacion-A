program Ejercicio11G4;
{ Dada la ecuación de una parábola y = ax^2 + bx + c, escribir un programa que mediante un menú de
opciones iterativo permita:
a) Encontrar el eje de simetría, sabiendo que x1 = -b/(2*a) y si presenta un mínimo o un máximo en f(x1).
b) Informar hacia dónde es abierta la parábola.
c) Calcular y mostrar las raíces, informar en caso que no existan. Para ello debe analizar si el
discriminante, D = b^2 – 4ac, es mayor, menor o igual a cero.
d) Dado un conjunto de valores de x informar su imagen.
}

function incisoA(a, b: integer): real;
begin
  incisoA := -b / (2 * a);
end;

function incisoB(a: integer): string;
begin
  if a > 0 then
    incisoB := 'Arriba'
  else
    incisoB := 'Abajo';
end;

procedure incisoC(a, b, c: integer; var r1, r2: real);
var
  Discriminante: integer;
begin
  Discriminante := sqr(b) - 4 * a * c;
  if Discriminante < 0 then
    writeln('No existen raíces reales')
  else
  begin
    r1 := (-b + sqrt(Discriminante)) / (2 * a);
    r2 := (-b - sqrt(Discriminante)) / (2 * a);
  end;
end;

function incisoD(x, a, b, c: integer): integer;
begin
  incisoD := (a * sqr(x)) + (b * x) + c;
end;

procedure Menu(var opcion: char);
begin
  repeat
    writeln('Ingrese una opción:');
    writeln('1 - Encontrar el eje de simetría');
    writeln('2 - Calcular concavidad');
    writeln('3 - Calcular y mostrar las raíces');
    writeln('4 - Calcular imagen');
    writeln('5 - Salir');
    write('Opción: ');
    readln(opcion);
  until (opcion >= '1') and (opcion <= '5');
end;

var
  x, a, b, c: integer;
  r1, r2: real;
  opcion: char;

begin
  writeln('Ingrese el coeficiente principal (a) de la función cuadrática: '); readln(a);
  writeln('Ingrese el segundo coeficiente (b) de la función cuadrática: '); readln(b);
  writeln('Ingrese la constante (c) de la función cuadrática: '); readln(c);

  repeat
    Menu(opcion);

    case opcion of
      '1': writeln('El eje de simetría es: ', incisoA(a, b):0:2);
      '2': writeln('La parábola es abierta hacia ', incisoB(a));
      '3': begin
             incisoC(a, b, c, r1, r2);
             if r1 = r2 then
               writeln('La raíz es ', r1:0:2)
             else
               writeln('Las raíces son ', r1:0:2, ' y ', r2:0:2);
           end;
      '4': begin
             write('Ingrese el valor de x: '); readln(x);
             writeln('La imagen de la función es: ', incisoD(x, a, b, c));
           end;
    end;

  until opcion = '5';

  writeln('Fin del programa.');
  readln();
end.


