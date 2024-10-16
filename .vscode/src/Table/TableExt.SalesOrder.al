tableextension 50018 SalesOrder extends "Sales Header"
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
        field(50005; Remark; Text[100])
        {
            DataClassification = ToBeClassified;
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