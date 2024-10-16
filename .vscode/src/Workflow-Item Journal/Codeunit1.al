// codeunit 50012 "Approval Mgmt-IJ"
// {
//     procedure CheckItemApprovalPossible(var IJ: Record "Item Journal Line"
//     )
//     begin
//         if not IsItemWorkflowEnabled(IJ) then
//             Error(NoWorkFlowEnabledErr);
//         exit(true);
//     end;

//     procedure IsItemWorkflowEnabled(var IJ: Record "Item Journal Line")
//     var
//         myInt: Integer;
//     begin
//         exit(WorkFlowManagement.CanExecuteWorkflow(IJ, RunWorkflowonSendJobDocForApprovalCode()));

//     end;

//     [IntegrationEvent(false, false)]
//     procedure onSendItemForApproval(var IJ: Record "Item Journal Line")
//     begin

//     end;

//     [IntegrationEvent(false, false)]
//     procedure onCancelItemApprovalRequest(var IJ: Record "Item Journal Line")
//     begin

//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt-IJ", onSendItemForApproval, '', false, false)]
//     local procedure onSendItemForApprovalSub(var IJ: Record "Item Journal Line");
//     begin
//         WorkFlowManagement.HandleEvent(RunWorkflowOnSendJobDocForApprovalCode, IJ);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt-IJ", onCancelItemApprovalRequest, '', false, false)]
//     local procedure onCancelItemApprovalRequestSub(var IJ: Record "Item Journal Line");
//     begin
//         WorkFlowManagement.HandleEvent(RunWorkflowOnCancelJobDocForApprovalCode(), IJ);

//     end;

//     procedure RunWorkflowOnSendJobDocForApprovalCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowonSendItemJournalForApprovalCode'));
//     end;

//     procedure RunWorkflowOnCancelJobDocForApprovalRequestCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowOnCancelItemJournalForApprovalCode'));
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
//     procedure AddItemJCardEventToLibrary()
//     var
//         WorkflowEvent: Record "Workflow Event";
//     begin
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendJobDocForApprovalCode(), Database::"Item Journal Line", JobReqDocSendForApprovalEventDescTxt, 0, false);
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelJobDocForApprovalRequestCode(), Database::"Item Journal Line", JobReqDocCancelledForApprovalEventDescTxt, 0, false);
//     end;

//     [EventSubscriber(ObjectType:Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', true, true)]
//     local procedure WorkflowEventHandling_OnAddWorkflowEvemtPredecessorsToLibrary(EventFunctionName: Code[128])
//     begin
//         case EventFunctionName of
//             RunWorkflowonCancelJobDocForApprovalRequestCode:
//                 WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelJobDocForApprovalRequestCode(), RunWorkflowOnSendJobDocForApprovalCode());

//             WorkflowEventHandling.RunWorkflowOnApprovalRequestCode();
//             WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendJobDocForApprovalCode());

//             WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode():
//                 WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendJobDocForApprovalCode());

//             WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode():
//                 WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode(), RunWorkflowOnSendJobDocForApprovalCode());

//         end;
//     end;

//       [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnBeforeShowCommonApprovalStatus, '', false, false)]
//     local procedure OnBeforeShowCommonApprovalStatus(var RecRef: RecordRef; var IsHandle: Boolean);
//     var
//         IJ: Record "Item Journal Line";
//     begin
//         case RecRef.Number of
//             DATABASE::"Item Journal Line"
//                 begin
//                     RecRef.SetTable(IJ);

//                 end;
//         end;
//     end;


//     var
//         myInt: Integer;
//         WorkFlowManagement: Codeunit "Workflow Management";
//         WorkflowEventHandling:
//                 Codeunit "Workflow Event Handling";
//         WorkFlowResponseHandling:
//                 Codeunit "Workflow Response Handling";
//         NothingToApprove:
//                 Label 'There is nothing to approve';
//         JobReqDocSendForApprovalEventDescTxt:
//                 Label 'Approval of a Item Journal is requested';
//         NoWorkFlowEnabledErr:
//                 Label 'No Approval workflow for this record type is enabled.';
//         JobReqDocCancelledForApprovalEventDescTxt:
//                 Label 'An approval request for Item Journal  is cancelled.';
//         PendingApprovalMsg:
//                 Label 'An approval request for a Item Journal has been sent.';
//         JobDocReleasedEventDescTxt:
//                 Label 'A Item Journal is released';
// }