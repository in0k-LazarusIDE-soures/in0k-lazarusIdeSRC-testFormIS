unit in0k_lazIdeSRC_testFormIS_PackageEditor;

{$mode objfpc}{$H+}
interface

uses LCLVersion, //< версия Lazarusa
     Forms;

// проверить что форма является Экземляром: PackageEditor
function toConfirm(const testForm:TCustomForm):boolean; {$ifOPT D-}inline;{$endIf}

implementation

function toConfirm(const testForm:TCustomForm):boolean;
begin {Форма НЕ определена в IDEIntf, поэтому влоб, через название}
    {$if     (lcl_fullversion =1060004 )}
        result:=testForm.ClassNameIs('TPackageEditorForm');
    {$elseif (lcl_fullversion>=1060002 )}
        result:=testForm.ClassNameIs('TPackageEditorForm');
    {$elseif (lcl_fullversion>=1040400 )}
        result:=testForm.ClassNameIs('TPackageEditorForm');
    {$else} {$WARNING 'NOT Tested in this LazarusIDE version'}
        result:=testForm.ClassNameIs('TPackageEditorForm');
    {$endif}
end;

end.

