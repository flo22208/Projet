with Ada.Command_Line;     use Ada.Command_Line;
with Ada.strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

procedure traiter_argument(alpha : out float; k : out integer; epsilon : out float; algo : out string; prefixe : out string)  is

  i : Integer := 1;
  error_alpha_oof : exception;
  error_mauv_ent : exception;

begin 
  -- initialiser aux valeurs par défault 
  alpha := 0.85;
  k:= 150;
  epsilon:= 0.0;
  algo:= "c"; -- par défault creuse mais pour la première partie on fera en pleine
  prefixe := "output";


  --boucle while afin de pouvoir faire des pas de 2 ou de 1 en fonction des cas
  while (i < ( argument_count-1 )) loop
  
    --pbl avec le case,il veut un argument discret donc qui ne prend pas une infité de valeur
      if to_unbounded_string("-A") = to_unbounded_string(argument(i)) then 
      	if float'Value(argument(i+1))<0.0 or float'Value(argument(i+1))>1.0 then 
        	raise Error_alpha_OOF;
      	end if;
      	alpha := float'Value(argument(i+1));
      	i := i+2;
      elsif to_unbounded_string("-K") = to_unbounded_string(argument(i)) then
       k := Integer'Value(argument(i+1));
       i:= i+2;
      elsif to_unbounded_string("-E") = to_unbounded_string(argument(i)) then 
       epsilon := float'Value(argument(i+1));
       i:= i+2;
      elsif to_unbounded_string("-P") = to_unbounded_string(argument(i)) then 
       algo := "p";
       i:= i+1;
      elsif to_unbounded_string("-C") = to_unbounded_string(argument(i)) then
       algo := "C";
       i:= i+1;
      elsif to_unbounded_string("-R") = to_unbounded_string(argument(i)) then 
       prefixe := argument(i+1);
       i:= i+2;
      else 
       raise Error_mauv_ent;
    end if;
  end loop;
  exception 
  when Error_alpha_OOF => Put("Alpha doit être entre 0 et 1, il prendra une valeur de défault égale a 0.85 ici "); 
  when Error_mauv_ent => Put_Line(" veuillez rentrer quelque chose de la forme -P ou -K 40, les valeurs seront prise par défault ");
end traiter_argument;
  
