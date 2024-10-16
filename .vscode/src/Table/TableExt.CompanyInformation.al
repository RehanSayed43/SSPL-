tableextension 50025 CompanyInfo extends "Company Information"
{
    fields
    {
        field(50012; "Drug Liscense No."; Text[100])
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