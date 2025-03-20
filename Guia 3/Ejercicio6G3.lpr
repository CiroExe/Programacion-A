program Ejercicio6G3;
(* Se conoce el saldo inicial de una cuenta bancaria y una serie de movimientos realizados, por cada
uno:
 - código de movimiento (D=depósito, R=retiro ó F= fin de datos).
 - monto
Escribir un programa que ingrese dichos datos y determine el saldo exacto de la cuenta después de
procesar las transacciones. Al final del proceso indique cuantas veces no pudo retirar dinero por
insuficiencia de fondos. *)
var

  Saldo_Inicial, Monto, Saldo_Final:real;
  cont_error:byte;
  Codigo:Char;



begin
  cont_error:=0;
  write('Ingrese el saldo inicial de la cuenta ');readln(Saldo_Inicial);
  write('Ingrese Codigo de movimiento(D=depósito, R=retiro o F=fin de datos)');readln(Codigo);
  while Codigo<>'F' do
   begin
    (*case Codigo of
    'D':write('Ingrese el monto a depositar: ');readln(Monto);
    'R':write('Ingrese el monto a retirar');readln(Monto);
    end;         *)

    if Codigo='D' then
     begin
      write('Ingrese el monto a depositar: ');readln(Monto);
      Saldo_Final:=Saldo_Inicial+Monto;
     end
    else if Codigo='R' then
          begin
           write('Ingrese el monto a retirar: ');readln(Monto);
           if Monto>Saldo_Inicial then
            begin
             cont_error:=cont_error+1;
             writeln('No se pudo realizar el movimiento');
            end
           else
            Saldo_Final:=Saldo_Inicial-Monto;
           end;





    write('Ingrese Codigo de movimiento(D=depósito, R=retiro o F=fin de datos)');readln(Codigo);
   end;
  writeln('El saldo final de la cuenta luego de realizar los movimientos es de: $',Saldo_Final:4:2);
  writeln('No se pudo retirar dinero ', cont_error,' veces.');
  readln()
end.

