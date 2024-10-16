// report 50119 "PO Energy Capacitor"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'Energy.rdl';

//     dataset
//     {
//         dataitem("Purchase Header"; "Purchase Header")
//         {
//             RequestFilterFields = "No.";
//             column(Posting_Date; "Posting Date")
//             {

//             }
//             column(No_; "No.")
//             {

//             }
//             column(Pay_to_Name; "Pay-to Name")
//             {

//             }
//             column(Pay_to_Address; "Pay-to Address")
//             {

//             }
//             column(StateCode; StateCode)
//             {

//             }
//             column(StateName; StateName)
//             {

//             }
//             column(MobileNo; MobileNo)
//             {

//             }
//             column(CGST; CGST)
//             {

//             }
//             column(SGST; SGST) { }
//             column(IGST; IGST) { }
//             column(CGSTRATE; CGSTRATE) { }
//             column(SGSTRATE; SGSTRATE) { }
//             column(IGSTRATE; IGSTRATE) { }
//             column(TOTALCGST; TOTALCGST)
//             {

//             }

//             column(TOTALSGST; TOTALSGST) { }
//             column(TOTALIGST; TOTALIGST) { }
//             column(GrandTotal; GrandTotal)
//             {

//             }

//             dataitem("Purchase Line"; "Purchase Line")
//             {
//                 DataItemLinkReference = "Purchase Header";
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = where("No." = filter(<> ''));
//                 column(Nos; "No.")
//                 {

//                 }
//                 column(Description; Description)
//                 {

//                 }
//                 column(Quantity; Quantity)
//                 {

//                 }
//                 column(Unit_Price__LCY_; "Unit Price (LCY)")
//                 {

//                 }
//                 column(Line_Amount; "Line Amount")
//                 {

//                 }
//                 column(Direct_Unit_Cost; "Direct Unit Cost")
//                 {

//                 }
//                 column(AmountToVendor; AmountToVendor) { }


//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;
//                 begin

//                     // States.Reset();
//                     // States.SetRange(Code, Vendor."State Code");
//                     // if States.FindFirst() then begin
//                     //     StateName := States.Description;
//                     // end;

//                     Vendor.Reset();
//                     Vendor.SetRange("No.", "Purchase Header"."Pay-to Vendor No.");
//                     if Vendor.FindFirst() then begin
//                         StateCode := Vendor."State Code";
//                         MobileNo := Vendor."Mobile Phone No.";
//                         States.Reset();
//                         States.SetRange(Code, Vendor."State Code");
//                         if States.FindFirst() then begin
//                             StateName := States.Description;
//                         end;
//                     end;


//                     RecPurchaseLine.Reset();
//                     RecPurchaseLine.SetRange("Document Type", "Purchase Header"."Document Type");
//                     RecPurchaseLine.SetRange("Document No.", "Purchase Header"."No.");
//                     RecPurchaseLine.SetFilter("GST Group Code", '<>%1', '');
//                     if RecPurchaseLine.FindSet() then
//                         repeat
//                             TaxRecordID := RecPurchaseLine.RecordId();//tk
//                                                                       // PurchaseHeaderRecordID := RecPurchaseLine.RecordId();
//                                                                       //                                                                       //Message('%1', PurchHeaderRecordID);
//                             TaxTransactionValue.Reset();
//                             TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//tk
//                             TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
//                             TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
//                             TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
//                             TaxTransactionValue.SetRange("Visible on Interface", true);
//                             TaxTransactionValue.SetFilter("Value ID", '%1|%2', 6, 2);
//                             if TaxTransactionValue.FindSet() then begin

//                                 CGSTRate := TaxTransactionValue.Percent;
//                                 SGSTRate := TaxTransactionValue.Percent;
//                                 CGST += TaxTransactionValue.Amount;
//                                 SGST += TaxTransactionValue.Amount;

//                                 SGSTtxt := 'SGST';
//                                 CGSTtxt := 'CGST';
//                                 TotalCGST += CGST;
//                                 TotalSGST += SGST;
//                             end else begin
//                                 TaxTransactionValue.Reset();
//                                 TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//tk
//                                 TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
//                                 TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
//                                 TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
//                                 TaxTransactionValue.SetRange("Visible on Interface", true);
//                                 TaxTransactionValue.SetFilter("Value ID", '%1', 3);
//                                 if TaxTransactionValue.FindSet() then
//                                     IGSTRate := TaxTransactionValue.Percent;
//                                 IGST += TaxTransactionValue.Amount;
//                                 IGSTtxt := 'IGST';
//                                 TotalIGST += IGST;

//                             END;

//                             Total += RecPurchaseLine."Line Amount";
//                         //TotalIGST + TotalCGST + TotalSGST;
//                         until RecPurchaseLine.Next() = 0;
//                     AmountToVendor := Total + CGST + SGST + IGST;
//                     //Naveen--
//                     PostedVoucher.InitTextVariable();
//                     "Purchase Header".CalcFields(Amount);
//                     // PostedVoucher.FormatNoText(AmountinWords, Round("Purchase Header".Amount), "Purchase Header"."Currency Code");
//                     PostedVoucher.FormatNoText(AmountinWords, Round(AmountToVendor), "Purchase Header"."Currency Code");
//                     Amtinwrds := AmountinWords[1] + AmountinWords[2];
//                 end;
//             }


//         }
//     }

//     requestpage
//     {
//         AboutTitle = 'Teaching tip title';
//         AboutText = 'Teaching tip content';
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {

//                 }
//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(LayoutName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }
//     }

//     // rendering
//     // {
//     //     layout(LayoutName)
//     //     {
//     //         Type = Excel;
//     //         LayoutFile = 'mySpreadsheet.xlsx';
//     //     }
//     // }

//     var
//         myInt: Integer;
//         RecPurchaseLine: Record "Purchase Line";
//         MobileNo: Text[100];
//         StateCode: Code[20];
//         StateName: Text[100];
//         Vendor: Record vendor;
//         States: Record State;
//         CGST: Decimal;
//         SGST: Decimal;
//         IGST: Decimal;
//         CGSTRate: Decimal;
//         SGSTRate: Decimal;
//         IGSTRate: Decimal;
//         TotalCGST: Decimal;
//         TotalSGST: Decimal;
//         TotalIGST: Decimal;
//         Total: Decimal;
//         GrandTotal: Decimal;
//         Currency: Code[20];
//         PostedVoucher: Report "Posted Voucher";
//         AmountToVendor: Decimal;
//         IGSTtxt: text[10];
//         CGSTtxt: text[10];
//         SGSTtxt: text[10];
//         TaxtransactionValue: Record "Tax Transaction Value";
//         TaxRecordId: RecordId;
//         Amount: Decimal;
//         WholeAmount: Decimal;
//         Amtinwrds: Text;
//         // SalesPersnPurchaseCode:Record sales
//         FractionalAmount: Decimal;
//         AmountinWords: array[2] of Text;

//     local procedure ClearData()
//     Begin
//         IGSTRate := 0;
//         SGSTRate := 0;
//         CGSTRate := 0;
//         SGSTtxt := '';
//         CGSTtxt := '';
//         TotalCGST := 0;
//         TotalSGST := 0;
//         TotalIGST := 0;
//         // CGSTtxt := '';
//         // IGSTtxt := '';

//         IGST := 0;
//         CGST := 0;
//         SGST := 0;
//         Clear(AmountinWords);
//         AmountToVendor := 0;

//     End;

// }