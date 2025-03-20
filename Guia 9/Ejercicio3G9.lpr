program Ejercicio3G9;
const
  MAX=100;

type
  st3=String[3];
  st15=string[15];

  TR=record
    codExcursion:st3;
    descripcion:St15;
    precioBase, precioComida:real;
  end;

  TR2= record
     codExcursion:st3;
     numBoleto:byte;
     comida:char;
  end;

  TVst3=array[1..MAX] of st3;

  TA1=file of TR;
  TA2=file of TR2;




procedure LeeExcursiones(var EXCURSIONES:TA1);
var
  arch:text;
  R:TR;
  aux:char;

begin
  assign(Arch,'excursiones.txt');reset(Arch);
  rewrite(EXCURSIONES);

  while not eof(Arch) do
   begin
     with R do
      readln(arch, codExcursion,aux,descripcion,precioBase,precioComida);
     write(EXCURSIONES, R);
   end;
  close(arch);
  close(EXCURSIONES);
end;

procedure LeeExcursiones(var BOLETERIA:TA2);
var
  arch:text;
  R:TR2;
  aux:char;

begin
  assign(Arch,'boleteria.txt');reset(Arch);
  rewrite(BOLETERIA);

  while not eof(Arch) do
   begin
     with R do
      readln(arch, codExcursion,numBoleto,aux,comida);
     write(BOLETERIA, R);
   end;
  close(arch);
  close(BOLETERIA);
end;

procedure lista(var BOLETERIA:TA2);
var
  R:TR2;
  R2:TR;


begin
  assign(EXCURSIONES,'EXCURSIONES.DAT');reset(EXCURSIONES);
  reset(BOLETERIA);

  cantBoletos:=0;


  while not eof(BOLETERIA) do
    begin
      cantBoletos:=cantBoletos+1;
      cantComida:=0;



      seek(EXCURSIONES,R.codExcursion);read(EXCURSIONES, R2.descripcion);
      writeln('Excursión ');
      write(R2.descripcion);

      excursion_Act:=R.codExcursion;
      while(excursion_act=R.codExcursion) do
         begin


         end;


    end;



end;


begin
end.

