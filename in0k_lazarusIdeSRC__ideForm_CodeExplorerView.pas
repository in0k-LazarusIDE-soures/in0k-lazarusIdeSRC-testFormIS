unit in0k_lazarusIdeSRC__ideForm_CodeExplorerView;

{$mode objfpc}{$H+}

interface

uses IDEWindowIntf, Forms;

// название формы
function Form_Name:string; {$ifOPT D-}inline;{$endIf}

// название КЛАССА формы
function Form_className:string; {$ifOPT D-}inline;{$endIf}

// проверить что форма является Экземляром: TAnchorDesigner
function Form_Confirmed(const testForm:TCustomForm):boolean; {$ifOPT D-}inline;{$endIf}

// НАЙТИ Экземляр формы TAnchorDesigner
function Form_FindInIDE:TCustomForm; {$ifOPT D-}inline;{$endIf}

implementation

//------------------------------------------------------------------------------
// Форма НЕ определена в IDEIntf, поэтому влоб, через название

const
_cFormName_='CodeExplorerView';

function Form_Name:string;
begin
    result:=_cFormName_;
end;

function Form_className:string;
begin
    result:='T'+_cFormName_;
end;

function Form_Confirmed(const testForm:TCustomForm):boolean;
begin
    result:=testForm.ClassNameIs(Form_className);
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
