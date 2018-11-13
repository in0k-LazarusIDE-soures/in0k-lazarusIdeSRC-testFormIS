unit in0k_lazarusIdeSRC__ideForm_CodeExplorerView;

{$mode objfpc}{$H+}

interface

uses IDEWindowIntf , Forms;

// проверить что форма является Экземляром: TAnchorDesigner
function Form_Confirmed(const testForm:TCustomForm):boolean; {$ifOPT D-}inline;{$endIf}

// НАЙТИ Экземляр формы TAnchorDesigner
function Form_FindInIDE:TCustomForm; {$ifOPT D-}inline;{$endIf}

implementation

//------------------------------------------------------------------------------
// Форма НЕ определена в IDEIntf, поэтому влоб, через название

function Form_Confirmed(const testForm:TCustomForm):boolean;
begin
    result:=testForm.ClassNameIs('TCodeExplorerView');
end;

function Form_FindInIDE:TCustomForm;
var i:integer;
begin
    result:=nil;
    for i:=0 to Screen.FormCount-1 do begin
        if Form_Confirmed(Screen.Forms[i]) then begin
            result:=Screen.Forms[i];
            BREAK;
        end;
    end;
end;

end.
