pageextension 50041 POPage extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field(Remarks; Rec.Remarks)
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