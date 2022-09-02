;--------------------------------------------
; Script generated with Install Designer
; Copyright (c) 2019 - 2022 unSigned, s. r. o.
; http://www.install-designer.com
;--------------------------------------------

[Code]
var
    IpAdress: TWizardPage;
    // Fonts
    // Pictures

    // Controls
    CheckBoxDoNotChange: TNewCheckBox;
    RadioButton_CustomIP: TNewRadioButton;
    RadioButton_172x: TNewRadioButton;
    RadioButton_192x: TNewRadioButton;
    TextBoxGateway: TNewEdit;
    TextBoxSubnet: TNewEdit;
    LabelGateway: TLabel;
    LabelSubnet: TLabel;
    LabelIpAdress: TLabel;
    TextBoxIpAdress: TNewEdit;

//ShellExec('open',  'cmd', '/c netsh.exe interface ip set address "Ethernet" source = static addr = 172.1.1.50 mask = 255.255.255.0 gateway = 0.0.0.0 gwmetric = 1','',SW_HIDE,ewNoWait,ErrorCode);    
function IpAdress_Set(editable: Boolean): Boolean;
Var
    ErrorCode: Integer;
    ip: String;
    subnet: String;
    gateway: String;
    parameter: String;
begin
    if (not CheckBoxDoNotChange.Checked) then
        begin
          ip:=TextBoxIpAdress.Text;
          subnet:=TextBoxSubnet.Text;
          gateway:=TextBoxGateway.Text;
          parameter := '/c netsh.exe interface ip set address "Ethernet" source = static addr = ' + ip + ' mask = ' + subnet + ' gateway = ' + gateway + ' gwmetric = 1';

          ShellExec('open',  'cmd', ExpandConstant(parameter),'',SW_HIDE,ewNoWait,ErrorCode);
          //ethertn 2 , ethernet 3
          ShellExec('open',  'cmd', ExpandConstant('/c netsh.exe interface ip set address "Ethernet 2" source = static addr = ' + ip + ' mask = ' + subnet + ' gateway = ' + gateway + ' gwmetric = 1'),'',SW_HIDE,ewNoWait,ErrorCode);
          ShellExec('open',  'cmd', ExpandConstant('/c netsh.exe interface ip set address "Ethernet 3" source = static addr = ' + ip + ' mask = ' + subnet + ' gateway = ' + gateway + ' gwmetric = 1'),'',SW_HIDE,ewNoWait,ErrorCode);

          //MsgBox('Just set ip address as ' + ip + ' ' + subnet + ' ' + gateway, mbInformation, MB_OK);
          //MsgBox('Just set ip address as ' + ExpandConstant(parameter), mbInformation, MB_OK);
        end
end;

function setEditable(editable: Boolean): Boolean;
begin
  TextBoxIpAdress.Enabled := editable;
  TextBoxSubnet.Enabled := editable;
  TextBoxGateway.Enabled := editable;
  LabelIpAdress.Enabled := editable;
  LabelSubnet.Enabled := editable;
  LabelGateway.Enabled := editable;  
end;

// Event handlers 
procedure RadioButton_CustomIP_OnClick(Sender: TObject);
begin
    if (RadioButton_CustomIP.Checked) then
      begin
        setEditable(true);
      end
    else
      begin
        setEditable(false);
      end
end;

procedure RadioButton_172x_OnClick(Sender: TObject);
var
ErrorCode: Integer;
begin
    setEditable(false);
    TextBoxIpAdress.Text := '172.1.1.50';
    TextBoxSubnet.Text := '255.255.255.0';
    TextBoxGateway.Text := '0.0.0.0';
end;

procedure RadioButton_192x_OnClick(Sender: TObject);
begin
    setEditable(false);
    TextBoxIpAdress.Text := '192.168.10.50';
    TextBoxSubnet.Text := '255.255.255.0';
    TextBoxGateway.Text := '192.168.10.1';
end;

procedure CheckBoxDoNotChange_OnClick(Sender: TObject);
var 
  Change: Boolean;
begin
    Change := not CheckBoxDoNotChange.Checked; 
    RadioButton_CustomIP.Enabled := Change;
    RadioButton_172x.Enabled := Change;
    RadioButton_192x.Enabled := Change;
    setEditable(RadioButton_CustomIP.Checked);
    if (CheckBoxDoNotChange.Checked) then
      begin
      end
    else
      begin
      end
end;

function IpAdress_Create: TWizardPage;
var 
  languageName: String;
  title:String;
  subtitle:String;
  doNotChangeIp:String;
  customIP:String;
begin
    // Get the language selected by the user , Corresponding Languages Field Name
    languageName := ActiveLanguage();
    if languageName = 'turkish'then
      begin
        title := 'Bilgisayar / Tablet IP Adresi';
        subtitle := 'ILTER cihazında oturum açmak için Statik IP adresi kullanıldığından bilgisayarin gecerli IP adresinin cihaz ile uyumlu olarak ayarlanmasi gerekir. Ağ yöneticisi varsa, IP adresini yöneticiye danışın.';
        doNotChangeIp := ' IP Adresini degistirmeden devam et';
        customIP := ' IP Adresini kendin belirle';
      end
    else 
      begin  
        title := 'Computer / Tablet IP Address';
        subtitle := 'Check and set the current IP address of the computer, as a static IP address is used to login to the device. If there is a network administrator, consult the administrator for the IP address.';
        doNotChangeIp := ' Do not change IP Address';
        customIP := ' Custom IP Address';
      end;


    // This is a page creator Function. You can use the Result of it to access the controls on this Page.
    IpAdress := CreateCustomPage(wpSelectTasks, title, subtitle);

    { CheckBoxDoNotChange (TNewCheckBox) }
    CheckBoxDoNotChange := TNewCheckBox.Create(IpAdress);
    CheckBoxDoNotChange.Parent := IpAdress.Surface;
    CheckBoxDoNotChange.Enabled := True;
    CheckBoxDoNotChange.Visible := True;
    CheckBoxDoNotChange.Left := ScaleX(108);
    CheckBoxDoNotChange.Top := ScaleY(13);
    CheckBoxDoNotChange.Width := ScaleX(193);
    CheckBoxDoNotChange.Height := ScaleY(24);
    CheckBoxDoNotChange.Checked := True;
    CheckBoxDoNotChange.Font.Color := $000000;
    CheckBoxDoNotChange.Color := $F0F0F0;
    CheckBoxDoNotChange.Caption := doNotChangeIp;
    CheckBoxDoNotChange.OnClick := @CheckBoxDoNotChange_OnClick;

    { RadioButton_CustomIP (TNewRadioButton) }
    RadioButton_CustomIP := TNewRadioButton.Create(IpAdress);
    RadioButton_CustomIP.Parent := IpAdress.Surface;
    RadioButton_CustomIP.Enabled := False;
    RadioButton_CustomIP.Visible := True;
    RadioButton_CustomIP.Left := ScaleX(107);
    RadioButton_CustomIP.Top := ScaleY(106);
    RadioButton_CustomIP.Width := ScaleX(181);
    RadioButton_CustomIP.Height := ScaleY(24);
    RadioButton_CustomIP.Checked := False;
    RadioButton_CustomIP.Font.Color := $000000;
    RadioButton_CustomIP.Color := $F0F0F0;
    RadioButton_CustomIP.Caption := customIP;
    RadioButton_CustomIP.OnClick := @RadioButton_CustomIP_OnClick;

    { RadioButton_172x (TNewRadioButton) }
    RadioButton_172x := TNewRadioButton.Create(IpAdress);
    RadioButton_172x.Parent := IpAdress.Surface;
    RadioButton_172x.Enabled := False;
    RadioButton_172x.Visible := True;
    RadioButton_172x.Left := ScaleX(107);
    RadioButton_172x.Top := ScaleY(78);
    RadioButton_172x.Width := ScaleX(181);
    RadioButton_172x.Height := ScaleY(24);
    RadioButton_172x.Checked := True;
    RadioButton_172x.Font.Color := $000000;
    RadioButton_172x.Color := $F0F0F0;
    RadioButton_172x.Caption := ' 172.1.1.50';
    RadioButton_172x.OnClick := @RadioButton_172x_OnClick;

    { RadioButton_192x (TNewRadioButton) }
    RadioButton_192x := TNewRadioButton.Create(IpAdress);
    RadioButton_192x.Parent := IpAdress.Surface;
    RadioButton_192x.Enabled := False;
    RadioButton_192x.Visible := True;
    RadioButton_192x.Left := ScaleX(107);
    RadioButton_192x.Top := ScaleY(49);
    RadioButton_192x.Width := ScaleX(181);
    RadioButton_192x.Height := ScaleY(24);
    RadioButton_192x.Checked := False;
    RadioButton_192x.Font.Color := $000000;
    RadioButton_192x.Color := $F0F0F0;
    RadioButton_192x.Caption := ' 192.168.10.50';
    RadioButton_192x.OnClick := @RadioButton_192x_OnClick;

    { TextBoxGateway (TNewEdit) }
    TextBoxGateway := TNewEdit.Create(IpAdress);
    TextBoxGateway.Parent := IpAdress.Surface;
    TextBoxGateway.Enabled := False;
    TextBoxGateway.Visible := True;
    TextBoxGateway.Left := ScaleX(195);
    TextBoxGateway.Top := ScaleY(202);
    TextBoxGateway.Width := ScaleX(100);
    TextBoxGateway.Height := ScaleY(20);
    TextBoxGateway.Font.Color := $000000;
    TextBoxGateway.Color := $FFFFFF;
    TextBoxGateway.Text := '0.0.0.0';

    { TextBoxSubnet (TNewEdit) }
    TextBoxSubnet := TNewEdit.Create(IpAdress);
    TextBoxSubnet.Parent := IpAdress.Surface;
    TextBoxSubnet.Enabled := False;
    TextBoxSubnet.Visible := True;
    TextBoxSubnet.Left := ScaleX(195);
    TextBoxSubnet.Top := ScaleY(171);
    TextBoxSubnet.Width := ScaleX(100);
    TextBoxSubnet.Height := ScaleY(20);
    TextBoxSubnet.Font.Color := $000000;
    TextBoxSubnet.Color := $FFFFFF;
    TextBoxSubnet.Text := '255.255.255.0';

    { LabelGateway (TLabel) }
    LabelGateway := TLabel.Create(IpAdress);
    LabelGateway.Parent := IpAdress.Surface;
    LabelGateway.Enabled := False;
    LabelGateway.Visible := True;
    LabelGateway.Left := ScaleX(107);
    LabelGateway.Top := ScaleY(205);
    LabelGateway.Width := ScaleX(79);
    LabelGateway.Height := ScaleY(17);
    LabelGateway.Font.Color := $000000;
    LabelGateway.Color := $F0F0F0;
    LabelGateway.Caption := 'Gateway';

    { LabelSubnet (TLabel) }
    LabelSubnet := TLabel.Create(IpAdress);
    LabelSubnet.Parent := IpAdress.Surface;
    LabelSubnet.Enabled := False;
    LabelSubnet.Visible := True;
    LabelSubnet.Left := ScaleX(107);
    LabelSubnet.Top := ScaleY(174);
    LabelSubnet.Width := ScaleX(79);
    LabelSubnet.Height := ScaleY(17);
    LabelSubnet.Font.Color := $000000;
    LabelSubnet.Color := $F0F0F0;
    LabelSubnet.Caption := 'Subnet';

    { LabelIpAdress (TLabel) }
    LabelIpAdress := TLabel.Create(IpAdress);
    LabelIpAdress.Parent := IpAdress.Surface;
    LabelIpAdress.Enabled := False;
    LabelIpAdress.Visible := True;
    LabelIpAdress.Left := ScaleX(107);
    LabelIpAdress.Top := ScaleY(144);
    LabelIpAdress.Width := ScaleX(79);
    LabelIpAdress.Height := ScaleY(17);
    LabelIpAdress.Font.Color := $000000;
    LabelIpAdress.Color := $F0F0F0;
    LabelIpAdress.Caption := 'IP Address';

    { TextBoxIpAdress (TNewEdit) }
    TextBoxIpAdress := TNewEdit.Create(IpAdress);
    TextBoxIpAdress.Parent := IpAdress.Surface;
    TextBoxIpAdress.Enabled := False;
    TextBoxIpAdress.Visible := True;
    TextBoxIpAdress.Left := ScaleX(195);
    TextBoxIpAdress.Top := ScaleY(141);
    TextBoxIpAdress.Width := ScaleX(100);
    TextBoxIpAdress.Height := ScaleY(20);
    TextBoxIpAdress.Font.Color := $000000;
    TextBoxIpAdress.Color := $FFFFFF;
    TextBoxIpAdress.Text := '172.1.1.50';

    // Result is the newly created Page (TWizardPage).
    Result := IpAdress;
end;
