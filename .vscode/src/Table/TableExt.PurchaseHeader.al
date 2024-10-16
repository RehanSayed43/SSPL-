tableextension 50134 PO extends "Purchase Header"
{
    fields
    {
        field(50001; "Remarks"; Text[100])
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