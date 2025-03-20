program Ejercicio17G3;
{ La cajera de un supermercado ha registrado varias ventas, de cada una sabe:
 Nombre del cliente ( “ ***** “ indica fin de datos )
 Cantidad de artículos que compró el cliente y por cada uno se conoce:
- Precio base del artículo
- Si está o no en promoción ( ‘S’ ó ‘N’ )
En el caso de estar en promoción, se realiza un descuento del 10% sobre el precio base.
Se pide ingresar los datos e informar:
a) Monto total de cada venta, el total del descuento y el precio final a pagar.
b) Nombre del cliente que compró la mayor cantidad de artículos en oferta.
c) Cuántos clientes compraron solo artículos en oferta. }

type
  st10=string[10];

var
  i,productos:byte;
  Nombre,NombreMaxOfertas:st10;
  Monto, descuento, precio_Final, precio_base:Real;
  promocion:Char;
  contMax, contOfertas,contClientes:integer;

begin
  write('Nombre del cliente ----> ("***" FIN DE DATOS)');readln(Nombre);

  contMax:=-9999;
  contClientes:=0;
  while Nombre<>'***' do
   begin
     write('Cantidad de productos: ');Readln(productos);
     monto:=0;
     contOfertas:=0;
     descuento:=0;

     for i:=1 to productos do
      begin
        write('Ingrese precio del producto ',i,' ');readln(precio_base);
        monto:=monto+precio_base;

        write('El producto esta en oferta? (S/N)');readln(promocion);
        if promocion='S' then
         begin
           contOfertas:=contOfertas+1;
           descuento:=descuento+(precio_base*0.10);
         end;

      end;
     precio_final:=monto-descuento;

     if contOfertas>contMax then
      begin
        contMax:=contOfertas;
        NombreMaxOfertas:=Nombre
      end;

     if contOfertas=productos then
      contClientes:=contClientes+1;

     writeln('Monto total: $',monto:4:2);
     writeln('Descuento total: $', descuento:4:2);
     writeln('Precio final a Pagar: $', precio_final:4:2);

     write('Nombre del cliente ----> ("***" FIN DE DATOS)');readln(Nombre);

   end;
  writeln(NombreMaxOfertas,' compro mas articulos en oferta');
  writeln(contClientes,' clientes compraron solo articulos en oferta');
  readln
end.

