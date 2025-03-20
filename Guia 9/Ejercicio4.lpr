program Ejercicio4;
type
  st4=string[4];

  TR=Record
    codArticulo:st4;
    talle:char;
    color:byte;
    cantPrendas:word;
    precioCosto:real;
  end;

  TArch=file of TR;

procedure GrabaStock(var STOCK:TArch);
var
  arch:Text;
  R:TR;
  aux:char;

begin
  assign(Arch,'stock.txt');reset(Arch);
  assign(STOCK,'STOCK.DAT');rewrite(STOCK);

  while not eof(Arch) do
    begin
      with R do
        begin
          read(arch, codArticulo);
          if codArticulo<>'ZZZZ' then
             read(arch,aux,talle,color,cantPrendas,precioCosto);
        end;
      readln(Arch);

      write(STOCK,R);
    end;
  close(arch);
  close(STOCK);

end;

procedure CorteControl(var STOCK:TArch);
var
  R:TR;
  codAct:st4;
  talleAct:char;
  colorAct:byte;
  cantTotal,cantidad,contNegro:word;
  costo:real;

begin
  reset(STOCK);

  cantTotal:=0;
  contNegro:=0;
  read(STOCK, R);
  writeln('                   Stock de Prendas');

  while not eof(STOCK) do
    begin
      codAct:=R.codArticulo;
      writeln('Codigo: ',codAct);
      writeln('Talle                Cantidad                Precio Costo');

      while codAct=R.CodArticulo do
        begin
          talleAct:=R.talle;
          cantidad:=0;
          costo:=0;

          while (talleAct=R.talle) and (codAct=R.codArticulo) do
            begin
              cantidad:=Cantidad+1;
              costo:=costo+R.precioCosto;
              colorAct:=R.color;
              while (colorAct=R.color) and (talleAct=R.talle) and (codAct=R.codArticulo) do
                begin
                  cantTotal:=cantTotal+1;
                  if colorAct=1 then
                    contNegro:=contNegro+1;
                  read(STOCK, R);
                end;
            end;
          writeln(talleAct,'                  ',cantidad,'                 ',costo:4:2);
        end;
    end;
  close(STOCK);
  writeln('Cantidad Total: ',cantTotal);
  writeln('Porcentaje de Prendas Negras: ',contNegro/cantTotal:4:2);


end;

var
  STOCK:TArch;
begin
  GrabaStock(STOCK);
  CorteControl(STOCK);

  readln;
end.

