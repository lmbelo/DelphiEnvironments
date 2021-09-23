unit Frame.CategoryDelphi;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Frame.Category, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListBox;

type
  TFrameCategoryDelphi = class(TFrameCategory)
    loccHeader: TLayout;
    lblVersion: TLabel;
    cbVersion: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameCategoryDelphi: TFrameCategoryDelphi;

implementation

{$R *.fmx}

end.
