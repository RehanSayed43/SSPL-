pageextension 50040 PostedSaleMemo extends "Posted Sales Credit Memo"
{
    layout
    {
        addlast(General)
        {
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