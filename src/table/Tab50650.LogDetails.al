table 50650 "Log Details"
{
    DataClassification = ToBeClassified;
    Caption = 'Log Details Of Currently Sales Order Posted';

    fields
    {
        field(1; entryNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; user_name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; message; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; item_no; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; entryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}