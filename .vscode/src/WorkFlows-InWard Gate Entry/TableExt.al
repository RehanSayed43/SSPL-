// tableextension 50145 "Inward-Approval" extends "Gate Entry Header"
// {
//     //REHAN CCIT
//     fields
//     {
//         field(50001; "Approval Status"; Enum "Workflow-Enums Status")
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//             //AutoIncrement=true;

//         }

//     }

//     keys
//     {
//         // Add changes to keys here
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }
//     trigger OnInsert()
//     var
//         myInt: Integer;
//     begin


//     end;

//     var
//         myInt: Integer;
// }