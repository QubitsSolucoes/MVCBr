unit TestMVCBr.Controller;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, System.SysUtils, System.Generics.Collections, System.TypInfo,
  MVCBr.Interf, MVCBr.Model, MVCBr.ApplicationController,
  System.RTTI, MVCBr.View, System.Classes,
  MVCBr.Controller;

type

  // Test methods for class TControllerFactory
  TTestModel = class(TModelFactory)
  end;

  TTestView = class(TViewFactory)
  end;

  TestTControllerFactory = class(TTestCase)
  strict private
    FControllerFactory: TControllerFactory;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestID;
    procedure TestGetModelByID;
    procedure TestDoCommand;
    procedure TestGetModel;
    procedure TestGetModelByType;
    procedure TestInit;
    procedure TestBeforeInit;
    procedure TestAfterInit;
    procedure TestGetView;
    procedure TestView;
    procedure TestThis;
    procedure TestControllerAs;
    procedure TestAdd;
    procedure TestIndexOf;
    procedure TestIndexOfModelType;
    procedure TestDelete;
    procedure TestCount;
    procedure TestForEach;
    procedure TestForEachFunc;
    procedure TestUpdateAll;
    procedure TestUpdateByModel;
    procedure TestUpdateByView;
    procedure TestResolveController;
    procedure TestRevokeController;

    procedure TestApplicationControllerResolveController;
    procedure TestResolveControllerName;

    procedure TestRegisterObserver;
    procedure TestUnRegisterObserverNamed;
    procedure TestUnRegisterObserverNamedOnly;
    procedure TesteObserver;

  end;

implementation

uses Test.Controller, Test.Controller.Interf, TestSecond.Controller.Interf;

procedure TestTControllerFactory.SetUp;
begin
  FControllerFactory := TControllerFactory.Create;
  FControllerFactory.add(TMVCBr.InvokeCreate<IModel>(TTestModel)
    .ID('teste.model'));
  FControllerFactory.View(TMVCBr.InvokeCreate<IView>(TTestView));
end;

procedure TestTControllerFactory.TearDown;
begin
  // FControllerFactory.Free;
  FControllerFactory := nil;
end;

procedure TestTControllerFactory.TestID;
var
  ReturnValue: IController;
  AID: string;
begin
  // TODO: Setup method call parameters
  AID := FControllerFactory.ClassName;
  ReturnValue := FControllerFactory.ID(AID);
  CheckNotNull(ReturnValue, 'N�o incializou o IController');
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestGetModelByID;
var
  ReturnValue: IModel;
  AID: string;
begin
  // TODO: Setup method call parameters
  ReturnValue := FControllerFactory.GetModelByID('Teste.Model');
  CheckNotNull(ReturnValue);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestDoCommand;
var
  ACommand: string;
begin
  // TODO: Setup method call parameters
  FControllerFactory.DoCommand(ACommand, []);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TesteObserver;
begin

end;

procedure TestTControllerFactory.TestGetModel;
var
  ReturnValue: IModel;
  idx: Integer;
begin
  // TODO: Setup method call parameters
  idx := FControllerFactory.Count - 1;
  ReturnValue := FControllerFactory.GetModel(idx);
  CheckNotNull(ReturnValue);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestGetModelByType;
var
  ReturnValue: IModel;
  AModelType: TModelType;
begin
  // TODO: Setup method call parameters
  AModelType := mtCommon;
  ReturnValue := FControllerFactory.GetModelByType(AModelType);
  CheckNotNull(ReturnValue);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestInit;
begin
  FControllerFactory.Init;
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestRegisterObserver;
begin
  FControllerFactory.RegisterObserver(FControllerFactory);
end;

procedure TestTControllerFactory.TestResolveController;
var
  ctrl: ITestController;
begin
  ctrl := FControllerFactory.ResolveController<ITestController>;
  CheckNotNull(ctrl, 'N�o inicializou o controller');
end;

procedure TestTControllerFactory.TestRevokeController;
var
  AController: ITestSecondController2;
  ARefCount: Integer;
begin
  ApplicationController.RevokeController(ITestSecondController2);
  AController := ApplicationController.ResolveController(ITestSecondController2)
    as ITestSecondController2;
  ARefCount := AController.this.RefCount;

  CheckTrue(AController.GetStubInt = 0, 'Contador n�o foi incilizado com 1');
  AController.IncContador;
  CheckTrue(AController.GetStubInt = 1, 'Contador n�o foi incrementado para 2');

  // AController := nil ; // mata o controller
  ApplicationController.RevokeController(ITestSecondController2);
  AController := ApplicationController.ResolveController(ITestSecondController2)
    as ITestSecondController2;

  CheckTrue(AController.this.RefCount = ARefCount,
    'Contador de referencia n�o se manteve');

  ApplicationController.RevokeController(ITestSecondController2);
  CheckTrue(AController.GetStubInt2 = 0, 'Instancia nao foi reinicializada');
  AController := nil; // mata o controller

end;

procedure TestTControllerFactory.TestBeforeInit;
begin
  FControllerFactory.BeforeInit;
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestAfterInit;
begin
  FControllerFactory.AfterInit;
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestApplicationControllerResolveController;
var
  ctrl: ITestController;
begin
  ctrl := ApplicationController.ResolveController(ITestController)
    as ITestController;
  CheckNotNull(ctrl, 'n�o executou  resolvecontroller do application');
end;

procedure TestTControllerFactory.TestResolveControllerName;
var
  ctrl: ITestController;
begin
  ctrl := TControllerAbstract.resolve(TTestController.ClassName)
    as ITestController;
  CheckNotNull(ctrl, 'n�o executou  resolvecontroller do application');
end;

procedure TestTControllerFactory.TestGetView;
var
  ReturnValue: IView;
begin
  ReturnValue := FControllerFactory.GetView;
  CheckNotNull(ReturnValue);

  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestView;
var
  ReturnValue: IController;
  AView: IView;
begin
  // TODO: Setup method call parameters
  AView := FControllerFactory.GetView;
  CheckNotNull(AView, 'A View n�o foi inicializa');
  ReturnValue := FControllerFactory.View(AView);
  CheckNotNull(ReturnValue, 'N�o retornou a view');

  CheckSame(ReturnValue, FControllerFactory.GetView.GetController,
    'Mudou o Controller, quando o esperado � que continuaria o mesmo');
  CheckSame(AView, FControllerFactory.GetView,
    'Mudou a View, quando o esperado � que continuaria a mesma');

  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestThis;
var
  ReturnValue: TControllerAbstract;
begin
  ReturnValue := FControllerFactory.this;
  CheckNotNull(ReturnValue);
  // TODO: Validate method results

  CheckTrue(ReturnValue.this.InheritsFrom(TControllerFactory),
    'N�o herdou de TControllerFactory');

end;

procedure TestTControllerFactory.TestControllerAs;
var
  ReturnValue: TControllerFactory;
begin
  ReturnValue := FControllerFactory.ControllerAs;
  CheckNotNull(ReturnValue);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestAdd;
var
  ReturnValue: Integer;
  AModel: IModel;
begin
  // TODO: Setup method call parameters
  AModel := TTestModel.New<IModel>(TTestModel);
  ReturnValue := FControllerFactory.add(AModel);
  CheckTrue(ReturnValue > 0);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestIndexOf;
var
  ReturnValue: Integer;
  AModel: IModel;
begin
  // TODO: Setup method call parameters
  AModel := FControllerFactory.GetModel(0);
  ReturnValue := FControllerFactory.IndexOf(AModel);
  CheckTrue(ReturnValue = 0);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestIndexOfModelType;
var
  ReturnValue: Integer;
  AModelType: TModelType;
begin
  // TODO: Setup method call parameters
  AModelType := mtCommon;
  ReturnValue := FControllerFactory.IndexOfModelType(AModelType);
  CheckTrue(ReturnValue >= 0);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestDelete;
var
  Index: Integer;
begin
  // TODO: Setup method call parameters
  Index := FControllerFactory.Count - 1;
  FControllerFactory.Delete(Index);
  CheckTrue(Index = FControllerFactory.Count);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestCount;
var
  ReturnValue: Integer;
begin
  ReturnValue := FControllerFactory.Count;
  CheckTrue(ReturnValue > 0);
  CheckTrue(ReturnValue > 0);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestForEach;
var
  AProc: TProc<IModel>;
  rt: boolean;
begin
  rt := false;
  // TODO: Setup method call parameters
  AProc := procedure(Mdl: IModel)
    begin
      rt := true;
    end;
  FControllerFactory.ForEach(AProc);
  CheckTrue(rt);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestForEachFunc;
var
  AProc: TProc<IModel>;
  rt: boolean;
begin
  rt := false;
  // TODO: Setup method call parameters
  AProc := procedure(Mdl: IModel)
    begin
      rt := true;
    end;
  FControllerFactory.ForEach(AProc);
  CheckTrue(rt);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestUnRegisterObserverNamed;
begin
  FControllerFactory.RegisterObserver('x');

end;

procedure TestTControllerFactory.TestUnRegisterObserverNamedOnly;
begin

end;

procedure TestTControllerFactory.TestUpdateAll;
var
  ReturnValue: IController;
begin
  ReturnValue := FControllerFactory.UpdateAll;
  CheckNotNull(ReturnValue);
  // TODO: Validate method results
end;

procedure TestTControllerFactory.TestUpdateByModel;
var
  ReturnValue: IController;
  AModel: IModel;
begin
  // TODO: Setup method call parameters

  ReturnValue := FControllerFactory.UpdateByModel(AModel);
  // TODO: Validate method results
  CheckNotNull(ReturnValue);
end;

procedure TestTControllerFactory.TestUpdateByView;
var
  ReturnValue: IController;
  AView: IView;
begin
  // TODO: Setup method call parameters
  AView := FControllerFactory.GetView;
  ReturnValue := FControllerFactory.UpdateByView(AView);
  CheckNotNull(ReturnValue);
  // TODO: Validate method results
end;

{ TTestControllerFactory }

initialization

TMVCBr.RegisterInterfaced<IModel>('Teste.Model', IModel, TTestModel, true);
// Register any test cases with the test runner
RegisterTest(TestTControllerFactory.Suite);

end.
