unit umain;

interface

uses

  //additional
  IdTCPServer, IdContext,

  //autogenerate
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  AdvGlassButton;

type
  TForm1 = class(TForm)
    chklst1: TCheckListBox;
    btnInstallWebServer: TAdvGlassButton;
    mmoLog: TMemo;
    lb1: TLabel;
    lb2: TLabel;
    btnCA: TAdvGlassButton;
    btnUCA: TAdvGlassButton;
    btnRelease: TAdvGlassButton;
    procedure FormCreate(Sender: TObject);
    procedure btnInstallWebServerClick(Sender: TObject);
    procedure DummyExecute(AContext: TIdContext);
    procedure AktifkanPort(APort: Word; Index: Integer);
    procedure btnCAClick(Sender: TObject);
    procedure btnUCAClick(Sender: TObject);
    procedure btnReleaseClick(Sender: TObject);
  private
    { Private declarations }

    FServers: array of TIdTCPServer;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DummyExecute(AContext: TIdContext);
begin
  // Biarkan kosong, kita hanya butuh port-nya terkunci
end;

procedure TForm1.AktifkanPort(APort: Word; Index: Integer);
begin
try
    FServers[Index] := TIdTCPServer.Create(nil);
    FServers[Index].DefaultPort := APort;
    FServers[Index].Bindings.Add.IP := '127.0.0.1';

    // 💡 SOLUSI: Pasangkan ke prosedur kosong agar Indy mau aktif
    FServers[Index].OnExecute := DummyExecute;

    FServers[Index].Active := True;

    mmoLog.Lines.Add(Format('🚀 Port %d berhasil diduduki oleh aplikasi ini.', [APort]));
  except
    on E: Exception do
      mmoLog.Lines.Add(Format('❌ Gagal menduduki port %d: %s', [APort, E.Message]));
  end;
end;

//procedure TForm1.BtnMulaiClick(Sender: TObject);
//var
//  Ports: array[0..13] of Word;
//  I: Integer;
//begin
//  BtnMulai.Enabled := False;
//
//  // Daftarkan semua port sesuai yang ada di UI Installer Mas Teguh
//  Ports[0] := 3000;  Ports[1] := 3001;  Ports[2] := 3002;
//  Ports[3] := 3003;  Ports[4] := 3004;  Ports[5] := 3005;
//  Ports[6] := 3306;
//
//  Ports[7] := 50000; Ports[8] := 50001; Ports[9] := 50002;
//  Ports[10] := 50003; Ports[11] := 50004; Ports[12] := 50005;
//  Ports[13] := 50006;
//
//  // Set ukuran array penampung server Indy
//  SetLength(FServers, Length(Ports));
//
//  MemoLog.Lines.Add('=== Memulai Pendudukan Port ===');
//  for I := Low(Ports) to High(Ports) do
//  begin
//    AktifkanPort(Ports[I], I);
//  end;
//  MemoLog.Lines.Add('================================');
//  MemoLog.Lines.Add('Silakan jalankan tombol "Cek" pada Installer Anda sekarang!');
//end;

procedure TForm1.btnCAClick(Sender: TObject);
begin

  chklst1.CheckAll(cbChecked, True, False);

end;

procedure TForm1.btnInstallWebServerClick(Sender: TObject);
var
  I: Integer;
  PortNum: Word;
begin

  mmoLog.Clear;

  // Set kapasitas array penampung server sesuai jumlah total item
  SetLength(FServers, chklst1.Items.Count);

  mmoLog.Lines.Add('=== Memulai Blokade Port Pilihan ===');

  for I := 0 to chklst1.Items.Count - 1 do
  begin
    // Hanya eksekusi jika port tersebut dicentang oleh Mas Teguh
    if chklst1.Checked[I] then
    begin
      PortNum := StrToIntDef(chklst1.Items[I], 0);
      if PortNum > 0 then
      begin
        // Panggil fungsi AktifkanPort yang sudah kita buat kemarin
        AktifkanPort(PortNum, I);
      end;
    end;
  end;

  mmoLog.Lines.Add('===================================');

end;

procedure TForm1.btnReleaseClick(Sender: TObject);
var
  I: Integer;
begin
  mmoLog.Lines.Add('=== Membebaskan Semua Port ===');

  // Pastikan array FServers tidak kosong
  if Length(FServers) > 0 then
  begin
    for I := 0 to High(FServers) do
    begin
      // Cek apakah server pada indeks ini ada/terdefinisi
      if Assigned(FServers[I]) then
      begin
        try
          FServers[I].Active := False; // Matikan listener port
          FServers[I].Free;            // Bebaskan memori objek
          FServers[I] := nil;          // Set pointer ke nil agar aman
        except
          on E: Exception do
            mmoLog.Lines.Add(Format('⚠ Gagal melepas indeks %d: %s', [I, E.Message]));
        end;
      end;
    end;
  end;

  mmoLog.Lines.Add('🔓 Semua port berhasil dilepas dan bersih kembali.');
  mmoLog.Lines.Add('=======================================');

  // Aktifkan kembali tombol Occupy jika sebelumnya dimatikan
  //BtnCreateProcess.Enabled := True;

end;

procedure TForm1.btnUCAClick(Sender: TObject);
begin

  chklst1.CheckAll(cbUnchecked, True, False);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  BorderStyle := bsDialog;
  Position    := poScreenCenter;
  Caption     := 'Dummy Port Occupier by Teguh Prasetyo';
  mmoLog.Clear;

end;

end.
