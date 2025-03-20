program Ejercicio12G2;
(* Dado un día (entre 1 y 31) y suponiendo que el día 1 es Lunes, determinar a qué día de la semana
corresponde el número ingresado. *)
var
  dia:byte;


begin
  writeln('Ingrese un dia entre 1 y 31');readln(dia);
  case dia of
             1,8,15,22,29: writeLn('Hoy es lunes');
             2,9,16,23,30: writeLn('Hoy es martes');
             3,10,17,24,31: writeLn('Hoy es miercoles');
             4,11,18,25: writeLn('Hoy es jueves');
             5,12,19,26: writeLn('Hoy es viernes');
             6,13,20,27: writeLn('Hoy es sabado');
             7,14,21,28: writeLn('Hoy es domingo');
         end;
  readln





end.

