unit Unit2;

interface

uses Windows, Messages, Classes;

type
  TAncestor = class(TComponent)
  private
    FOnRefreshComplete: TNotifyEvent;
    procedure SetOnRefreshComplete(const Value: TNotifyEvent);
  protected
    procedure DoRefreshComplete;virtual;
  published
    property OnRefreshComplete: TNotifyEvent read FOnRefreshComplete write SetOnRefreshComplete;
  end;

  TOffSpring = class(TAncestor)
  protected
    procedure DoRefreshComplete;override;
  published
    property OnRefreshComplete;
  end;

implementation

{ TAncestor }

procedure TAncestor.DoRefreshComplete;
begin
  if Assigned(FOnRefreshComplete) then
    FOnRefreshComplete(Self);
end;

procedure TAncestor.SetOnRefreshComplete(const Value: TNotifyEvent);
begin
  FOnRefreshComplete := Value;
end;

{ TOffSpring }

procedure TOffSpring.DoRefreshComplete;
begin
  inherited;
  ShowMessage('put my own codes here');
end;

end.
