unit ufrmQuestionnaire;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, Menus, ExtCtrls, RzPanel, StdCtrls,
  ComCtrls, RzBmpBtn, RzTabs, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, RzBorder, RzButton, RzRadChk, OleCtrls, SHDocVw, Grids,
  DBGridEh, zBase;

type
  TfrmQuestionnaire = class(TfrmBasic)
    RzPanel2: TRzPanel;
    RzPanel9: TRzPanel;
    RzPanel10: TRzPanel;
    Image2: TImage;
    Image3: TImage;
    RzPanel1: TRzPanel;
    RzPanel6: TRzPanel;
    RzPage: TRzPageControl;
    TabTittle: TRzTabSheet;
    TabContents: TRzTabSheet;
    RzPanel4: TRzPanel;
    RzPanel3: TRzPanel;
    RzPanel7: TRzPanel;
    btnPrevious: TRzBmpButton;
    btnNext: TRzBmpButton;
    btnCommit: TRzBmpButton;
    Label1: TLabel;
    labCURRENT: TLabel;
    Label3: TLabel;
    labALREADY: TLabel;
    Label5: TLabel;
    labSUM: TLabel;
    Label7: TLabel;
    cdsQuestion: TZQuery;
    RzPanel8: TRzPanel;
    labQUESTION_TITLE: TLabel;
    RzPanel15: TRzPanel;
    RzPanel16: TRzPanel;
    Label8: TLabel;
    RzPanel17: TRzPanel;
    labQUESTION_CLASS: TLabel;
    RzPanel18: TRzPanel;
    RzPanel19: TRzPanel;
    Label2: TLabel;
    RzPanel20: TRzPanel;
    labQUESTION_SOURCE: TLabel;
    RzPanel21: TRzPanel;
    RzPanel22: TRzPanel;
    Label12: TLabel;
    RzPanel23: TRzPanel;
    labISSUE_DATE: TLabel;
    RzPanel24: TRzPanel;
    RzPanel25: TRzPanel;
    Label14: TLabel;
    RzPanel26: TRzPanel;
    labEND_DATE: TLabel;
    RzPanel27: TRzPanel;
    RzPanel28: TRzPanel;
    Label6: TLabel;
    RzPanel29: TRzPanel;
    labQUESTION_ITEM_AMT: TLabel;
    RzPanel30: TRzPanel;
    RzPanel32: TRzPanel;
    RzPanel11: TRzPanel;
    RzPanel13: TRzPanel;
    RzPanel14: TRzPanel;
    labREMARK: TLabel;
    RzPanel33: TRzPanel;
    RzPanel34: TRzPanel;
    btnAnswer: TRzBmpButton;
    Timer1: TTimer;
    cdsAnswer: TZQuery;
    WebBrowser1: TWebBrowser;
    cdsListAnswer: TZQuery;
    TabSheet1: TRzTabSheet;
    RzPanel5: TRzPanel;
    DBGridEh1: TDBGridEh;
    cdsQuestionList: TZQuery;
    dsQuestionList: TDataSource;
    btnReturn: TRzBmpButton;
    btnLook: TRzBmpButton;
    btnRetrun_Main: TRzBmpButton;
    RzPanel31: TRzPanel;
    RzPanel12: TRzPanel;
    labShopName: TLabel;
    labANSWER_USER: TLabel;
    labANSWER_DATE: TLabel;
    edtSHOP_ID: TLabel;
    edtANSWER_USER: TLabel;
    edtANSWER_DATE: TLabel;
    RzPanel35: TRzPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    QUESTION_SUM: TLabel;
    QUESTION1_SUM: TLabel;
    QUESTION2_SUM: TLabel;
    Label18: TLabel;
    ledANSWER_USE_TIME: TRzLEDDisplay;
    Label4: TLabel;
    QUESTION3_SUM: TLabel;
    Label15: TLabel;
    QUESTION4_SUM: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAnswerClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure btnLookClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure btnRetrun_MainClick(Sender: TObject);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
  private
    { Private declarations }
    QID:String;
    Already_Num,Sum_Num:Integer;
    BeginDateTime:TDateTime;
    IsEnable:Boolean;
    waiting:boolean;
    procedure InitAnswerInfo;
    procedure AlreadyAnswerInfo;
    //procedure Create
  public
    { Public declarations }
    procedure SyncQuestion(flag: integer);
    function  CreateHtml:String;
    function  GetRow:String;
    procedure GetQuestionList;
    procedure WriteBrowser;
    procedure BrowserRead;
    procedure SetQuestionNum;
    procedure SetAlready;
    procedure GetParams;
    procedure GetQuestions;
    procedure GetAnswer;
    procedure SetListAnswer;
    procedure SaveAnswer;
    procedure LoadPic32;
    class function ShowForm(AOwner:TForm):boolean;
    class function AnswerQustion(AOwner: TForm;ID:String):Boolean;
  end;

implementation
uses ufrmLogo,uShopUtil, uShopGlobal, uSyncFactory, uCaFactory, uGlobal, uDsUtil, ActiveX, mshtml, DateUtils,
  ufrmDesk, uRcFactory;
{$R *.dfm}

{ TfrmQuestionnaire }

procedure TfrmQuestionnaire.GetParams;
var rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text :=
    'select ja.*,a.CODE_NAME as QUESTION_CLASS_TEXT from( '+
    'select QUESTION_CLASS,ISSUE_DATE,QUESTION_SOURCE,QUESTION_TITLE,ANSWER_FLAG,QUESTION_ITEM_AMT,REMARK,END_DATE from MSC_QUESTION '+
    'where TENANT_ID=:TENANT_ID and QUESTION_ID=:QUESTION_ID) ja '+
    'left join (select CODE_ID,CODE_NAME,TYPE_CODE from PUB_PARAMS where TYPE_CODE=''QUESTION_CLASS'') a on ja.QUESTION_CLASS=a.CODE_ID ';
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.Params.ParamByName('QUESTION_ID').AsString := cdsQuestionList.FieldByName('QUESTION_ID').AsString;
    Factor.Open(rs);
    if not rs.IsEmpty then
      begin
        labQUESTION_CLASS.Caption := rs.FieldbyName('QUESTION_CLASS_TEXT').AsString;
        labQUESTION_TITLE.Caption := rs.FieldbyName('QUESTION_TITLE').AsString;
        labQUESTION_SOURCE.Caption := rs.FieldbyName('QUESTION_SOURCE').AsString;
        labQUESTION_ITEM_AMT.Caption := rs.Fieldbyname('QUESTION_ITEM_AMT').AsString;
        labISSUE_DATE.Caption := Copy(rs.FieldbyName('ISSUE_DATE').AsString,1,4)+'-'+Copy(rs.FieldbyName('ISSUE_DATE').AsString,5,2)+'-'+Copy(rs.FieldbyName('ISSUE_DATE').AsString,7,2);
        labEND_DATE.Caption := rs.FieldbyName('END_DATE').AsString;
        labREMARK.Caption := rs.FieldbyName('REMARK').AsString;
        Sum_Num := rs.Fieldbyname('QUESTION_ITEM_AMT').AsInteger;
      end;
  finally
    rs.Free;
  end;
end;

procedure TfrmQuestionnaire.GetQuestions;
begin
  cdsQuestion.Close;
  cdsQuestion.SQL.Text :=
  'select ja.*,a.CODE_NAME as QUESTION_ITEM_TYPE_TEXT from('+
  'select SEQ_NO,QUESTION_ITEM_ID,QUESTION_ID,QUESTION_ITEM_TYPE,QUESTION_INFO,QUESTION_OPTIONS from MSC_QUESTION_ITEM '+
  'where TENANT_ID='+IntToStr(Global.TENANT_ID)+' and QUESTION_ID='''+cdsQuestionList.FieldByName('QUESTION_ID').AsString+''' ) ja ' +
  'left join (select CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP from PUB_PARAMS where TYPE_CODE=''QUESTION_ITEM_TYPE'') a on ja.QUESTION_ITEM_TYPE=a.CODE_ID order by ja.SEQ_NO';
  Factor.Open(cdsQuestion);
end;

procedure TfrmQuestionnaire.InitAnswerInfo;
begin
  edtSHOP_ID.Caption := Global.SHOP_NAME;
  edtANSWER_USER.Caption := Global.UserName;
  edtANSWER_DATE.Caption := FormatDateTime('YYYY-MM-DD HH:MM:SS',Now);
end;

procedure TfrmQuestionnaire.FormCreate(Sender: TObject);
var i:Integer;
begin
  inherited;
  for i:=0 to RzPage.PageCount-1 do
    RzPage.Pages[i].TabVisible := False;
  LoadPic32;
end;

procedure TfrmQuestionnaire.FormShow(Sender: TObject);
begin
  inherited;
  RzPage.ActivePageIndex := 0;
  RzPanel3.Visible := False;
  edtSHOP_ID.Caption := '';
  edtANSWER_USER.Caption := '';
  edtANSWER_DATE.Caption := '';  
  GetQuestionList;
  if QID <> '' then
    begin
      if cdsQuestionList.Locate('QUESTION_ID',QID,[]) then
        begin
          DBGridEh1DblClick(Sender);
        end;
    end;
  //InitAnswerInfo;
  //GetParams;
end;

procedure TfrmQuestionnaire.btnAnswerClick(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('91600004',3) then Raise Exception.Create('你没有答题的权限,请和管理员联系.');  
  GetAnswer;
  IsEnable := True;
  RzPanel3.Visible := True;
  btnRetrun_Main.Visible := False;
  btnCommit.Visible := True;
  labSUM.Caption := IntToStr(Sum_Num);
  RzPanel35.Visible := False;
  RzPanel12.Visible := True;
  InitAnswerInfo;
  SetListAnswer;
  GetQuestions;
  cdsQuestion.First;
  WriteBrowser;
  SetQuestionNum;
  //
  BeginDateTime := Now();
  Timer1.Enabled := True;
  RzPage.ActivePageIndex := 2;
end;

procedure TfrmQuestionnaire.Timer1Timer(Sender: TObject);
var DateStr:String;
begin
  inherited;
  DateStr := Copy(FormatDateTime('HH:MM:SS',Now()-BeginDateTime),4,5);
  ledANSWER_USE_TIME.Caption := DateStr;
end;

function TfrmQuestionnaire.CreateHtml: String;
var Html_Str,Title:String;
    i:Integer;
begin
  if Sum_Num > 0 then
    Title := cdsQuestion.FieldbyName('SEQ_NO').AsString+'、'+cdsQuestion.FieldbyName('QUESTION_INFO').AsString
  else
    Title := '系统没有找到相应的调查题型!';
  Html_Str :=
  '<html> '+
	'<head>'+
	'	<title>调查问卷</title> '+
  '<style type="text/css">'+
  'tr {'+
  '	background-color: #FFFFFF;'+
  '}'+
  '</style>'+
	'</head>'+
	'<body border="0">'+
	'		<form name="tryForm" id="tryForm">'+
	'			<table cellpadding="4" cellspacing="1" width="100%" bgcolor="#FFFFFF">'+
  '			<tr>'+
  '				<td align="center" style="font-size: 14px; font-weight: bold;">'+cdsQuestion.FieldbyName('QUESTION_ITEM_TYPE_TEXT').AsString +'题'+
	'				</td>'+
  '			</tr>'+
	'				<tr>'+
	'					<td style="font-size: 18px; font-weight: bold;">'+Title+'</td>'+
	'				</tr>'+   
  GetRow +
	'			</table>'+
	'		</form>'+
	'</body>'+
  '</html>';
  Result := Html_Str;
end;

procedure TfrmQuestionnaire.WriteBrowser;
var Stream_Str:TStringStream;
    Html_Str:String;
    _Start:Int64;
begin
  Html_Str := CreateHtml;
  Stream_Str := TStringStream.Create(Html_Str);
  waiting := true;
  try
    WebBrowser1.Navigate('about:blank');
    frmDesk.Waited := true;
    _Start := GetTickCount;
    while waiting do
      begin
        if (GetTickCount - _Start) > 10000 then break;
        Application.ProcessMessages;
      end;
    if WebBrowser1.Document=nil then Raise Exception.Create('打开IE插件失败了...'); 
    Stream_Str.Position := 0;
    (WebBrowser1.Document as IPersistStreamInit).Load(TStreamAdapter.Create(Stream_Str));
  finally
    frmDesk.Waited := false;
    Stream_Str.Free;
  end;
end;

function TfrmQuestionnaire.GetRow: String;
var vList:TStringList;
    i:Integer;
    Select_Item,Html_Row,Select_Str,Atr_Enable:String;
  function IsSelected(Value:String):Boolean;
    var vAnswer:TStringList;
        i:Integer;
        IsExist:Boolean;
    begin
      IsSelected := False;
      vAnswer := TStringList.Create;
      try
        if cdsAnswer.Locate('QUESTION_ITEM_ID',cdsQuestion.FieldbyName('QUESTION_ITEM_ID').AsString,[]) then
          begin
            if cdsAnswer.FieldByName('ANSWER_VALUE').AsString <> '' then
              begin
                vAnswer.Delimiter := ',';
                vAnswer.DelimitedText := cdsAnswer.FieldbyName('ANSWER_VALUE').AsString;
                for i:=0 to vAnswer.Count-1 do
                  begin
                    if vAnswer[i] = Value then
                      IsExist := True;
                  end;
              end;

          end;
      finally
        vAnswer.Free;
      end;
      Result := IsExist;
    end;
begin
  vList := TStringList.Create;

  try
    vList.Delimiter := ',';
    vList.DelimitedText := cdsQuestion.fieldbyName('QUESTION_OPTIONS').AsString;
    if IsEnable then
      Atr_Enable := ''
    else
      Atr_Enable := ' disabled="disabled" ';

    case cdsQuestion.FieldByName('QUESTION_ITEM_TYPE').AsInteger of
      1:begin
        for i:=0 to vList.Count-1 do
          begin
            Select_Item := COPY(vList.Strings[i],1,AnsiPos('=',vList.Strings[i])-1)+'.';
            if IsSelected(vList.Names[i]) then
              Select_Str := ' checked="checked" '
            else
              Select_Str := '';
            if length(Select_Item)>3 then Select_Item := '';
            Html_Row := Html_Row +
            '				<tr>'+
            '					<td>&nbsp;&nbsp;&nbsp;'+
            '						<input type=Radio name=Radio id=Radio'+IntToStr(i)+' value='+vList.Names[i]+Select_Str+Atr_Enable+'>'+Select_Item+vList.ValueFromIndex[i]+'<br>'+
            '					</td>'+
            '				</tr>';
          end;
      end;
      2:begin 
        for i:=0 to vList.Count-1 do
          begin
            Select_Item := COPY(vList.Strings[i],1,AnsiPos('=',vList.Strings[i])-1)+'.';
            if IsSelected(vList.Names[i]) then
              Select_Str := ' checked="checked" '
            else
              Select_Str := '';
            if length(Select_Item)>3 then Select_Item := '';
            Html_Row := Html_Row +
            '				<tr>'+
            '					<td>&nbsp;&nbsp;&nbsp;'+
            '						<input type=checkbox name=checkbox id=checkbox'+IntToStr(i)+' value='+vList.Names[i]+Select_Str+Atr_Enable+'>'+Select_Item+vList.ValueFromIndex[i]+'<br>'+
            '					</td>'+
            '				</tr>';
          end;
      end;
      3:begin 
        for i:=0 to vList.Count-1 do
          begin
            if cdsAnswer.Locate('QUESTION_ITEM_ID',cdsQuestion.FieldbyName('QUESTION_ITEM_ID').AsString,[]) then
            begin
              if cdsAnswer.FieldByName('ANSWER_VALUE').AsString <> '' then
                Select_Str := cdsAnswer.FieldByName('ANSWER_VALUE').AsString;
            end;
            Html_Row := Html_Row +
            '				<tr>'+
            '					<td>&nbsp;&nbsp;&nbsp;'+vList.Strings[i]+'(150字以内!)'+
            '           <br>&nbsp;&nbsp;&nbsp;'+
            '           <textarea rows="6" cols="50" name=textarea '+Atr_Enable+'>'+Select_Str+'</textarea>'+
            '					</td>'+
            '				</tr>';
          end;
      end;
    end;


  finally
    vList.Free;
  end;
  Result := Html_Row;
end;

procedure TfrmQuestionnaire.SetQuestionNum;
begin
  SetAlready;
  labCURRENT.Caption := cdsQuestion.FieldbyName('SEQ_NO').AsString;
  labALREADY.Caption := IntToStr(Already_Num);
end;

procedure TfrmQuestionnaire.btnNextClick(Sender: TObject);
begin
  inherited;
  if cdsQuestion.FieldByName('SEQ_NO').AsInteger = Sum_Num then
    raise Exception.Create('这已经是最后一题了');
  if IsEnable then
    BrowserRead;
  cdsQuestion.Next;
  WriteBrowser;
  SetQuestionNum;
end;

procedure TfrmQuestionnaire.btnPreviousClick(Sender: TObject);
begin

  inherited;
  if cdsQuestion.FieldByName('SEQ_NO').AsInteger = 1 then
    raise Exception.Create('这已经是第一题了');
  if IsEnable then
    BrowserRead;
  cdsQuestion.Prior;
  WriteBrowser;
  SetQuestionNum;
end;

procedure TfrmQuestionnaire.BrowserRead;
var Doc:IHTMLDocument2;
    Ec:IHTMLElementCollection;
    Obe:IHTMLOptionButtonElement;
    TextArea:IHTMLTextAreaElement;
    i:Integer;
    Str_Value:String;
begin
  Doc := WebBrowser1.Document as IHTMLDocument2;

  case cdsQuestion.FieldByName('QUESTION_ITEM_TYPE').AsInteger of
    1:begin
      Ec := Doc.all.item('Radio',EmptyParam) as IHTMLElementCollection;
      for i:=0 to Ec.length - 1 do
        begin
          Obe := Ec.Item(i,EmptyParam) as IHTMLOptionButtonElement;
          if Obe.checked = True then
            begin
              if Str_Value <> '' then
                Str_Value := Str_Value + ','+ Obe.value
              else
                Str_Value := Obe.value;
            end;
        end;
    end;
    2:begin
      Ec := Doc.all.item('checkbox',EmptyParam) as IHTMLElementCollection;
      for i:=0 to Ec.length - 1 do
        begin
          Obe := Ec.Item(i,EmptyParam) as IHTMLOptionButtonElement;
          if Obe.checked = True then
            begin
              if Str_Value <> '' then
                Str_Value := Str_Value + ','+ Obe.value
              else
                Str_Value := Obe.value;
            end;
        end;
    end;
    3:begin
      while WebBrowser1.Busy do
        Application.ProcessMessages;
      for i:=0 to Doc.all.length-1 do
        begin
          Doc.all.item(i,varEmpty).QueryInterface(IHTMLTextAreaElement,TextArea);
          if TextArea <> nil then
            begin
              if Str_Value <> '' then
                Str_Value := Str_Value + ','+ TextArea.value
              else
                Str_Value := TextArea.value;
            end;
          TextArea := nil;
        end;
    end;
  end;

  cdsAnswer.Filtered := False;
  cdsAnswer.Filter:='';
  if cdsAnswer.Locate('QUESTION_ITEM_ID',cdsQuestion.FieldbyName('QUESTION_ITEM_ID').AsString,[]) then
    begin
      cdsAnswer.Edit;
      cdsAnswer.FieldByName('ANSWER_VALUE').AsString := Str_Value;
      cdsAnswer.Post;
    end
  else
    begin
      cdsAnswer.Append;;
      cdsAnswer.FieldByName('ROWS_ID').AsString := TSequence.NewId;
      cdsAnswer.FieldByName('TENANT_ID').AsInteger := Global.TENANT_ID;
      cdsAnswer.FieldByName('SHOP_ID').AsString := Global.SHOP_ID;
      cdsAnswer.FieldByName('QUESTION_ID').AsString := cdsQuestion.FieldbyName('QUESTION_ID').AsString;
      cdsAnswer.FieldByName('QUESTION_ITEM_ID').AsString := cdsQuestion.FieldbyName('QUESTION_ITEM_ID').AsString;
      cdsAnswer.FieldByName('ANSWER_VALUE').AsString := Str_Value;
      cdsAnswer.Post;
    end;
end;

procedure TfrmQuestionnaire.SetAlready;
begin
  cdsAnswer.Filtered := False;
  cdsAnswer.Filter := ' ANSWER_VALUE <> '''' ';
  cdsAnswer.Filtered := True;
  Already_Num := cdsAnswer.RecordCount;
end;

procedure TfrmQuestionnaire.btnCommitClick(Sender: TObject);
begin
  inherited;
  BrowserRead;
  SetAlready;
  if Already_Num <> Sum_Num then
    Raise Exception.Create('还有问题没有回答,不能提交!');
  SaveAnswer;
  cdsQuestionList.Edit;
  cdsQuestionList.FieldByName('QUESTION_ANSWER_STATUS').AsString := '1';
  cdsQuestionList.Post;
  RzPage.ActivePageIndex := 0;
  RzPanel3.Visible := False;
  RzPanel35.Visible := True;
  RzPanel12.Visible := False;
  edtSHOP_ID.Caption := '';
  edtANSWER_USER.Caption := '';
  edtANSWER_DATE.Caption := '';
  ledANSWER_USE_TIME.Caption := '00:00';
  Timer1.Enabled := False;
end;

procedure TfrmQuestionnaire.SaveAnswer;
begin
  cdsListAnswer.Edit;
  cdsListAnswer.FieldByName('ANSWER_DATE').AsString := edtANSWER_DATE.Caption;
  cdsListAnswer.FieldByName('ANSWER_USER').AsString := Global.UserID;
  cdsListAnswer.FieldByName('ANSWER_USE_TIME').AsInteger := SecondsBetween(Now(),BeginDateTime);
  cdsListAnswer.FieldByName('QUESTION_FEEDBACK_STATUS').AsInteger := 1;
  cdsListAnswer.FieldByName('QUESTION_ANSWER_STATUS').AsInteger := 1;
  cdsListAnswer.Post;
  Factor.BeginBatch;
  try
    Factor.AddBatch(cdsListAnswer,'TInvest');
    Factor.AddBatch(cdsAnswer,'TInvestData');
    Factor.CommitBatch;
  Except
    Factor.CancelBatch;
    Raise;
  end;

  QID := cdsListAnswer.FieldbyName('QUESTION_ID').AsString;
  SyncQuestion(2);
  
end;

procedure TfrmQuestionnaire.SetListAnswer;
var SQL_Str:String;
begin
  SQL_Str :=
  'select TENANT_ID,QUESTION_ID,SHOP_ID,ANSWER_DATE,ANSWER_USER,ANSWER_USE_TIME,QUESTION_FEEDBACK_STATUS,'+
  'QUESTION_ANSWER_STATUS from MSC_INVEST_LIST where QUESTION_ID=:QUESTION_ID and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID';
  cdsListAnswer.Close;
  cdsListAnswer.SQL.Text := SQL_Str;
  cdsListAnswer.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
  cdsListAnswer.Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
  cdsListAnswer.Params.ParamByName('QUESTION_ID').AsString := cdsQuestionList.FieldbyName('QUESTION_ID').AsString;
  Factor.Open(cdsListAnswer);

  {cdsListAnswer.Append;
  cdsListAnswer.FieldByName('TENANT_ID').AsString := IntToStr(Global.TENANT_ID);
  cdsListAnswer.FieldByName('QUESTION_ID').AsString := cdsQuestion.FieldbyName('QUESTION_ID').AsString;
  cdsListAnswer.FieldByName('SHOP_ID').AsString := Global.SHOP_ID;
  cdsListAnswer.FieldByName('ANSWER_DATE').AsString := edtANSWER_DATE.Caption;
  cdsListAnswer.FieldByName('ANSWER_USER').AsString := Global.UserID;
  cdsListAnswer.FieldByName('ANSWER_USE_TIME').AsInteger := SecondsBetween(Now(),BeginDateTime);
  cdsListAnswer.FieldByName('QUESTION_FEEDBACK_STATUS').AsInteger := 1;
  cdsListAnswer.FieldByName('QUESTION_ANSWER_STATUS').AsInteger := 2;
  cdsListAnswer.Post;}
end;

procedure TfrmQuestionnaire.GetQuestionList;
var
  C1,C2,C3,C4:Integer;
begin
  if not ShopGlobal.GetChkRight('91600004',1) then Raise Exception.Create('你没有查询的权限,请和管理员联系.');

  cdsQuestionList.Close;
  cdsQuestionList.SQL.Text :=
  'select a.QUESTION_ID,a.QUESTION_CLASS,a.ISSUE_DATE,a.QUESTION_SOURCE,a.QUESTION_TITLE,a.ANSWER_FLAG,a.END_DATE,b.QUESTION_ANSWER_STATUS '+
  'from MSC_QUESTION a inner join MSC_INVEST_LIST b on a.TENANT_ID=b.TENANT_ID and a.QUESTION_ID=b.QUESTION_ID '+
  'where b.TENANT_ID=:TENANT_ID and b.SHOP_ID=:SHOP_ID and a.END_DATE>=:END_DATE and a.COMM not in (''02'',''12'') and b.COMM not in (''02'',''12'') ';
  cdsQuestionList.Params.ParamByName('END_DATE').AsString := FormatDateTime('YYYY-MM-DD',Date());
  cdsQuestionList.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
  cdsQuestionList.Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
  Factor.Open(cdsQuestionList);

  cdsQuestionList.DisableControls;
  try
    C1 := 0;
    C2 := 0;
    C3 := 0;
    C4 := 0;
    cdsQuestionList.First;
    while not cdsQuestionList.Eof do
      begin
        if cdsQuestionList.FieldByName('QUESTION_CLASS').AsString = '1' then
          Inc(C1)
        else if cdsQuestionList.FieldByName('QUESTION_CLASS').AsString = '2' then
          Inc(C2)
        else if cdsQuestionList.FieldByName('QUESTION_CLASS').AsString = '3' then
          Inc(C3)
        else
          Inc(C4);
        cdsQuestionList.Next;
      end;
    QUESTION_SUM.Caption := IntToStr(C1+C2+C3+C4);
    QUESTION1_SUM.Caption := IntToStr(C1);
    QUESTION2_SUM.Caption := IntToStr(C2);
    QUESTION3_SUM.Caption := IntToStr(C3);
    QUESTION4_SUM.Caption := IntToStr(C4);
  finally
    cdsQuestionList.EnableControls;
  end;
  RzPanel12.Visible := False;
end;

procedure TfrmQuestionnaire.DBGridEh1CellClick(Column: TColumnEh);
begin
  inherited;
  //20110813 modif: Col:=0
  if Column.FieldName = 'ANSWER' then
  begin
    DBGridEh1.Col:=0;
    DBGridEh1DblClick(nil);
  end;
end;

procedure TfrmQuestionnaire.btnLookClick(Sender: TObject);
begin
  inherited;
  RzPanel3.Visible := True;
  btnRetrun_Main.Visible := True;
  btnCommit.Visible := False;
  IsEnable := False;
  labSUM.Caption := IntToStr(Sum_Num);
  RzPage.ActivePageIndex := 2;
  RzPanel12.Visible := True;
  RzPanel35.Visible := False;
  AlreadyAnswerInfo;
  GetAnswer;
  GetQuestions;
  cdsQuestion.First;
  WriteBrowser;
  SetQuestionNum;
end;

procedure TfrmQuestionnaire.btnReturnClick(Sender: TObject);
begin
  inherited;
  if RzPage.ActivePageIndex = 1 then RzPage.ActivePageIndex := 0;
end;

procedure TfrmQuestionnaire.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var  ARect: TRect;
  AFont:TFont;
  Str_Answer:String;
begin
  inherited;
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not
    (gdFocused in State) or not DBGridEh1.Focused) then
  begin
    DBGridEh1.Canvas.Brush.Color := clAqua;
  end;

  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if cdsQuestionList.FieldByName('QUESTION_ANSWER_STATUS').AsString = '2' then
    Str_Answer := '答题'
  else
    Str_Answer := '查看';
  if Column.FieldName = 'ANSWER' then
    begin
      ARect := Rect;
      AFont := TFont.Create;
      AFont.Assign(DBGridEh1.Canvas.Font);
      try
        DBGridEh1.canvas.FillRect(ARect);
        DBGridEh1.Canvas.Font.Color := clBlue;
        DBGridEh1.Canvas.Font.Style := [fsUnderline];
        DrawText(DBGridEh1.Canvas.Handle,pchar(Str_Answer),length(Str_Answer),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER);
      finally
        DBGridEh1.Canvas.Font.Assign(AFont);
        AFont.Free;
      end;
    end;
end;

procedure TfrmQuestionnaire.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if DBGridEh1.DataSource.DataSet.FieldByName('QUESTION_ANSWER_STATUS').AsString <> '1' then
    begin
      AFont.Style := [fsBold];
    end;
end;

procedure TfrmQuestionnaire.GetAnswer;
var SQL_Str:String;
begin
  SQL_Str := 'select ROWS_ID,TENANT_ID,SHOP_ID,QUESTION_ID,QUESTION_ITEM_ID,ANSWER_VALUE from MSC_INVEST_ANSWER where QUESTION_ID=:QUESTION_ID and SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID';
  cdsAnswer.Close;
  cdsAnswer.SQL.Text := SQL_Str;
  cdsAnswer.Params.ParamByName('QUESTION_ID').AsString := cdsQuestionList.FieldbyName('QUESTION_ID').AsString;
  cdsAnswer.Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
  cdsAnswer.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
  Factor.Open(cdsAnswer);
end;

procedure TfrmQuestionnaire.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if cdsQuestionList.IsEmpty then Exit;

  RzPage.ActivePageIndex := 1;
  if cdsQuestionList.FieldByName('QUESTION_ANSWER_STATUS').AsString = '1' then
    begin
      if cdsQuestionList.FieldByName('ANSWER_FLAG').AsString = '2' then
        begin
          btnLook.Visible := True;
          btnAnswer.Visible := False;
        end
      else
        begin
          btnLook.Visible := False;
          btnAnswer.Visible := True;
        end;
    end
  else if cdsQuestionList.FieldByName('QUESTION_ANSWER_STATUS').AsString = '2' then
    begin
      btnLook.Visible := False;
      btnAnswer.Visible := True;;
    end;
  GetParams;

end;

procedure TfrmQuestionnaire.AlreadyAnswerInfo;
var rs:TZQuery;
    Timer_Str:String;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select ANSWER_DATE,ANSWER_USER,ANSWER_USE_TIME,ANSWER_USE_TIME from MSC_INVEST_LIST where TENANT_ID=:TENANT_ID and QUESTION_ID=:QUESTION_ID and SHOP_ID=:SHOP_ID  ';
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.Params.ParamByName('QUESTION_ID').AsString := cdsQuestionList.FieldByName('QUESTION_ID').AsString;
    rs.Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
    Factor.Open(rs);

    edtSHOP_ID.Caption := Global.SHOP_NAME;
    edtANSWER_USER.Caption := rs.FieldbyName('ANSWER_USER').AsString;
    edtANSWER_DATE.Caption := rs.FieldbyName('ANSWER_DATE').AsString;
    if (rs.FieldbyName('ANSWER_USE_TIME').AsInteger div 60) < 10 then
      Timer_Str := '0'+IntToStr(rs.FieldbyName('ANSWER_USE_TIME').AsInteger div 60)
    else
      Timer_Str := IntToStr(rs.FieldbyName('ANSWER_USE_TIME').AsInteger div 60);

    if (rs.FieldbyName('ANSWER_USE_TIME').AsInteger mod 60) < 10 then
      Timer_Str := Timer_Str+':0'+ IntToStr(rs.FieldbyName('ANSWER_USE_TIME').AsInteger mod 60)
    else
      Timer_Str := Timer_Str+':'+ IntToStr(rs.FieldbyName('ANSWER_USE_TIME').AsInteger mod 60);

    ledANSWER_USE_TIME.Caption := Timer_Str;
  finally
    rs.Free;
  end;
end;

procedure TfrmQuestionnaire.btnRetrun_MainClick(Sender: TObject);
begin
  inherited;
  RzPage.ActivePageIndex := 0;
  RzPanel12.Visible := False;
  RzPanel35.Visible := True;
  edtSHOP_ID.Caption := '';
  edtANSWER_USER.Caption := '';
  edtANSWER_DATE.Caption := '';
  ledANSWER_USE_TIME.Caption := '00:00';
  RzPanel3.Visible := False;
end;

class function TfrmQuestionnaire.ShowForm(AOwner: TForm): boolean;
begin
  if not ShopGlobal.GetChkRight('91600004',1) then Raise Exception.Create('你没有查询的权限,请和管理员联系.');
  with TfrmQuestionnaire.Create(AOwner) do
    begin
      try
        SyncQuestion(1);
        result := (ShowModal=MROK);
      finally
        free;
      end;
    end;
end;

class function TfrmQuestionnaire.AnswerQustion(AOwner: TForm;ID: String):Boolean;
begin
  if not ShopGlobal.GetChkRight('91600004',3) then Raise Exception.Create('你没有答题的权限,请和管理员联系.');
  with TfrmQuestionnaire.Create(AOwner) do
    begin
      try
        SyncQuestion(1);
        QID := ID;
        result := (ShowModal=MROK);
      finally
        free;
      end;
    end;
end;

procedure TfrmQuestionnaire.SyncQuestion(flag:integer);
var
  Params:TftParamList;
begin
  //本地连接时不需同步
  if Global.RemoteFactory.ConnMode = 1 then Exit;
  if not CaFactory.Audited then Exit;
  if not Global.RemoteFactory.Connected then
     begin
      try
        Global.RemoteFactory.Connect;
      except
        Exit;
      end;
     end;
  Params := TftParamList.Create(nil);
  try
    //同步到本地
    if not ShopGlobal.ONLVersion and (flag=2) then
    begin
      SyncFactory.SyncTimeStamp := CaFactory.TimeStamp;
      SyncFactory.SyncQuestion('MSC_QUESTION','TENANT_ID;QUESTION_ID','TSyncSingleTable',1);
      SyncFactory.SendSingleTable('MSC_INVEST_LIST','TENANT_ID;QUESTION_ID;SHOP_ID','TSyncSingleTable',1);
      SyncFactory.SendSingleTable('MSC_INVEST_ANSWER','TENANT_ID;QUESTION_ID;SHOP_ID;QUESTION_ITEM_ID','TSyncSingleTable',1);
    end;
    Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    Params.ParamByName('QUESTION_ID').AsString := QID;
    Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
    Params.ParamByName('flag').AsInteger := flag;
    try
      Global.RemoteFactory.ExecProc('TSyncQuestion',Params);
    except
      Exit;
    end;
    //同步到本地
    if not ShopGlobal.ONLVersion and (flag=1) then
    begin
      SyncFactory.SyncTimeStamp := CaFactory.TimeStamp;
      SyncFactory.SyncQuestion('MSC_QUESTION','TENANT_ID;QUESTION_ID','TSyncSingleTable',1);
      SyncFactory.SyncSingleTable('MSC_INVEST_LIST','TENANT_ID;QUESTION_ID;SHOP_ID','TSyncSingleTable',1,true);
      SyncFactory.SyncSingleTable('MSC_INVEST_ANSWER','TENANT_ID;QUESTION_ID;SHOP_ID;QUESTION_ITEM_ID','TSyncSingleTable',1,true);
    end;
  finally
    Params.Free;
    frmLogo.Close;
  end;
end;

procedure TfrmQuestionnaire.WebBrowser1DownloadComplete(Sender: TObject);
begin
  inherited;
  waiting := false;
end;

procedure TfrmQuestionnaire.LoadPic32;
var
  sflag:String;
begin
  sflag := 's'+rcFactory.GetResString(1)+'_';
  //Top
  Image2.Picture.Graphic := rcFactory.GetBitmap(sflag + 'NewsPaperReader_Mid2');
  Image3.Picture.Graphic := rcFactory.GetBitmap(sflag + 'NewsPaperReader_Mid3');
  //Right
  btnPrevious.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Previous_Hot');
  btnPrevious.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Previous_Up');
  btnNext.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Next_Up');
  btnNext.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Next_Hot');
  btnCommit.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Commit_Up');
  btnCommit.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Commit_Hot');
  btnAnswer.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Answer_Up');
  btnAnswer.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Answer_Hot');
  btnReturn.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Return_Up');
  btnReturn.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Return_Hot');
  btnLook.Bitmaps.Up := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Look_Up');
  btnLook.Bitmaps.Hot := rcFactory.GetBitmap(sflag + 'Questionnaire_Left_Look_Hot');
end;

end.
