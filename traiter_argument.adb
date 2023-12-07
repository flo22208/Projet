with Ada.Command_Line;     use Ada.Command_Line;
with Ada.strings.Unbounded; use Ada.Strings.Unbounded;

procedure traiter_argument is
  alpha : float := 0.85;
  k : Integer := 150;
  epsilon : float := 0.0;
  algo :string := "c"; -- par défault creuse mais pour la première partie on fera en pleine
  prefixe : string := "output";
  i : Integer := 1; 

  -- pas encore robuste
begin 
  --boucle while afin de pouvoir faire des pas de 2 ou de 1 en fonction des cas
  while i <(argument_count-1) loop
    --pbl avec le case,il veut un argument discret donc qui ne prend pas une infité de valeur
    case to_unbounded_string(argument(i)) is
      when to_unbounded_string("-A") =>
      if float'Value(argument(i+1))<0 or float'Value(argument(i+1))>1 then 
        raise Error_alpha_OFR;
      end if;
      alpha := float'Value(argument(i+1));
      i := i+2;
      when to_unbounded_string("-K") => k := Integer'Value(argument(i+1));
      i:= i+2;
      when to_unbounded_string("-E") => epsilon := Integer'Value(argument(i+1));
      i:= i+2;
      when to_unbounded_string("-P") => algo := "p";
      i:= i+1;
      when to_unbounded_string("-C") => algo := "C";
      i:= i+1;
      when to_unbounded_string("-R") => prefixe := argument(i+1);
      i:= i+2;
      when others => Put_Line(" veuillez rentrer quelque chose de la forme -P ou -K 40 ");
    end case;
  end loop;
end traiter_argument;
  
