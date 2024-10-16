tableextension 50022 "Posted Sales invoice" extends "Sales Invoice Header"
{
    fields
    {
        field(50002; "Policy No"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Policy No';
        }
        field(50003; "Policy From Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Policy From date';
        }
        field(50004; "Policy To Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Policy To date';
        }

        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}