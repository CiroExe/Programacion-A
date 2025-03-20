program Ejercicio7;
type
  st4=String[4];
  st3=string[3];
  st15=string[15];

  TR=Record
    codCine:st4;
    zona:byte;
    capacidad:word;
  end;

  TR2= Record
    codCine:st4;
    codPelicula:st4;
    localidadesVendidas:word;
  end;

  TR3= Record
    codPelicula:st4;
    nomPelicula:st15;
    duracion:real;
  end;

  TTabla=array[0..1000] of TR3;

  TArch=file of TR;
  TArch2=file of TR2;


procedure GrabaCines(var CINES:TArch);
var
  R:TR;
  arch:Text;

begin
  assign(arch,'cines.txt');reset(Arch);
  rewrite(CINES);

  while not eof(arch) do
    begin
      with R do
        begin
          read(arch,codCine);
          if codCine<>'ZZZZ' then
            readln(arch,zona,capacidad);

        end;
      write(CINES, R);
    end;
  close(Arch);
  close(CINES);
end;

procedure GrabaProyecciones(Var PROYECCIONES:TArch2);
var
  R2:TR2;
  arch:Text;
  aux:Char;
begin
  assign(Arch,'proyecciones.txt');reset(Arch);
  rewrite(PROYECCIONES);

  while not eof(arch) do
    begin
      with R2 do
        begin
          read(arch,codCine);
          if codCine<>'ZZZZ' then
            readln(arch,aux,codPelicula,localidadesVendidas);
        end;
      write(PROYECCIONES,R2);
    end;
  close(arch);
  close(PROYECCIONES);
end;

{procedure GeneraTabla(var Tabla:TTabla;var N:byte);
var
  arch:Text;
  R3:TR3;
  aux:char;



begin
  assign(arch,'peliculas.txt');reset(Arch);
  N:=0;

  while not eof(Arch) do
    begin
      with R3 do
        begin
          readln(Arch,Tabla[N].codPelicula,aux,Tabla[N].nomPelicula,Tabla[N].duracion);
        end;
      N:=N+1;
    end;
  close(Arch);
end; }

function BuscaTabla(Tabla:TTabla;codPelicula:st4;N:byte):byte;
var
  i:byte;
begin
  i:=0;
  while Tabla[i].codPelicula<>codPelicula do
    i:=i+1;

  if i<N then
    BuscaTabla:=i
  else
    BuscaTabla:=0;
end;

procedure Enfrenta(var CINES:TArch;var PROYECCIONES:TArch2;Tabla:TTabla);
var
  R:TR;
  R2:TR2;
  cant_peliculas, cant_funciones,totalVendido,cant_noProyecto:word;

begin
  reset(CINES);
  reset(PROYECCIONES);

  read(CINES, R);
  read(PROYECCIONES, R2);

  cant_noProyecto:=0;
  writeln('Cine       Cant.Peliculas        Cant.funciones        Total Loc.Vendidas        %Ocup.Promedio');
  while (not eof(CINES)) or (not eof(PROYECCIONES)) do
     begin
       if R.codCine=R2.codCine then
         begin
           cant_peliculas:=0;
           cant_funciones:=0;
           totalVendido:=R2.localidadesVendidas;
           write(R.codCine);
           while R.codCine=R2.codCine do
             begin
               totalVendido:=totalVendido+R2.localidadesVendidas;
               cant_peliculas:=cant_peliculas+1;
               cant_Funciones:=cant_funciones+1;
               read(PROYECCIONES, R2);
             end;
           writeln('           ',cant_peliculas,'                               ',cant_funciones,'           ',totalVendido,'             %',R.capacidad/totalVendido*100:4:2);
           read(CINES, R);
         end
       else
          if R.codCine<R2.codCine then         //No se proyectó ninguna pelicula
            begin
              cant_noProyecto:=cant_noProyecto+1;
              read(CINES,R);
            end
       else
          read(PROYECCIONES,R2)

     end;
  close(CINES);
  close(PROYECCIONES);

  writeln('Cantidad de cines que no proyectaron ninguna pelicula: ',cant_noProyecto);

end;



var
  CINES:TArch;
  PROYECCIONES:TArch2;
  N:byte;
  Tabla:TTabla;

begin
  assign(CINES,'CINES.DAT');
  GrabaCines(CINES);
  assign(PROYECCIONES,'PROYECCIONES.DAT');
  GrabaProyecciones(PROYECCIONES);
 // GeneraTabla(Tabla,N);
  Enfrenta(CINES,PROYECCIONES,Tabla);

  readln;
end.

