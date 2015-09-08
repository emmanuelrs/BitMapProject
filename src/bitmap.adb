-------------------------------------------------------------------------------
----------------Proyecto número 1 Lenguajes de Programación--------------------
--------------------------- Emmanuel Rosales Salas-----------------------------
--------------------------------------------------------------------------------

-- Libraries
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Containers.Vectors; use Ada.Containers;

procedure Bitmap is


   -- Renombra paquetes para usarlos más fácilmente.
   package IIO is new Ada.Text_IO.Integer_IO(Integer);
   
   package SU renames Ada.Strings.Unbounded;
   
   -- Declaración de variables
   Number : Natural := 0; -- Guarda el número que el usuario digita
   
   Time : Integer := 0;   -- Guarda el número del tiempo.
   
   Result : SU.Unbounded_String := SU.Null_Unbounded_String; -- Guarda el número
                                                            -- de resultado Binario

   Test : Integer := 0;
   -- Función que convierte un número natural en binario
   -- Recibe un Natura y retorna un binario
   -- Utiliza la libreria Unbounded para tener un manejo dinámico del tamaño.

   function DecToBin(N: Natural) return SU.Unbounded_String is
      use type SU.Unbounded_String;
      S: String(1 .. 14);
      Left:  Positive := S'First;
      Right: Positive := S'Last;
      Result : SU.Unbounded_String;
   begin
      if N <= 255 then -- Verifica que el número no se más grande que 255
      IIO.Put(To => S, Item => N, Base => 2);
      while S(Left) /= '#' loop
         Left := Left + 1;
      end loop;
      while S(Right) /= '#' loop
         Right := Right - 1;
      end loop;
      Result := SU.To_Unbounded_String(S(Left+1 .. Right-1));
         return Result;
      else
         Put("El numero tiene que ser entre 0 y 255");
         raise Constraint_Error;
      end if;
   end DecToBin;
   
   
begin
   Put("Write a number: ");
   Get(Number);
   Put("Time: ");
   Get(Time);
   Result := DecToBin(Number);
   Put(Result);  
end Bitmap;
