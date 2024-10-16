// codeunit 50039 "Custom Workflow Event Setup1"
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
//         WorkFlowSetup.InsertTableRelation(Database::"Fixed Asset", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
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
//         FA: Record "Fixed Asset";
//     begin
//         // WorkFlowSetup.PopulateWorkflowStepArgument(WorkFlowStepsArgument, WorkFlowStepsArgument."Approver Type"::Approver,
//         // WorkFlowStepsArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);

//         WorkFlowSetup.InitWorkflowStepArgument(WorkFlowStepsArgument, WorkFlowStepsArgument."Approver Type"::Approver,
//                 WorkFlowStepsArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);

//         FA.Init();
//         WorkFlowSetup.InsertRecApprovalWorkflowSteps(Workflow, BuildJobPrepTypeConditions(FA),
//         WorkFlowEventHandlingExt.RunWorkflowOnSendJobDocForApprovalCode(),
//         WorkFlowResponseHandling.CreateApprovalRequestsCode(),
//         WorkFlowResponseHandling.SendApprovalRequestForApprovalCode(),
//         WorkFlowEventHandlingExt.RunWorkflowOnCancelJobDocForApprovalRequestCode(),
//         WorkFlowStepsArgument, false, false);

//     end;

//     local procedure BuildJobPrepTypeConditions(var FA: Record "Fixed Asset"): Text
//     begin
//         exit(StrSubstNo(JobPrepTypeCondTxt, WorkFlowSetup.Encode(FA.GetView(false))));
//     end;

//     var
//         WorkFlowSetup: Codeunit "Workflow Setup";
//         WorkFlowResponseHandling: Codeunit "Workflow Response Handling";
//         WorkFlowEventHandlingExt: Codeunit "Approval Mgmt. FA";
//         JobWorkFlowCategoryTxt: TextConst ENU = 'FA';
//         JobWorkFlowCategoryDescTxt: TextConst ENU = 'FA Card';
//         JobWorkFlowApprovalCodeTxt: TextConst ENU = 'JOBS';
//         JobWorkFlowApprovalDescTxt: TextConst ENU = 'FA Approval Workflow';
//         JobPrepTypeCondTxt: Label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="FA">%1</DataItem></DataItems></ReportParameters>', Locked = true;
// }