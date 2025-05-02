program primerparcial2025;
const
	MAX=100;

type
	//Trabajo con vectores paralelos porque no se ven registros todavia.
	st30 = string[30];
	st20 = string[20];
	TVNombres = array[1..MAX] of st20;
	TVParcial = array[1..MAX] of real;



procedure CargaAlumnos (var Alumnos:TVNombres; var NotasPrimero: TVParcial; var NotasSegundo: TVParcial; var K:byte; X:byte);
var
	arch : text;
	N, inas, i : byte;
	nombre_encriptado: st20;
	nota_primero, nota_segundo: real;



begin
	assign(arch, 'alumnos.txt');reset(arch);
        readln(arch, N);
	//Inicializo indice
	K := 0;

	while not eof(arch) do
		begin
                        readln(arch,nombre_encriptado, inas, nota_primero, nota_segundo);
			if ((inas <= X) and (nota_primero >=5) and (nota_segundo >7)) then
			   begin
                                K := K+1;
				Alumnos[K] := '';
				NotasPrimero[K] := nota_primero;
				NotasSegundo[K] := nota_segundo;
				i :=N+1; // Mejor inicializar i en los saltos que hay que dar en el nombre encriptado.
				while ((i <= length(nombre_encriptado)) and (nombre_encriptado[i] <> '.') and (nombre_encriptado[i] <> ' '))do
			  	    begin
					Alumnos[K] := Alumnos[K] + lowercase(nombre_encriptado[i]);
					i := i + (N+1);
				    end;
			   end;

		end;
	close(arch);
end;



function IncisoA (NotasPrimero, NotasSegundo:TVParcial; K:byte):real;
var
	i:byte;
	contDesaprobaronPrimero, contDesaprobaronAsignatura : byte;


begin
        contDesaprobaronPrimero:=0;contDesaprobaronAsignatura:=0;
	for i:=1 to K do
		begin
			if ((NotasPrimero[i] < 5) and (NotasSegundo[i] >7)) then
				contDesaprobaronPrimero := contDesaprobaronPrimero+1
			else
				if ((NotasPrimero[i] < 5) and (NotasSegundo[i] <= 7)) then
					contDesaprobaronAsignatura := contDesaprobaronAsignatura+1;
		end;

	if contDesaprobaronAsignatura <> 0 then
		IncisoA := contDesaprobaronPrimero / contDesaprobaronAsignatura //Lo muestro en PP
	else
		IncisoA := 0;

end;

procedure IncisoB (Alumnos:TVNombres; NotasPrimero, NotasSegundo:TVParcial; K:byte);
var
	i:byte;
	Supera : Boolean;
	nombreSupera :st20;


begin
	i := 1;
	Supera := false;

	while ((i <= K) and (not(Supera))) do
		begin
			if ((NotasPrimero[i] >= 5) and (NotasSegundo[i]>=7)) then
				if (NotasSegundo[i] >= NotasPrimero[i]*1.2) then
					begin
						Supera := true;
						nombreSupera := Alumnos[i];
					end;
			i := i+1;
		end;

	if Supera then
		writeln('Uno de los alumnos que cumplio con la condicion fue -> ', nombreSupera)
	else
		writeln('No hay alumnos que cumplan esta condicion');

end;


procedure IncisoC(Alumnos:TVNombres; NotasPrimero, NotasSegundo:TVParcial; K:byte);
var
	i:byte;
	max, maxAnt, prom:real;
	MaxProm, MaxPromAnt : st20;



begin
	max := -1;
	for i:=1 to K do
		begin
			if ((NotasPrimero[i]>=5) and (notasSegundo[i]>7)) then
				begin
					prom := (NotasPrimero[i] + NotasSegundo[i]) / 2;
					if (prom > max) then
						begin
							maxAnt := max;
							max := prom;
							MaxPromAnt := MaxProm;
							MaxProm := Alumnos[i];

						end;
				end;
		end;
	writeln(MaxProm,' y ', MaxPromAnt,'Fueron los alumnos con mayor promedio de los que aprobaron la asignatura');
end;

//PP
var
	Alumnos : TVNombres;
	NotasPrimero, NotasSegundo: TVParcial;
	K, X:byte;


begin
	writeln('Ingrese cantidad maxima de inasistencias');
	readln(X);
	CargaAlumnos(Alumnos, NotasPrimero, NotasSegundo, K, X);

	//Inciso a
	writeln('El promedio de los que desaprobaron el primer parcial por sobre los que desaprobaron la asignatura fue -> ', IncisoA(NotasPrimero, NotasSegundo, K):4:2);

	//Inciso b
	IncisoB(Alumnos, NotasPrimero, NotasSegundo, K);

	//IncisoC
	IncisoC(Alumnos, NotasPrimero, NotasSegundo,K);
        readln;

end.

