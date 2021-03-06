unit Global;

interface

uses IniFiles, Sysutils;

const
  Ini_Name :string = 'Config.INI';

var
  Host_URL: string;
  User_Query_URL: string;
  User_Login_URL: string;
  Intf_Sina_URL: string;
  Intf_Call_URL: string;

implementation

procedure Init;
var
  ini: TINIFile;
begin
  ini := TINIFile.Create(Ini_Name);
  Host_URL := ini.ReadString('URL', 'HOST_URL', 'http://localhost:11080');
  User_Query_URL := ini.ReadString('URL', 'USER_QUERY_URL', Host_URL+'/user/query');
  User_Login_URL := ini.ReadString('URL', 'USER_LOGIN_URL', Host_URL+'/user/login');
  Intf_Sina_URL := ini.ReadString('URL', 'Intf_Sina_URL', Host_URL+'/intf/sina');
  Intf_Call_URL := ini.ReadString('URL','Intf_Call_URL', Host_URL+'/intf/call');
  ini.Free;
end;

procedure Uninit;
var
  ini: TINIFile;
begin
  ini := TINIFile.Create(Ini_Name);
  ini.WriteString('URL', 'HOST_URL', Host_URL);
  ini.WriteString('URL', 'USER_QUERY_URL', User_Query_URL);
  ini.WriteString('URL', 'USER_LOGIN_URL', User_Login_URL);
  ini.WriteString('URL', 'Intf_Sina_URL', Intf_Sina_URL);
  ini.WriteString('URL','Intf_Call_URL', Intf_Call_URL);
  ini.Free;
end;

initialization
  Init;

finalization
   uninit;

end.
