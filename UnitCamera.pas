unit UnitCamera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Media, FMX.Effects, FMX.Filter.Effects;

type
  TFrmCamera = class(TForm)
    CameraComponent: TCameraComponent;
    img_camera: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Layout1: TLayout;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    MonochromeEffect1: TMonochromeEffect;
    procedure CameraComponentSampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    procedure CameraQuality(quality: TVideoCaptureQuality);
    { Private declarations }
  public
    { Public declarations }
      cancel : boolean;
  end;

var
  FrmCamera: TFrmCamera;

implementation

{$R *.fmx}

procedure TFrmCamera.CameraQuality( quality : TVideoCaptureQuality );
begin
    CameraComponent.Active := false;
    CameraComponent.Quality := quality;
    CameraComponent.Active := false;
end;

procedure TFrmCamera.CameraComponentSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
    CameraComponent.SampleBufferToBitmap(img_camera.Bitmap, true);
end;

procedure TFrmCamera.FormShow(Sender: TObject);
begin
    CameraComponent.Active := true;
end;

procedure TFrmCamera.Image1Click(Sender: TObject);
begin
    cancel := true;
    CameraComponent.Active := true;
    close;
end;

procedure TFrmCamera.Image2Click(Sender: TObject);
begin
    CameraQuality(TVideoCaptureQuality.LowQuality);
end;

procedure TFrmCamera.Image3Click(Sender: TObject);
begin
    CameraQuality(TVideoCaptureQuality.MediumQuality);
end;

procedure TFrmCamera.Image4Click(Sender: TObject);
begin
    CameraQuality(TVideoCaptureQuality.HighQuality);
end;

procedure TFrmCamera.Image5Click(Sender: TObject);
begin
    cancel := false;
    CameraComponent.SampleBufferToBitmap(img_camera.Bitmap, true);
    CameraComponent.Active := false;
    Close;
end;

procedure TFrmCamera.Image6Click(Sender: TObject);
begin
    MonochromeEffect1.Enabled := NOT MonochromeEffect1.Enabled
end;

procedure TFrmCamera.Image7Click(Sender: TObject);
begin
    CameraComponent.Active := false;

    if CameraComponent.Kind = TCameraKind.FrontCamera then
        CameraComponent.Kind := TCameraKind.BackCamera
    else
        CameraComponent.Kind := TCameraKind.BackCamera;


    CameraComponent.Active := false;
end;

end.
