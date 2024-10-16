pageextension 50029 SalesOrderPage extends "Sales Order"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Policy No"; Rec."Policy No")
            {
                ApplicationArea = all;
            }
            field("Policy From Date"; Rec."Policy From Date")
            {
                ApplicationArea = all;
            }
            field("Policy To Date"; Rec."Policy To Date")
            {
                ApplicationArea = all;
            }
            field(Remark; Rec.Remark)
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