program ej4;
const
  MAX=100;

type
  st4=string[4];

  TRStock=Record
    codArt:st4;
    talle:char;
    color:byte;
    cantPrendas:word;
    precioCosto:real;
  end;


  TArchStock=file of TRStock;

procedure CargaSTOCK(var STOCK:TArchStock);
var
  arch:text;
  RS:TRStock;
  aux:char;
begin
  rewrite(STOCK);
  assign(arch,'STOCK.txt');reset(arch);
  while not eof(arch) do
        begin
          readln(arch, RS.codArt, aux, RS.talle, RS.color, RS.cantPrendas, RS.precioCosto);
          write(STOCK, RS);
        end;
  close(arch);close(STOCK);
end;

procedure MuestraStock(var STOCK:TArchStock);
var
  RS:TRStock;

begin
  reset(STOCK);

  while not eof(STOCK) do
        begin
             read(STOCK, RS);
             writeln(RS.codArt,'    ',RS.talle,'       ',RS.color);
        end;
  close(STOCK);
end;

procedure Listado(var STOCK:TArchStock);
var
  RS:TRStock;
  codAct:st4;
  talleAct:char;
  cant,cantTotal, contNegras:word;
  costo:real;

begin
  reset(STOCK); read(STOCK, RS);

  writeln('                Stock de Prendas');
  cantTotal:=0;
  contNegras:=0;
  while not eof(STOCK) do
        begin
             writeln('Codigo: ',RS.codArt);
             writeln('TALLE         CANTIDAD          PRECIO COSTO');
             codAct:=RS.codArt;
             while (codAct=RS.codArt)  do
                   begin
                        cant:=0;
                        costo:=0;
                        talleAct:=RS.talle;
                        while (talleAct = RS.talle) and (codAct=RS.codArt)  do
                              begin
                                   if RS.color=1 then
                                      contNegras:=contNegras+RS.cantPrendas;
                                   costo:=costo+(RS.cantPrendas*RS.precioCosto);
                                   cant:=cant+RS.cantPrendas;
                                   read(STOCK, RS);
                              end;
                        writeln(talleAct,'                  ', cant,'              $',costo:4:2);
                        cantTotal:=cantTotal+cant;
                   end;
        end;
  close(STOCK);
  writeln('Cantidad Total: ',cantTotal);
  writeln('Porcentaje de Prendas Negras: ', (contNegras/cantTotal)*100:4:2);
end;

var
  STOCK:TArchStock;
begin
  assign(STOCK, 'STOCK.DAT');
  CargaSTOCK(STOCK);
  MuestraStock(STOCK);
  Listado(STOCK);
  readln;
end.

