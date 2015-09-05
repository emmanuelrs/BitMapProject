-------------------------------------------------------------------------------
----------------Proyecto n�mero 1 Lenguajes de Programaci�n--------------------
--------------------------- Emmanuel Rosales Salas-----------------------------
--------------------------------------------------------------------------------

-- Libraries
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Bitmap is

   -- Renombra paquetes para usarlos m�s f�cilmente.
   package IIO is new Ada.Text_IO.Integer_IO(Integer);
   package SU renames Ada.Strings.Unbounded;

   -- Funci�n que convierte un n�mero natural en binario
   -- Recibe un Natura y retorna un binario
   -- Utiliza la libreria Unbounded para tener un manejo din�mico del tama�o.

   function DecToBin(N: Natural) return SU.Unbounded_String is
      use type SU.Unbounded_String;
      S: String(1 .. 1026);
      Left:  Positive := S'First;
      Right: Positive := S'Last;
      Result : SU.Unbounded_String;
   begin
      IIO.Put(To => S, Item => N, Base => 2);
      while S(Left) /= '#' loop
         Left := Left + 1;
      end loop;
      while S(Right) /= '#' loop
         Right := Right - 1;
      end loop;
      Result := SU.To_Unbounded_String(S(Left+1 .. Right-1));
      return Result;
   end DecToBin;

   -- Declaraci�n de variables
   Number : Natural := 0; -- Guarda el n�mero que el usuario digita
   Result : SU.Unbounded_String := SU.Null_Unbounded_String; -- Guarda el n�mero
   							     -- de resultado Binario
begin
   Put("Write a number: ");
   Get(Number);
   Result := DecToBin(Number);
   Put(Result);
end Bitmap;
