-------------------------------------------------------------------------------
----------------Proyecto número 1 Lenguajes de Programación--------------------
--------------------------- Emmanuel Rosales Salas-----------------------------
--------------------------------------------------------------------------------

-- Libraries
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Bitmap is

   -- Renombra paquetes para usarlos más fácilmente.
   package IIO is new Ada.Text_IO.Integer_IO(Integer);
   package SU renames Ada.Strings.Unbounded;

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

   -- Declaración de variables
   Number : Natural := 0; -- Guarda el número que el usuario digita
   Result : SU.Unbounded_String := SU.Null_Unbounded_String; -- Guarda el número
   							     -- de resultado Binario
begin
   Put("Write a number: ");
   Get(Number);
   Result := DecToBin(Number);
   Put(Result);
end Bitmap;
