program ej19;

var
  i:byte;
  max,num:integer;
  arch:text;

begin
  max:=-999;
  i:=1;
  assign(arch, 'numeros.txt');Reset(arch);
  while not eof(arch) do
   begin
     read(arch, num);
     if num>max then
      max:=num;

     if num<0 then
      begin
        if (i<>1) and (max>=0) then
         write(max, ' ');

        max:=-999;
        i:=i+1;
      end;
   end;
  close(arch) ;
  readln
end.

