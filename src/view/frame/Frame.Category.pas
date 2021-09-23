unit Frame.Category;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrameCategory = class(TFrame)
    loCategoryDescription: TLayout;
    loDisplayText: TLayout;
    lblDescription: TLabel;
    imgCategory: TImage;
    loCategoryContent: TLayout;
    lnSeparator: TLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
