unit Core.DelphiInfo;

interface

uses
  System.Win.Registry;

type
  TDelphiVersion = (
    //XE versions
    VER220, VER230, VER240, VER250, VER260, VER270, VER280, VER290,
    //10 versions
    VER300, VER310, VER320, VER330, VER340,
    //11 version
    VER350
    );

  TDelphiInfo = record
  public
    Product: string;
    ProductVer: byte;
    PackageVer: word;
    CompilerVer: double;
    RegPath: string;
    RegEnv: string;
    RegNum: string;
  end;

const
  TDelphiInfos: array[TDelphiVersion] of TDelphiInfo = (
    (Product: 'Delphi XE / C++Builder XE';
     ProductVer: 15;
     PackageVer: 150;
     CompilerVer: 22.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '8.0'),

    (Product: 'Delphi XE2 / C++Builder XE2';
     ProductVer: 16;
     PackageVer: 160;
     CompilerVer: 23.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '9.0'),

    (Product: 'Delphi XE3 / C++Builder XE3';
     ProductVer: 17;
     PackageVer: 170;
     CompilerVer: 24.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '10.0'),

    (Product: 'Delphi XE4 / C++Builder XE4';
     ProductVer: 18;
     PackageVer: 180;
     CompilerVer: 25.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '11.0'),

    (Product: 'Delphi XE5 / C++Builder XE5';
     ProductVer: 19;
     PackageVer: 190;
     CompilerVer: 26.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '12.0'),

    (Product: 'Delphi XE6 / C++Builder XE6';
     ProductVer: 20;
     PackageVer: 200;
     CompilerVer: 27.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '14.0'),

    (Product: 'Delphi XE7 / C++Builder XE7';
     ProductVer: 21;
     PackageVer: 210;
     CompilerVer: 28.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '15.0'),

    (Product: 'Delphi XE8 / C++Builder XE8';
     ProductVer: 22;
     PackageVer: 220;
     CompilerVer: 29.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '16.0'),

    (Product: 'Delphi 10 Seattle / C++Builder 10 Seattle';
     ProductVer: 23;
     PackageVer: 230;
     CompilerVer: 30.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '17.0'),

    (Product: 'Delphi 10.1 Berlin / C++Builder 10.1 Berlin';
     ProductVer: 24;
     PackageVer: 240;
     CompilerVer: 31.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '18.0'),

    (Product: 'Delphi 10.2 Tokyo / C++Builder 10.2 Tokyo';
     ProductVer: 25;
     PackageVer: 250;
     CompilerVer: 32.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '19.0'),

    (Product: 'Delphi 10.3 Rio / C++Builder 10.3 Rio';
     ProductVer: 26;
     PackageVer: 260;
     CompilerVer: 33.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '20.0'),

    (Product: 'Delphi 10.4 Sydney / C++Builder 10.4 Sydney';
     ProductVer: 27;
     PackageVer: 270;
     CompilerVer: 34.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '21.0'),

    (Product: 'Delphi 11 Alexandria / C++Builder 11 Alexandria';
     ProductVer: 28;
     PackageVer: 280;
     CompilerVer: 35.0;
     RegPath: '\Software\Embarcadero';
     RegEnv: 'BDS';
     RegNum: '22.0')
  );

implementation

end.
