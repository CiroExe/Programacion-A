program Ejercicio8G4;

type
  st10=string[10];


function Descuento(tipoCompra:char;Monto:real;diaCompra:byte):real;
begin
  case tipoCompra of
  'C':begin
        if (diaCompra>=15) and (diaCompra<=31) then
         Descuento:=Monto*0.1;
      end;
  'O': begin
         if (diaCompra=10) or (diaCompra=20) or (diaCompra=30) then
         begin
           if Monto>300 then
             Descuento:=Monto*0.05;
         end;
       end;
  'S': begin
         if(diaCompra>=1) and (diaCompra<=14) then
          Descuento:=Monto*0.15

       end;
  else
    Descuento:=0;
  end;
end;







var
  arch:Text;
  codCliente:st10;
  diaCompra,N,Monto:integer;
  totalAbonado,desc, totalAhorrado:real;
  tipoCompra:char;
  contNingunDesc,contTodos, contS,contC,contO,cantCompras:integer;



begin
 assign(arch, 'compras.txt');Reset(Arch);
 contNingunDesc:=0;
 contTodos:=0;
 readln(Arch, N);
 while not eof(arch) do
  begin
    readln(arch,codCliente);
    read(arch, tipoCompra);
    tipoCompra:=upcase(tipoCompra);
    contS:=0;
    contC:=0;
    contO:=0;
    totalAhorrado:=0;
    totalAbonado:=0;
    cantCompras:=0;
    while tipoCompra<>'F' do
     begin
       cantCompras:=cantCompras+1;
       ReadLn(arch, diaCompra, Monto);
       desc:=Descuento(tipoCompra,Monto,diaCompra);
       totalAbonado:=totalAbonado+Monto;

       if desc=0 then
        begin
         contNingunDesc:=contNingunDesc+1;
        end
       else
        begin
         totalAhorrado:=totalAhorrado+desc;
        end;

       case tipoCompra of
       'S':contS:=contS+1;
       'C':contC:=contC+1;
       'O':contO:=contO+1;
       end;

       read(arch, tipoCompra);

     end;
    readln(Arch);
   // if contNingunDesc=cantCompras then
   //  begin
          writeln('Codigo del Cliente: ', codCliente);
          writeln('Total Abonado: $', totalAbonado:4:2);
          writeln('Total Ahorrado: $', totalAhorrado:4:2);
   //  end;

    if (contS>=1) or(contC>=1) or (contO>=1) then
     contTodos:=contTodos+1;
  end;
 close(Arch);
 if contTodos<>0 then
  writeln(contTodos, ' fueron la cantidad de clientes que obtuvieron descuentos en los tres rubros')
 else
   writeln('Ningun cliente obtuvo descuento en los tres rubros');

 readln

end.

