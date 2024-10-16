tableextension 50039 MyExtension extends "Sales Cr.Memo Header"
{
    fields
    {
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