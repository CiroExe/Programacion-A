program Ejercicio2G3;
(* Se debe liquidar el sueldo de N empleados, de ellos se sabe el nombre y la antigüedad en años.
Todos parten de un básico de $15000 y la antigüedad se calcula según la siguiente tabla:
- Hasta 5 años …………. 5%
- De 6 a 10 años……….. 8%
- De 11 a 15 años…….. 12%
- Más de 15 años …… 20%
Además se descuenta un 11% por cargas sociales y $500 por seguro obligatorio.
Calcular e informar:
a) Nombre y sueldo de cada empleado.
b) Nombre del empleado que más cobra (suponer que es único).
c) Monto del sueldo promedio. *)
const
  Sueldo_Basico=15000;
  Seguro_Obligatorio=500;

type
  str10=string[10];

var
  Nombre,Nombre_Max_Sueldo:str10;
  anios, N,i:byte;
  antiguedad, descuento,Suma_Sueldos,Sueldo_Bruto,Sueldo_Neto,Max_Sueldo,Prom:real;



begin
  write('Ingrese la cantidad de empleados ');readln(N);

  Max_Sueldo:=-1;
  Suma_Sueldos:=0;
  for i:=1 to N do
   begin
     write('Nombre: ');readln(Nombre);
     write('Años antiguedad: ');readln(anios);
     case anios of
     1..5: Antiguedad:=Sueldo_Basico*0.05 ;
     6..10: Antiguedad:=Sueldo_Basico*0.08 ;
     11..15: Antiguedad:=Sueldo_Basico*0.12 ;
     16..30: Antiguedad:=Sueldo_Basico*0.2 ;
     end;

     Sueldo_Bruto:=Sueldo_Basico+Antiguedad;
     Descuento:= Sueldo_Bruto*0.11;
     Sueldo_Neto:=Sueldo_Bruto-Descuento-Seguro_Obligatorio;

     writeln('El empleado ',Nombre,' cobra un sueldo neto de ', Sueldo_Neto:4:2,' Pesos');

     if Sueldo_Neto>Max_Sueldo then
      begin
       Max_Sueldo:=Sueldo_Neto;
       Nombre_Max_Sueldo:=Nombre;
      end;


     Suma_Sueldos:=Suma_Sueldos+Sueldo_Neto;
   end;

  writeln(Nombre_Max_Sueldo,' es el empleado que mas cobra');

  Prom:=Suma_Sueldos/N;
  writeln('El monto del sueldo promedio es de ', Prom:4:2,' Pesos');
  readln()



end.

