unit in0k_lazarusIdeSRC__ideForm_ObjectInspector;

{$mode objfpc}{$H+}

interface

uses
  IDEIntf,  IDEWindowIntf,
  IDECommands,
  ObjectInspector,
  Forms;

// проверить что форма является Экземляром: TAnchorDesigner
function Form_Confirmed(const testForm:TCustomForm):boolean; {$ifOPT D-}inline;{$endIf}

// НАЙТИ Экземляр формы TAnchorDesigner
function Form_FindInIDE:TCustomForm; {$ifOPT D-}inline;{$endIf}

function Form_ShowByCMD:TCustomForm; {$ifOPT D-}inline;{$endIf}

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


const //< тут возможно придется определять относительно ВЕРСИИ ЛАЗАРУСА
  _c_IDECommand_OpnOI_IdeCODE_=ecToggleObjectInsp;

function Form_ShowByCMD:TCustomForm;
var IDECommand:TIDECommand;
begin
    result:=NIL;    //idewi
    // ищем команду
    IDECommand:=IDECommandList.FindIDECommand(_c_IDECommand_OpnOI_IdeCODE_);
    if Assigned(IDECommand) and IDECommand.Execute(Application.MainForm) then begin

        ;

            // команда НАШЛАСЬ, и её УДАЛОСЬ запустить
            result:=Form_FindInIDE; //< поисчем окно СНОГО
    end;
end;

end.

