// codeunit 50043 "Approval Mgmt. GA"
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
//     procedure CheckJobApprovalPossible(var GA: Record "Gate Entry Header"): Boolean
//     begin
//         if not IsJobWorkFlowEnabled(GA) then
//             Error(NoWorkFlowEnabledErr);

//         exit(true);
//     end;

//     procedure IsJobWorkFlowEnabled(var GA: Record "Gate Entry Header"): Boolean
//     begin
//         exit(WorkFlowManagement.CanExecuteWorkflow(GA, RunWorkflowOnSendJobDocForApprovalCode()));
//     end;

//     //Execution--

//     //Publisher++
//     [IntegrationEvent(false, false)]
//     procedure onSendJobsForApproval(var GA: Record "Gate Entry Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure onCancelJobApprovalRequest(var GA: Record "Gate Entry Header")
//     begin
//     end;
//     //Publisher--

//     //Subscriber++
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. GA", onSendJobsForApproval, '', false, false)]
//     local procedure onSendJobsForApprovalSub(var GA: Record "Gate Entry Header");
//     begin
//         WorkFlowManagement.HandleEvent(RunWorkflowOnSendJobDocForApprovalCode, GA);
//     end;


//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. GA", onCancelJobApprovalRequest, '', false, false)]
//     local procedure onCancelJobApprovalRequestSub(var GA: Record "Gate Entry Header");
//     begin
//         WorkFlowManagement.HandleEvent(RunWorkflowOnCancelJobDocForApprovalRequestCode(), GA); //RunWorkflowOnSendJobDocForApprovalCode
//     end;
//     //Subscriber--

//     //WorkFlow Code++
//     procedure RunWorkflowOnSendJobDocForApprovalCode(): Code[128]
//     begin
//         EXIT(UPPERCASE('RunWorkflowOnSendJobDocForApprovalCode'));
//     end;

//     procedure RunWorkflowOnCancelJobDocForApprovalRequestCode(): Code[128]
//     begin
//         EXIT(UPPERCASE('RunWorkflowOnCancelJobDocForApprovalrequest'));
//     end;
//     //WorkFlow Code--

//     //WorkFlow Event Handling++
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
//     procedure AddCustomerCardEventToLibrary()
//     var
//         WorkflowEvent: Record "Workflow Event";
//     begin
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendJobDocForApprovalCode(), Database::"Gate Entry Header",
//                                                     JobReqDocSendForApprovalEventDescTxt, 0, false);

//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelJobDocForApprovalRequestCode(), Database::"Gate Entry Header",
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
//         GA: Record "Gate Entry Header";
//     begin
//         case RecRef.Number of
//             DATABASE::"Gate Entry Header":
//                 begin
//                     RecRef.SetTable(GA);

//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnPopulateApprovalEntryArgument, '', false, false)]
//     local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance");
//     var
//         GA: Record "Gate Entry Header";
//     begin
//         case RecRef.Number of
//             DATABASE::"Gate Entry Header":
//                 begin
//                     RecRef.SetTable(GA);
//                     ApprovalEntryArgument."Document No." := GA."No.";
//                     ApprovalEntryArgument."Table ID" := Database::"Gate Entry Header";
//                 end;
//         end;
//     end;
//     //Approval Mgmt. --

//     //Action Handling ++ 
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
//     local procedure ApprovalsMgmt_OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
//     var
//         GA: Record "Gate Entry Header";
//     begin
//         Case RecRef.Number Of
//             Database::"Gate Entry Header":
//                 begin
//                     RecRef.SetTable(GA);
//                     GA."Approval Status" := GA."Approval Status"::"Pending Approval";
//                     GA.Modify();
//                     IsHandled := true;
//                 end;
//         End;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnApproveApprovalRequest, '', false, false)]
//     local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry");
//     var
//         RecRef: RecordRef;
//         GA: Record "Gate Entry Header";
//         ApprovalMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         RecRef.Get(ApprovalEntry."Record ID to Approve");
//         case RecRef.Number of
//             Database::"Gate Entry Header":
//                 begin
//                     RecRef.SetTable(GA);
//                     if not ApprovalMgmt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
//                         GA."Approval Status" := GA."Approval Status"::Approved;

//                         // GA.Blocked := false;
//                         GA.Modify();
//                     end;
//                 end;
//         End;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnRejectApprovalRequest, '', false, false)]
//     local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry");
//     var
//         RecRef: RecordRef;
//         GA: Record "Gate Entry Header";
//         ApprovalMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         RecRef.Get(ApprovalEntry."Record ID to Approve");
//         case RecRef.Number of
//             Database::"Gate Entry Header":
//                 begin
//                     RecRef.SetTable(GA);
//                     GA."Approval Status" := GA."Approval Status"::Cancelled;
//                     GA.Modify();
//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", OnReleaseDocument, '', false, false)]
//     local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean);
//     var
//         GA: Record "Gate Entry Header";
//     begin
//         case RecRef.Number of
//             Database::"Gate Entry Header":
//                 begin
//                     RecRef.SetTable(GA);
//                     GA."Approval Status" := GA."Approval Status"::Approved;
//                     // GA.Blocked := false;
//                     GA.Modify();
//                     Handled := true;
//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", OnOpenDocument, '', false, false)]
//     local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean);
//     var
//         GA: Record "Gate Entry Header";
//     begin
//         case RecRef.Number of
//             Database::"Gate Entry Header":
//                 begin
//                     RecRef.SetTable(GA);
//                     GA."Approval Status" := GA."Approval Status"::Open;
//                     GA.Modify();
//                     Handled := true;
//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", OnConditionalCardPageIDNotFound, '', false, false)]
//     local procedure OnConditionalCardPageIDNotFound(RecordRef: RecordRef; var CardPageID: Integer);

//     begin
//         case RecordRef.Number of
//             Database::"Gate Entry Header":
//                 CardPageID := Page::"Inward Gate Entry";
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
//                 Label 'Approval of a Gateentry is requested';
//         NoWorkFlowEnabledErr:
//                 Label 'No Approval workflow for this record type is enabled.';
//         JobReqDocCancelledForApprovalEventDescTxt:
//                 Label 'An approval request for GateEntry Card is cancelled.';
//         PendingApprovalMsg:
//                 Label 'An approval request for a GateEntry has been sent.';
//         JobDocReleasedEventDescTxt:
//                 Label 'A GateEntry is released';

// }