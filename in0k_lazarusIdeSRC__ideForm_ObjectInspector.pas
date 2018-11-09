unit in0k_lazarusIdeSRC__ideForm_ObjectInspector;

{$mode objfpc}{$H+}

interface

uses
  ObjectInspector,
  Forms;

// проверить что форма является Экземляром: TAnchorDesigner
function Form_Confirmed(const testForm:TCustomForm):boolean; {$ifOPT D-}inline;{$endIf}

// НАЙТИ Экземляр формы TAnchorDesigner
function Form_FindInIDE:TCustomForm; {$ifOPT D-}inline;{$endIf}

implementation

type //< тут возможно придется определять относительно ВЕРСИИ ЛАЗАРУСА
  _cObjectInspector_TFormClass_=TObjectInspectorDlg;

function Form_Confirmed(const testForm:TCustomForm):boolean;
begin
    result:=testForm is _cObjectInspector_TFormClass_;
end;

function Form_FindInIDE:TCustomForm;
var i:integer;
begin {todo: посмотреть ... может ПРЯМАЯ ссылка есть}
    result:=nil;
    for i:=0 to Screen.FormCount-1 do begin
        if Form_Confirmed(Screen.Forms[i]) then begin
            result:=Screen.Forms[i];
            BREAK;
				end;
		end;
end;

end.

