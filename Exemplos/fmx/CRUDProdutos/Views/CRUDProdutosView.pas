{ //************************************************************// }
{ //                                                            // }
{ //         C�digo gerado pelo assistente                      // }
{ //                                                            // }
{ //         Projeto MVCBr                                      // }
{ //         tireideletra.com.br  / amarildo lacerda            // }
{ //************************************************************// }
{ // Data: 28/03/2017 22:19:50                                  // }
{ //************************************************************// }
/// <summary>
/// Uma View representa a camada de apresenta��o ao usu�rio
/// deve esta associado a um controller onde ocorrer�
/// a troca de informa��es e comunica��o com os Models
/// </summary>
unit CRUDProdutosView;

interface

uses
{$IFDEF FMX}FMX.Forms, {$ELSE}VCL.Forms, {$ENDIF}
  System.SysUtils, System.Classes, MVCBr.Interf,
  MVCBr.View, MVCBr.FormView, MVCBr.Controller, System.Rtti, FMX.Grid.Style,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, FMX.StdCtrls, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope,
  Data.DB,

  oData.Comp.Client,
  MVCBr.ODataDatasetBuilder,
  MVCBr.ODataFDMemTable,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  FMX.Types,
  FMX.Controls, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid;

type
  /// Interface para a VIEW
  ICRUDProdutosView = interface(IView)
    ['{44142BA9-765B-44E3-A59D-91B39AA4F7F9}']
    // incluir especializacoes aqui
  end;

  /// Object Factory que implementa a interface da VIEW
  TCRUDProdutosView = class(TFormFactory { TFORM } , IView,
    IThisAs<TCRUDProdutosView>, ICRUDProdutosView, IViewAs<ICRUDProdutosView>)
    StringGrid1: TStringGrid;
    ODataFDMemTable1: TODataFDMemTable;
    ODataDatasetBuilder1: TODataDatasetBuilder;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FInited: Boolean;
  protected
    procedure Init;
    function Controller(const aController: IController): IView; override;
  public
    { Public declarations }
    class function New(aController: IController): IView;
    function This: TObject; override;
    function ThisAs: TCRUDProdutosView;
    function ViewAs: ICRUDProdutosView;
    function ShowView(const AProc: TProc<IView>): integer; override;
    function UpdateView: IView; override;
  end;

Implementation

{$R *.FMX}

function TCRUDProdutosView.UpdateView: IView;
begin
  result := self;
  { codigo para atualizar a View vai aqui... }
end;

function TCRUDProdutosView.ViewAs: ICRUDProdutosView;
begin
  result := self;
end;

class function TCRUDProdutosView.New(aController: IController): IView;
begin
  result := TCRUDProdutosView.create(nil);
  result.Controller(aController);
end;

procedure TCRUDProdutosView.Button1Click(Sender: TObject);
begin
  ODataDatasetBuilder1.execute;
end;

procedure TCRUDProdutosView.Button2Click(Sender: TObject);
begin
  ODataFDMemTable1.ApplyUpdates();
end;

function TCRUDProdutosView.Controller(const aController: IController): IView;
begin
  result := inherited Controller(aController);
  if not FInited then
  begin
    Init;
    FInited := true;
  end;
end;

procedure TCRUDProdutosView.Init;
begin
  // incluir incializa��es aqui
end;

function TCRUDProdutosView.This: TObject;
begin
  result := inherited This;
end;

function TCRUDProdutosView.ThisAs: TCRUDProdutosView;
begin
  result := self;
end;

function TCRUDProdutosView.ShowView(const AProc: TProc<IView>): integer;
begin
  inherited;
end;

end.
