// pageextension 50011 ItemJournalPageext extends "Item Journal"
// {
//     layout
//     {
//         addafter("Document No.")
//         {
//             field("Approval Status"; Rec."Approval Status")
//             {
//                 ApplicationArea = all;
//             }
//         }
//         // Add changes to page layout here
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }