pageextension 50036 MyExtension extends "Company Information"
{
    layout
    {
        addafter("Bank Account No.")
        {
            field("Drug Liscense No."; Rec."Drug Liscense No.")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}