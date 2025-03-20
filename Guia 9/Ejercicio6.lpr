program Ejercicio6;
type
  st4=string[4];
  st15=string[15];
  TR= Record
    legajo:st4;
    nomyap:st15;
    totalVentas:real;
    numFactura:word;
    importeMayor:real;
  end;

  TR2=Record
    legajo:st4;
    numFactura:word;
    importe:real;
  end;

  TArch=file of TR;
  TArch2=file of TR2;

procedure GrabaVendedores(var VENDEDORES:TArch);
var
  arch:Text;
  R:TR;
  aux:Char;

begin
  assign(Arch,'vendedores.txt');Reset(arch);
  assign(VENDEDORES,'VENDEDORES.DAT');rewrite(VENDEDORES);

  while not eof(arch) do
    begin
      with R do
        begin
          read(Arch,legajo);
          if legajo<>'9999' then
             readln(arch,aux,nomyap,totalVentas,numFactura,importeMayor);
        end;
      write(VENDEDORES, R)
    end;
  close(VENDEDORES);
end;

procedure GrabaVentas(var VENTAS:TArch2);
var
  arch:Text;
  R2:TR2;

begin
  assign(Arch,'ventas.txt');reset(arch);
  assign(VENTAS,'VENTAS.DAT');rewrite(VENTAS);

  while not eof(arch) do
    begin
      with R2 do
        begin
          read(arch, legajo);
          if legajo<>'9999' then
            readln(arch,numFactura,importe);
        end;
      write(VENTAS,R2);
    end;
  close(VENTAS);
end;

procedure Enfrentamiento(var VENDEDORES:TArch;var VENTAS:TArch2;var Temp:TArch;nombre:st15);
var
  R:TR;
  R2:TR2;

begin
  assign(Temp,'Temp.DAT');rewrite(Temp);
  reset(VENDEDORES);
  reset(VENTAS);

  read(VENTAS,R2);
  read(VENDEDORES,R);

  writeln('Empleado        Comision');
  while not eof(VENDEDORES) or not eof(VENTAS) do
    begin
      if R.legajo<R2.legajo then
         begin
           write(Temp,R);
           writeln(R.nomyap,'       $',R.totalVentas*0.005:4:2);
           read(VENDEDORES, R);
         end
      else
       begin
        if R.legajo=R2.legajo then
           begin
             R.totalVentas:=R.totalVentas+R2.importe;
             if R2.importe>R.importeMayor then
               begin
                R.importeMayor:=R2.importe;
                R.numFactura:=R2.numFactura;
               end;
           end;
        read(VENTAS,R2);
       end;
    end;
  close(VENDEDORES);close(VENTAS);close(Temp);
  erase(VENDEDORES);
  Rename(TEMP, nombre);

end;

var
  VENDEDORES:TArch;
  VENTAS:TArch2;
  Temp:TArch;
  nombre:St15;

begin
  GrabaVendedores(VENDEDORES);
  GrabaVentas(VENTAS);
  readln(nombre);
  Enfrentamiento(VENDEDORES,VENTAS,Temp,nombre);

  readln ;
end.

