{ //************************************************************// }
{ //                                                            // }
{ //         C�digo gerado pelo assistente                      // }
{ //                                                            // }
{ //         Projeto MVCBr                                      // }
{ //         tireideletra.com.br  / amarildo lacerda            // }
{ //************************************************************// }
{ // Data: 18/06/2017 02:33:14                                  // }
{ //************************************************************// }
{
  C�digo fornecidor por: Carlos Dias da Silva (Dex)
}

Unit WinNotification.Model.Interf;

interface

uses System.SysUtils, {$IFDEF FMX} FMX.Forms, {$ELSE} VCL.Forms, {$ENDIF}
  System.Classes, MVCBr.Interf, MVCBr.Model,
  MVCBr.Controller, System.Notification;

Type
  // Interface de acesso ao model
  IWinNotificationModel = interface(IModel)
    ['{121434F8-4955-40A9-925B-AC9D4E8A3B9E}']
    // incluir aqui as especializa��es
    function Send(const AName: String; const ASubject: String;
      const AMessage: String): Boolean;
  end;

Implementation

end.
