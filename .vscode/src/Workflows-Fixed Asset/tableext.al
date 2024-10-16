// tableextension 50130 "FA-Approval" extends "Fixed Asset"
// {
//     //REHAN CCIT
//     fields
//     {
//         field(50023; "Approval Status"; Enum "Workflow-Enums Status1")
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//             //AutoIncrement=true;

//         }
//         // Add changes to table fields here
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
//         Rec.Blocked := true;


//     end;

//     var
//         myInt: Integer;
// }