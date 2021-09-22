unit Frame.Configuration;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, Frame.Presentation, Frame.Category, FMX.Layouts,
  FMX.ListBox, Frame.CategoryDelphi;

type
  TFrameConfiguration = class(TFrame)
    frmPresentation: TFramePresentation;
    pnlPresentation: TPanel;
    pnlDelphi: TPanel;
    FrameCategoryDelphi1: TFrameCategoryDelphi;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
