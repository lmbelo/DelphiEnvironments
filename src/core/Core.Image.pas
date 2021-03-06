unit Core.Image;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, FMX.ImgList;

type
  TCoreImage = class(TDataModule)
    img50x50: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CoreImage: TCoreImage;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

initialization
  CoreImage := TCoreImage.Create(nil);

finalization
  CoreImage.Free();

end.
