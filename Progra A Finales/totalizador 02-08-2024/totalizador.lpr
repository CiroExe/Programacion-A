program totalizador;
const
  MAX_PRACTICAS=40;
  MAX_CLIENTES=1000;
type
  st4=string[4];
  st10=string[10];
  st15=string[15];
  st8=string[8];
  st2=string[2];

  TRPracticas=Record
    codPractica:st4;
    descripcion:st10;
    costo:real;
  end;

  TRClientes=Record
    nomCliente:st10;
    telefono:st15;
    cantMascotas:word;
  end;

  TRVeterinaria=Record
    nomCliente:st10;
    nomMascota:st10;
    codPractica:st4;
    fecha:st8;
    alta:char
  end;


  TArchPracticas=file of TRPracticas;
  TArchClientes=file of TRClientes;
  TArchVeterinaria=file of TRVeterinaria;

  TVPracticas=array[1..MAX_PRACTICAS] of TRPracticas;
  TTablaClientes=array[0..MAX_CLIENTES] of st10;

procedure Listado(var VETERINARIA:TArchVeterinaria; var CLIENTES:TArchClientes;Practicas:TVPracticas; TablaClientes:TTablaClientes;var CantPracticas:TVWord);
var
  RV:TRVeterinaria;
  RC:TRClientes;
  error:word;
  i,pos:byte;
  clienteAct,mascotaAct:st10;
  UltimaPractica:st2;
  Importe, ImporteTotal:real;
  Termino:boolean;


begin
  reset(VETERINARIA);
  reset(CLIENTES);


  writeln('Informe del Registro de Prácticas en 2024');
  error:=0;
  while not eof(VETERINARIA) do
        begin
             i:=BuscaCliente(TablaClientes, RV.nomCliente);
             seek(CLIENTES, i);
             read(CLIENTES, RC);
             clienteAct:=RV.nomCliente;
             if(i==-1) then
                 begin
                   error:=error+1;
                   while clienteAct=RV.nomCliente do
                         read(VETERINARIA, RV);
                 end
             else
                 begin
                      writeln('Cliente ', RC.nomCliente,'   Telefono ',RC.telefono);
                      writeln('Mascota     Mes Ultima Practica      Importe Total       Termino algun tratamiento?');
                      ImporteTotal:=0;

                      while clienteAct=RV.nomCliente do
                            begin
                                  mascotaAct:=RV.nomMascota;
                                  Termino:=False;
                                  Importe:=0;
                                  while (mascotaAct=RV.nomMascota) and (clienteAct=RV.nomCliente) do
                                       begin
                                            if (es2024(fecha)) then
                                                begin
                                                   pos:=BuscaPractica(Practicas, RV.codPractica);
                                                   Importe:=Importe+Practicas[pos].costo;
                                                   ImporteTotal:=ImporteTotal+Practicas[pos].costo;
                                                   UltimaPractica:=fecha[5]+fecha[6];
                                                   if RV.alta='S' then
                                                      Termino:=True;
                                                   CantPracticas[pos]=CantPracticas[pos]+1;
                                                end;
                                            read(VETERINARIA, RV);
                                       end;
                                           if Importe<>0 then
                                              begin
                                                 write(RV.nomMascota,'         ',UltimaPractica,'           $', Importe:4:2);
                                                 if Termino then
                                                     writeln('          X');
                                              end;
                              end;
                                writeln('Importe total de todas las practicas: $ ',ImporteTotal:4:2);
                           end;
                 end;
  writeln('Cantidad de Clientes erroneos en el archivo VETERINARIA.DAT: ',error);
  close(VETERINARIA);
  close(CLIENTES);
end;

var
  VETERINARIA::TArchVeterinaria;
  PRACTICAS:TArchPracticas;
  CLIENTES:TArchClientes;
  Practicas:TVPracticas;
  TablaClientes:TTablaClientes;
  CantPracticas:TVWord;


begin
  assign(VETERINARIA,'VETERINARIA.DAT');
  assign(PRACTICAS,'PRACTICAS.DAT');
  assing(CLIENTES,'CLIENTES.DAT');

  CargaVeterinaria(VETERINARIA);
  CargaPracticas(PRACTICAS);
  CargaClientes(CLIENTES);
  CargaVecPracticas(PRACTICAS, Practicas);
  CargaTablaClientes(CLIENTES, TablaClientes);

  Listado(VETERINARIA, CLIENTES, Practicas, TablaClientes, CantPracticas);
  readln;
end.

