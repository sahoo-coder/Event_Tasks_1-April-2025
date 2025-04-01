page 50350 "Log Details Page_KSS"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    Editable = false;
    SourceTable = "Log Details";

    layout
    {
        area(Content)
        {
            repeater("Log Details_KSS")
            {
                field(user_name; Rec.user_name)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field(message; Rec.message)
                {
                    ApplicationArea = All;
                    Caption = 'Message';
                }
                field(item_no; Rec.item_no)
                {
                    ApplicationArea = All;
                    Caption = 'Item Number';
                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}