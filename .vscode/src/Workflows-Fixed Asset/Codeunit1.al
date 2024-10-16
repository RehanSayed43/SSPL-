// codeunit 50034 "Approval Mgmt. FA"
// {
//     //REHAN CCIT
//     //Customer/Item/Vendor Approval ++
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
//     local procedure OnApproveApprovalRequestStd(var ApprovalEntry: Record "Approval Entry")
//     var
//         // Customer: Record Customer;
//         // RecRef: RecordRef;
//         // CustomerNo: FieldRef;
//         // Item: Record Item;
//         // ItemNo: FieldRef;
//         // Vendor: Record Vendor;
//         // VendorNo: FieldRef;
//         ApprEntry: Record "Approval Entry";
//     begin
//         ApprEntry.Reset();
//         ApprEntry.SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
//         ApprEntry.SetRange(Status, ApprEntry.Status::Open);
//         if ApprEntry.FindFirst() then
//             exit;

//         // If ApprovalEntry."Record ID to Approve".TableNo = Database::Customer then begin
//         //     RecRef := ApprovalEntry."Record ID to Approve".GetRecord();
//         //     CustomerNo := RecRef.Field(1);
//         //     Customer.Get(CustomerNo.Value);
//         //     // Customer."Customer Status" := Customer."Customer Status"::Confirmed;
//         //     Customer.Status := Customer.Status::Approved;
//         //     Customer.Modify();
//         // end;
//         // If ApprovalEntry."Record ID to Approve".TableNo = Database::Item then begin
//         //     RecRef := ApprovalEntry."Record ID to Approve".GetRecord();
//         //     ItemNo := RecRef.Field(1);
//         //     Item.Get(ItemNo.Value);
//         //     Item.Validate(Blocked, false);
//         //     Item.Status := Item.Status::Approved;
//         //     Item.Modify();
//         // end;

//         // If ApprovalEntry."Record ID to Approve".TableNo = Database::Vendor then begin
//         //     RecRef := ApprovalEntry."Record ID to Approve".GetRecord();
//         //     VendorNo := RecRef.Field(1);
//         //     Vendor.Get(VendorNo.Value);
//         //     Vendor.Validate(Blocked, Vendor.Blocked::" ");
//         //     Vendor.Status := Vendor.Status::Approved;
//         //     Vendor.Modify();
//         // end


//     end;

//     [EventSubscriber(ObjectType::Table, Database::"Restricted Record", 'OnAfterInsertEvent', '', false, false)]
//     local procedure OnAfterInsertRestrictedRecord(var Rec: Record "Restricted Record")
//     var
//         Customer: Record Customer;
//         RecRef: RecordRef;
//         CustomerNo: FieldRef;
//         Item: Record Item;
//         ItemNo: FieldRef;
//         Vendor: Record Vendor;
//         VendorNo: FieldRef;
//     begin
//         // If Rec."Record ID".TableNo = Database::Customer then begin
//         //     RecRef := Rec."Record ID".GetRecord();
//         //     CustomerNo := RecRef.Field(1);
//         //     Customer.Get(CustomerNo.Value);
//         //     If Customer.Status <> Customer.Status::"Pending Approval" then begin
//         //         Customer.Status := Customer.Status::"Pending Approval";
//         //         //  Customer."Customer Status" := Customer."Customer Status"::Proposed;
//         //         Customer.Modify();
//         //     end;
//         // end;
//         // If Rec."Record ID".TableNo = Database::Item then begin
//         //     RecRef := Rec."Record ID".GetRecord();
//         //     ItemNo := RecRef.Field(1);
//         //     Item.Get(ItemNo.Value);
//         //     If Item.Status <> Item.Status::"Pending Approval" then begin
//         //         Item.Status := Item.Status::"Pending Approval";
//         //         //  Item."Item Status" := Item."Item Status"::Proposed;
//         //         Item.Modify();
//         //     end;
//         // end;

//         // If Rec."Record ID".TableNo = Database::Vendor then begin
//         //     RecRef := Rec."Record ID".GetRecord();
//         //     VendorNo := RecRef.Field(1);
//         //     Vendor.Get(VendorNo.Value);
//         //     If Vendor.Status <> Vendor.Status::"Pending Approval" then begin
//         //         Vendor.Status := Vendor.Status::"Pending Approval";
//         //         //  Vendor."Vendor Status" := Vendor."Vendor Status"::Proposed;
//         //         Vendor.Modify();
//         //     end;
//         // end
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnAfterRejectSelectedApprovalRequest', '', false, false)]
//     local procedure OnAfterRejectSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry")
//     var
//         Customer: Record Customer;
//         RecRef: RecordRef;
//         CustomerNo: FieldRef;
//         Item: Record Item;
//         ItemNo: FieldRef;
//         Vendor: Record Vendor;
//         VendorNo: FieldRef;
//     begin
//         // If ApprovalEntry."Record ID to Approve".TableNo = Database::Customer then begin
//         //     RecRef := ApprovalEntry."Record ID to Approve".GetRecord();
//         //     CustomerNo := RecRef.Field(1);
//         //     Customer.Get(CustomerNo.Value);
//         //     Customer.Status := Customer.Status::Rejected;
//         //     Customer.Modify();
//         // end;
//         // If ApprovalEntry."Record ID to Approve".TableNo = Database::Item then begin
//         //     RecRef := ApprovalEntry."Record ID to Approve".GetRecord();
//         //     ItemNo := RecRef.Field(1);
//         //     Item.Get(ItemNo.Value);
//         //     Item.Status := Item.Status::Rejected;
//         //     Item.Modify();
//         // end;
//         // If ApprovalEntry."Record ID to Approve".TableNo = Database::Vendor then begin
//         //     RecRef := ApprovalEntry."Record ID to Approve".GetRecord();
//         //     VendorNo := RecRef.Field(1);
//         //     Vendor.Get(VendorNo.Value);
//         //     Vendor.Status := Vendor.Status::Rejected;
//         //     Vendor.Modify();
//         // end
//     end;
//     //Customer/Item/Vendor Approval --

//     //Jobs Execution ++
//     procedure CheckJobApprovalPossible(var FA: Record "Fixed Asset"): Boolean
//     begin
//         if not IsJobWorkFlowEnabled(FA) then
//             Error(NoWorkFlowEnabledErr);

//         exit(true);
//     end;

//     procedure IsJobWorkFlowEnabled(var FA: Record "Fixed Asset"): Boolean
//     begin
//         exit(WorkFlowManagement.CanExecuteWorkflow(FA, RunWorkflowOnSendJobDocForApprovalCode()));
//     end;

//     //Execution--

//     //Publisher++
//     [IntegrationEvent(false, false)]
//     procedure onSendJobsForApproval(var FA: Record "Fixed Asset")
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure onCancelJobApprovalRequest(var FA: Record "Fixed Asset")
//     begin
//     end;
//     //Publisher--

//     //Subscriber++
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. FA", onSendJobsForApproval, '', false, false)]
//     local procedure onSendJobsForApprovalSub(var FA: Record "Fixed Asset");
//     begin
//         WorkFlowManagement.HandleEvent(RunWorkflowOnSendJobDocForApprovalCode, FA);
//     end;


//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. FA", onCancelJobApprovalRequest, '', false, false)]
//     local procedure onCancelJobApprovalRequestSub(var FA: Record "Fixed Asset");
//     begin
//         WorkFlowManagement.HandleEvent(RunWorkflowOnCancelJobDocForApprovalRequestCode(), FA); //RunWorkflowOnSendJobDocForApprovalCode
//     end;
//     //Subscriber--

//     //WorkFlow Code++
//     procedure RunWorkflowOnSendJobDocForApprovalCode(): Code[128]
//     begin
//         EXIT(UPPERCASE('RunWorkflowOnSendFADOCForApprovalCode'));
//     end;

//     procedure RunWorkflowOnCancelJobDocForApprovalRequestCode(): Code[128]
//     begin
//         EXIT(UPPERCASE('RunWorkflowOnCancelFADOCForApprovalrequest'));
//     end;
//     //WorkFlow Code--

//     //WorkFlow Event Handling++
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
//     procedure AddCustomerCardEventToLibrary()
//     var
//         WorkflowEvent: Record "Workflow Event";
//     begin
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendJobDocForApprovalCode(), Database::"Fixed Asset",
//                                                     JobReqDocSendForApprovalEventDescTxt, 0, false);

//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelJobDocForApprovalRequestCode(), Database::"Fixed Asset",
//                                                    JobReqDocCancelledForApprovalEventDescTxt, 0, false);

//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
//     local procedure WorkflowEventHandling_OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
//     begin
//         case EventFunctionName of
//             RunWorkflowOnCancelJobDocForApprovalRequestCode:
//                 WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelJobDocForApprovalRequestCode, RunWorkflowOnSendJobDocForApprovalCode());

//             WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
//                 WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendJobDocForApprovalCode());

//             WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode():
//                 WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendJobDocForApprovalCode());

//             WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode():
//                 WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode(), RunWorkflowOnSendJobDocForApprovalCode());
//         end;
//     end;
//     //WorkFlow Event Handling--

//     //Approval Mgmt. ++
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnBeforeShowCommonApprovalStatus, '', false, false)]
//     local procedure OnBeforeShowCommonApprovalStatus(var RecRef: RecordRef; var IsHandle: Boolean);
//     var
//         FA: Record "Fixed Asset";
//     begin
//         case RecRef.Number of
//             DATABASE::"Fixed Asset":
//                 begin
//                     RecRef.SetTable(FA);

//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnPopulateApprovalEntryArgument, '', false, false)]
//     local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance");
//     var
//         FA: Record "Fixed Asset";
//     begin
//         case RecRef.Number of
//             DATABASE::"Fixed Asset":
//                 begin
//                     RecRef.SetTable(FA);
//                     ApprovalEntryArgument."Document No." := FA."No.";
//                     ApprovalEntryArgument."Table ID" := Database::"Fixed Asset";
//                 end;
//         end;
//     end;
//     //Approval Mgmt. --

//     //Action Handling ++ 
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
//     local procedure ApprovalsMgmt_OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
//     var
//         FA: Record "Fixed Asset";
//     begin
//         Case RecRef.Number Of
//             Database::"Fixed Asset":
//                 begin
//                     RecRef.SetTable(FA);
//                     FA."Approval Status" := FA."Approval Status"::"Pending Approval";
//                     FA.Modify();
//                     IsHandled := true;
//                 end;
//         End;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnApproveApprovalRequest, '', false, false)]
//     local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry");
//     var
//         RecRef: RecordRef;
//         FA: Record "Fixed Asset";
//         ApprovalMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         RecRef.Get(ApprovalEntry."Record ID to Approve");
//         case RecRef.Number of
//             Database::"Fixed Asset":
//                 begin
//                     RecRef.SetTable(FA);
//                     if not ApprovalMgmt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
//                         FA."Approval Status" := FA."Approval Status"::Approved;

//                         FA.Blocked := false;
//                         FA.Modify();
//                     end;
//                 end;
//         End;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnRejectApprovalRequest, '', false, false)]
//     local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry");
//     var
//         RecRef: RecordRef;
//         FA: Record "Fixed Asset";
//         ApprovalMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         RecRef.Get(ApprovalEntry."Record ID to Approve");
//         case RecRef.Number of
//             Database::"Fixed Asset":
//                 begin
//                     RecRef.SetTable(FA);
//                     FA."Approval Status" := FA."Approval Status"::Cancelled;
//                     FA.Modify();
//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", OnReleaseDocument, '', false, false)]
//     local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean);
//     var
//         FA: Record "Fixed Asset";
//     begin
//         case RecRef.Number of
//             Database::"Fixed Asset":
//                 begin
//                     RecRef.SetTable(FA);
//                     FA."Approval Status" := FA."Approval Status"::Approved;
//                     FA.Blocked := false;
//                     FA.Modify();
//                     Handled := true;
//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", OnOpenDocument, '', false, false)]
//     local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean);
//     var
//         FA: Record "Fixed Asset";
//     begin
//         case RecRef.Number of
//             Database::"Fixed Asset":
//                 begin
//                     RecRef.SetTable(FA);
//                     FA."Approval Status" := FA."Approval Status"::Open;
//                     FA.Modify();
//                     Handled := true;
//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", OnConditionalCardPageIDNotFound, '', false, false)]
//     local procedure OnConditionalCardPageIDNotFound(RecordRef: RecordRef; var CardPageID: Integer);

//     begin
//         case RecordRef.Number of
//             Database::"Fixed Asset":
//                 CardPageID := Page::"Fixed Asset Card";
//         end;
//     end;
//     //Action Handling --

//     //WorkFlow Response Handling++
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", OnAddWorkflowResponsePredecessorsToLibrary, '', false, false)]
//     local procedure SubsOnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128]);
//     begin
//         case ResponseFunctionName of
//             WorkFlowResponseHandling.SendApprovalRequestForApprovalCode():
//                 WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SendApprovalRequestForApprovalCode(),
//                 RunWorkflowOnSendJobDocForApprovalCode());

//             WorkFlowResponseHandling.SetStatusToPendingApprovalCode():
//                 WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SetStatusToPendingApprovalCode(),
//                 RunWorkflowOnSendJobDocForApprovalCode());

//             WorkFlowResponseHandling.CancelAllApprovalRequestsCode():
//                 WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CancelAllApprovalRequestsCode(),
//                 RunWorkflowOnCancelJobDocForApprovalRequestCode());

//             WorkFlowResponseHandling.OpenDocumentCode():
//                 WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.OpenDocumentCode(),
//                 RunWorkflowOnCancelJobDocForApprovalRequestCode());


//             WorkFlowResponseHandling.CreateApprovalRequestsCode():
//                 WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CreateApprovalRequestsCode(),
//                 RunWorkflowOnSendJobDocForApprovalCode());
//         end;
//     end;
//     //WorkFlow Response Handling--


//     var
//         WorkFlowManagement: Codeunit "Workflow Management";
//         WorkflowEventHandling:
//                 Codeunit "Workflow Event Handling";
//         WorkFlowResponseHandling:
//                 Codeunit "Workflow Response Handling";
//         NothingToApprove:
//                 Label 'There is nothing to approve';
//         JobReqDocSendForApprovalEventDescTxt:
//                 Label 'Approval of a Fixed Asset is requested';
//         NoWorkFlowEnabledErr:
//                 Label 'No Approval workflow for this record type is enabled.';
//         JobReqDocCancelledForApprovalEventDescTxt:
//                 Label 'An approval request for Fixed Asset Card is cancelled.';
//         PendingApprovalMsg:
//                 Label 'An approval request for a Fixed Asset has been sent.';
//         JobDocReleasedEventDescTxt:
//                 Label 'A Fixed Asset is released';

// }