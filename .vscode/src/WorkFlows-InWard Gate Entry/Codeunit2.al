// codeunit 50049 "Custom Workflow Event Setup"
// {
//     //REHAN CCIT
//     trigger OnRun()
//     begin

//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", OnAddWorkflowCategoriesToLibrary, '', false, false)]
//     local procedure OnAddWorkflowCategoriesToLibrary();
//     begin
//         WorkFlowSetup.InsertWorkflowCategory(JobWorkFlowCategoryTxt, JobWorkFlowCategoryDescTxt);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", OnAfterInsertApprovalsTableRelations, '', false, false)]
//     local procedure OnAfterInsertApprovalsTableRelations();
//     var
//         ApprovalEntry: Record "Approval Entry";
//     begin
//         WorkFlowSetup.InsertTableRelation(Database::"Gate Entry Header", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", OnInsertWorkflowTemplates, '', false, false)]
//     local procedure OnInsertWorkflowTemplates(var Sender: Codeunit "Workflow Setup");
//     begin
//         InsertJobWorkflowTemplate();
//     end;

//     local procedure InsertJobWorkflowTemplate()
//     var
//         Workflow: Record Workflow;
//     begin
//         WorkFlowSetup.InsertWorkflowTemplate(Workflow, JobWorkFlowApprovalCodeTxt, JobWorkFlowApprovalDescTxt,
//         JobWorkFlowCategoryTxt);
//         InsertJobWorkFlowDetails(Workflow);
//         WorkFlowSetup.MarkWorkflowAsTemplate(Workflow);
//     end;

//     local procedure InsertJobWorkFlowDetails(var Workflow: Record Workflow)
//     var
//         WorkFlowStepsArgument: Record "Workflow Step Argument";
//         BlankDateFormula: DateFormula;
//         WorkFlowResponseHandling: Codeunit "Workflow Response Handling";
//         GA: Record "Gate Entry Header";
//     begin
//         // WorkFlowSetup.PopulateWorkflowStepArgument(WorkFlowStepsArgument, WorkFlowStepsArgument."Approver Type"::Approver,
//         // WorkFlowStepsArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);

//         WorkFlowSetup.InitWorkflowStepArgument(WorkFlowStepsArgument, WorkFlowStepsArgument."Approver Type"::Approver,
//                 WorkFlowStepsArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);

//         GA.Init();
//         WorkFlowSetup.InsertRecApprovalWorkflowSteps(Workflow, BuildJobPrepTypeConditions(GA),
//         WorkFlowEventHandlingExt.RunWorkflowOnSendJobDocForApprovalCode(),
//         WorkFlowResponseHandling.CreateApprovalRequestsCode(),
//         WorkFlowResponseHandling.SendApprovalRequestForApprovalCode(),
//         WorkFlowEventHandlingExt.RunWorkflowOnCancelJobDocForApprovalRequestCode(),
//         WorkFlowStepsArgument, false, false);

//     end;

//     local procedure BuildJobPrepTypeConditions(var GA: Record "Gate Entry Header"): Text
//     begin
//         exit(StrSubstNo(JobPrepTypeCondTxt, WorkFlowSetup.Encode(GA.GetView(false))));
//     end;

//     var
//         WorkFlowSetup: Codeunit "Workflow Setup";
//         WorkFlowResponseHandling: Codeunit "Workflow Response Handling";
//         WorkFlowEventHandlingExt: Codeunit "Approval Mgmt. GA";
//         JobWorkFlowCategoryTxt: TextConst ENU = 'GA';
//         JobWorkFlowCategoryDescTxt: TextConst ENU = 'GA Card';
//         JobWorkFlowApprovalCodeTxt: TextConst ENU = 'JOBS';
//         JobWorkFlowApprovalDescTxt: TextConst ENU = 'GA Approval Workflow';
//         JobPrepTypeCondTxt: Label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="FA">%1</DataItem></DataItems></ReportParameters>', Locked = true;
// }