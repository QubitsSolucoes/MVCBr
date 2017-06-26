PROGRAM ACBrExemplo;


// C�digo gerado pelo Assistente MVCBr OTA

// www.tireideletra.com.br

// Amarildo Lacerda & Grupo MVCBr-2017

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  MVCBr.ApplicationController,
  MVCBr.Controller,
  Main.Controller in 'controller\Main.Controller.pas',
  MainView in 'view\MainView.pas' {MainView},
  Main.ViewModel.Interf in 'viewmodel\Main.ViewModel.Interf.pas',
  Main.ViewModel in 'viewmodel\Main.ViewModel.pas',
  ACBrUtils.Model.Interf in '..\..\..\ADIn\ACBr\ACBrUtils.Model.Interf.pas',
  ACBrUtils.Model in '..\..\..\ADIn\ACBr\ACBrUtils.Model.pas',
  ACBrValidador.Model.Interf in '..\..\..\ADIn\ACBr\ACBrValidador.Model.Interf.pas',
  ACBrValidador.Model in '..\..\..\ADIn\ACBr\ACBrValidador.Model.pas';

{$R *.res}

begin

  ApplicationController.Run(TMainController.New,

    function: boolean

    begin

      // retornar True se o applicatio pode ser carregado

      // False se n�o foi autorizado inicializa��o

      result := true;

    end);

end.
