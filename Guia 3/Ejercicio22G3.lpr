program Ejercicio22G3;
{ A partir de un archivo de texto que contiene palabras separadas entre sí por uno o más blancos
desarrollar un programa para:
a) Mostrar la palabra con más cantidad de vocales del texto.
b) Grabar en un texto de salida las palabras con más de cuatro letras pero escritas al revés.
c) Contar cuántas son palíndromas (capicúas). }

var
  i,j:byte;
  arch1:text;
  palabra, palabra_reverse,palabraMasVocales:string;
  car:char;
  maxVocales,contVocales,contCapicuas:integer;

begin
  assign(Arch1,'pals.txt');reset(Arch1);


  palabra:='';
  palabra_reverse:='';
  maxVocales:=-999;;
  contVocales:=0;
  palabraMasVocales:='';
  contCapicuas:=0;

  while not eof(arch1) do
   begin
     read(arch1,car);
     while (car<>' ') and (not eof(Arch1)) do
      begin
        palabra:=palabra+car;

        read(arch1,car);

      end;

     if (car=' ') or eof(arch1) then
      begin
        for i:=1 to length(palabra) do
         begin
           if  (palabra[i]='a') or (palabra[i]='e') or (palabra[i]='i') or (palabra[i]='o') or (palabra[i]='u') then
            contVocales:=contVocales+1;
         end;

        if contVocales>maxVocales then
         begin
           maxVocales:=contVocales;
           palabraMasVocales:=palabra;
         end;

        for j:=length(palabra) downto 1 do
            palabra_reverse:=palabra_reverse+palabra[j];

        if palabra=palabra_reverse then
            contCapicuas:=contCapicuas+1;

        if length(palabra)>4 then
         writeln(palabra_reverse);


        palabra:='';
        contVocales:=0;
        palabra_reverse:='';
      end;




   end;
  close(Arch1);

  writeln('La palabra con mas vocales es: ',palabraMasVocales);
  writeln('Hay ',contCapicuas,' palabras capicuas');
  readln
end.

