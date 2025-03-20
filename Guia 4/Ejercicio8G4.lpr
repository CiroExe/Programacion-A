program Ejercicio8G4;

type
  st10 = string[10];

function Descuento(tipoCompra: char; Monto: real; diaCompra: byte): real;
begin
  case tipoCompra of
    'C': if (diaCompra >= 15) and (diaCompra <= 31) then
           Descuento := Monto * 0.1
         else
           Descuento := 0;
    'O': if (diaCompra = 10) or (diaCompra = 20) or (diaCompra = 30) then
           if Monto > 300 then
             Descuento := Monto * 0.05
           else
             Descuento := 0;
    'S': if (diaCompra >= 1) and (diaCompra <= 14) then
           Descuento := Monto * 0.15
         else
           Descuento := 0;
  else
    Descuento := 0;
  end;
end;

var
  arch: Text;
  codCliente: st10;
  diaCompra, Monto, i, N: integer;
  totalAbonado, desc, totalAhorrado: real;
  tipoCompra: char;
  contNingunDesc, contTodos, contS, contC, contO, cantCompras: integer;

begin
  assign(arch, 'compras.txt');
  reset(arch);

  readln(arch, N);  { Leer el número de clientes }
  contNingunDesc := 0;
  contTodos := 0;

  for i := 1 to N do
  begin
    readln(arch, codCliente);  { Leer código del cliente }
    totalAhorrado := 0;        { Reinicializar totales para cada cliente }
    totalAbonado := 0;
    cantCompras := 0;
    contS := 0;
    contC := 0;
    contO := 0;

    read(arch, tipoCompra);
    tipoCompra := upcase(tipoCompra);

    while tipoCompra <> 'F' do
    begin
      cantCompras := cantCompras + 1;
      readln(arch, diaCompra, Monto);
      desc := Descuento(tipoCompra, Monto, diaCompra);
      totalAbonado := totalAbonado + Monto;

      if desc = 0 then
        contNingunDesc := contNingunDesc + 1
      else
        totalAhorrado := totalAhorrado + desc;

      case tipoCompra of
        'S': contS := contS + 1;
        'C': contC := contC + 1;
        'O': contO := contO + 1;
      end;

      read(arch, tipoCompra);
      tipoCompra := upcase(tipoCompra);
    end;

    readln(arch);  { Avanzar a la siguiente línea para el próximo cliente }

    writeln('Código del Cliente: ', codCliente);
    writeln('Total Abonado: $', totalAbonado:4:2);
    writeln('Total Ahorrado: $', totalAhorrado:4:2);

    if (contS > 0) and (contC > 0) and (contO > 0) then
      contTodos := contTodos + 1;
  end;

  close(arch);

  if contTodos <> 0 then
    writeln(contTodos, ' fueron la cantidad de clientes que obtuvieron descuentos en los tres rubros.')
  else
    writeln('Ningún cliente obtuvo descuento en los tres rubros.');

  readln;
end.

