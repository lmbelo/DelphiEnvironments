unit Frame.Presentation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TFramePresentation = class(TFrame)
    loPresentation: TLayout;
    loDisplayText: TLayout;
    lblName: TLabel;
    lblDescription: TLabel;
    imgPresentation: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
