// pageextension 50131 "FA-Approval" extends "Fixed Asset Card"
// {
//     //REHAN CCIT
//     layout
//     {
//         addlast(General)
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

//         addafter("Maintenance &Registration")
//         {
//             group(Approval)
//             {
//                 Caption = 'Approval';

//                 action(Approve)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Approve';
//                     Image = Approve;
//                     ToolTip = 'Approve the requested changes.';
//                     Visible = OpenApprovalEntriesExistCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
//                     end;
//                 }
//                 action(Reject)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Reject';
//                     Image = Reject;
//                     ToolTip = 'Reject the approval request.';
//                     Visible = OpenApprovalEntriesExistCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
//                     end;
//                 }
//                 action(Delegate)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Delegate';
//                     Image = Delegate;
//                     ToolTip = 'Delegate the approval to a substitute approver.';
//                     Visible = OpenApprovalEntriesExistCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
//                     end;
//                 }
//                 action(Comment)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Comments';
//                     Image = ViewComments;
//                     ToolTip = 'View or add comments for the record.';
//                     Visible = OpenApprovalEntriesExistCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.GetApprovalComment(Rec);
//                     end;
//                 }
//                 action(ApprovalEntries)
//                 {
//                     AccessByPermission = TableData "Approval Entry" = R;
//                     ApplicationArea = Suite;
//                     Caption = 'Approvals';
//                     Image = Approvals;
//                     ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

//                     trigger OnAction()
//                     begin
//                         ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
//                     end;
//                 }

//             }
//             group("Request Approval")

//             {
//                 Caption = 'Request Approval';
//                 Image = SendApprovalRequest;
//                 action("Send Approval Request")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Send Approval Request';
//                     Image = Archive;
//                     trigger OnAction()
//                     var
//                         ApprovalMgmt: Codeunit "Approval Mgmt. FA";
//                     begin
//                         // Rec.TestField(Description);
//                         // Rec.TestField("Sell-to Customer Name");
//                         // Rec.TestField("Location Code LFS");
//                         // Rec.TestField("Project Manager");
//                         // Rec.TestField("Package No.");
//                         // if Confirm(ConfrmMsg, true) then
//                         ApprovalMgmt.onSendJobsForApproval(Rec);
//                     end;
//                 }
//                 action("Cancel Approval Request")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Cancel Approval Request';
//                     Image = Archive;
//                     //PromotedCategory = Process;
//                     //PromotedOnly = true;
//                     //Promoted = true;

//                     trigger OnAction()
//                     var
//                         ApprovalMgmt: Codeunit "Approval Mgmt. FA";
//                         WorkFlowWebhookMgmt: Codeunit "Workflow Webhook Management";
//                     begin
//                         ApprovalMgmt.onCancelJobApprovalRequest(Rec);
//                         WorkFlowWebhookMgmt.FindAndCancel(Rec.RecordId);
//                     end;
//                 }
//                 action(Reopen)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Reopen Approval Request';
//                     Image = Archive;
//                     //PromotedCategory = Process;
//                     //PromotedOnly = true;
//                     //Promoted = true;

//                     trigger OnAction()
//                     begin
//                         if (rec."Approval Status" = Rec."Approval Status"::Approved) Or (rec."Approval Status" = Rec."Approval Status"::Cancelled) then begin
//                             Rec."Approval Status" := Rec."Approval Status"::Open;
//                             Rec.Modify();
//                         end else
//                             Error('Approval Status should be Approved or Rejected');
//                         // LFSCommonCU.StoreJobDocument(Rec, true);
//                     end;
//                 }
//                 action("Approvals Entry")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Approvals';
//                     Ellipsis = true;
//                     Image = Approvals;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     var
//                         ApprovalEntries: Page "Approval Entries";
//                         ApprovalEntry: Record "Approval Entry";
//                     begin
//                         ApprovalEntry.SetCurrentkey("Table ID", "Document No.");
//                         ApprovalEntry.SetRange("Table ID", 5600);
//                         ApprovalEntry.SetRange("Document No.", Rec."No.");
//                         ApprovalEntries.SetTableview(ApprovalEntry);
//                         ApprovalEntries.Run;
//                     end;
//                 }
//             }
//         }
//         // area(Promoted)
//         // {
//         //     group(Category_Process)
//         //     {
//         //         // actionref("Create Purchase Quo_Promoted"; "Create Purchase Quotation") { }
//         //         // actionref("Purchase Quotes_Promoted"; "Purchase Quotes") { }
//         //         //actionref("Create Vendor Cont_Promoted"; "Create Vendor Contrcat") { }

//         //         // actionref("Attachment Option_Promoted"; DocAttach) { }
//         //         // actionref("Create Customer Contract_Promoted"; "Create Customer Contract") { }
//         //         // actionref("Customer Contract_Promoted"; "Customer Contract") { }
//         //         // actionref("Contract PO Details_Promoted"; "Contract PO Details") { }
//         //     }
//         //     group(Category_Category4)
//         //     {
//         //         Caption = 'Request Approval';
//         //         actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
//         //         {
//         //         }
//         //         actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
//         //         {
//         //         }
//         //         actionref(Reopen_Promoted; Reopen)
//         //         {
//         //         }
//         //     }
//         //     group(Category_Category5)
//         //     {
//         //         Caption = 'Approval';
//         //         actionref(Approve_Promoted; Approve)
//         //         {

//         //         }
//         //         actionref(Reject_Promoted; Reject)
//         //         {

//         //         }
//         //         actionref(Delegate_Promoted; Delegate)
//         //         {

//         //         }
//         //         actionref(Comment_Promoted; Comment)
//         //         {

//         //         }
//         //     }

//         addlast(processing)
//         {
//             group(Category_Process31)
//             {

//             }
//             group(Category_Category41)
//             {
//                 Caption = 'Request Approval';

//             }
//             group(Category_Category51)
//             {
//                 Caption = 'Approval';



//             }

//         }

//     }
//     trigger OnAfterGetCurrRecord()

//     begin
//         OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
//         OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);//Send Approval
//         CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);//Cancel Approval
//     end;





//     // Add changes to page actions here

//     var
//         myInt: Integer;
//         OpenApprovalEntriesExistForCurrUser: Boolean;
//         OpenApprovalEntriesExist: Boolean;
//         CanCancelApprovalForRecord: Boolean;


//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//         OpenApprovalEntriesExistCurrUser: Boolean;
// }
