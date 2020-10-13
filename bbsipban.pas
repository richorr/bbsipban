Program BBSSharedIPBan;
{$mode objfpc}{$h+}

Uses SysUtils, StrUtils, Crt, fphttpclient;

const 
    Base_Url = 'http://banip.baud.games/banip';

procedure UploadIPList(logfilename : string);
var 
  newIPBanFile : string;    
begin 
  With TFPHttpClient.Create(Nil) do
  try
    try
      newIPBanFile := TFPHTTPClient.SimpleGet(Base_Url);
    except
      on E: Exception do
        Writeln('Error: ' + E.Message);
    end;
  finally
    Free;
  end;
end;

procedure DownloadIPList(Filename : string);
var 
  Result : string;
begin 
  Result := '';
  With TFPHttpClient.Create(Nil) do
  try
    try
      SimpleGet(Base_Url, Filename);
      Result := Filename;
    except
      on E: Exception do
        Writeln('Error: ' + E.Message);
    end;
  finally
    Free;
  end;
end;

begin
  ClrScr;
  WriteLn;
  Writeln('*******************************');
  Writeln('*** BBS Share IP Ban v0.01A ***');
  Writeln('***  Courtesy of Baud BBS   ***');
  Writeln('*******************************');
  Writeln;
  Writeln;
end. 