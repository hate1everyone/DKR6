program StackDemo;
type
  stack = record
    Data: array[1..100] of integer;
    Top: integer;
  end;
procedure InitStack(var S: Stack);
begin
  S.Top:=0;
end;
function IsEmpty(S:Stack): boolean;
begin
  if S.Top = 0 then
    IsEmpty:= true
  else
    IsEmpty:= false;
end;
function IsFull(S:Stack): boolean;
begin
  if S.Top = 100 then
    IsFull:= true
  else
    IsFull:= false;
end;
procedure Push(var S: Stack; x:integer);
begin
  if not IsFull(S) then begin
    S.Top:= S.Top +1;
    S.Data[S.Top]:= x;
  end
  else begin
    writeln('Stack overflow');
  end;
end;
function Pop(var S:Stack):integer;
var
  x: integer;
begin
  if not IsEmpty(S) then begin
    x:= S.Data[S.Top];
    S.Top:= S.Top - 1;
    Pop:= x;
    end
    else begin
      writeln('Stack underflow');
      Pop:= 0;
    end;
  end;
procedure PrintStack(S: Stack);
var
  i:integer;
begin
  writeln('Stack contents:');
  if not IsEmpty(S) then begin
    for i:= S.Top downto 1 do
      writeln(S.Data[i]);
  end
  else begin
    writeln('Stack is empty');
  end;
end;
var
  S: Stack;
  choice, x:integer;
begin
  initStack(S);
  repeat
    writeln('Stack menu:');
    writeln('1.Push');
    writeln('2.Pop');
    writeln('3.Print');
    writeln('4.Exit');
    write('Введите свой выбор:');
    readln(choice);
    case choice of
      1:Begin
        write('Введите элемент для нажатия:');
        readln(x);
        Push(S,x);
      end;
      2:begin
        x:= Pop(S);
        writeln('Вышедший элемент:',x);
      end;
      3:begin
        PrintStack(S);
      end;
      4:begin
        writeln('Выход из программы');
      end;
      else begin
        writeln('Неверный выбор');
      end;
    end;
  until choice =4;
end.
