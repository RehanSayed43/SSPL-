// report 50120 "PI-Auxilo Report"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'PPI.rdl';

//     dataset
//     {
//         dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
//         {
//             column(Document_No; "No.")
//             {
//             }
//             column(DocumentDate_PurchInvHeader; "Document Date")
//             {
//             }
//             column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
//             {

//             }
//             column(PostingDate_PurchInvHeader; "Posting Date")
//             {
//             }
//             column(BuyfromVendorName_PurchInvHeader; "Buy-from Vendor Name")
//             {
//             }
//             column(VendorInvoiceNo_PurchInvHeader; "Vendor Invoice No.")
//             {
//             }
//             column(Location_GST_Reg__No_; "Location GST Reg. No.")
//             {

//             }
//             column(Order_No_; "Order No.")
//             {

//             }

//             column(Applies_to_Doc__No_; "Applies-to Doc. No.")
//             {

//             }
//             column(Remaining_Amount; "Remaining Amount")
//             {

//             }
//             column(VendorGstNo; VendorGstNo)
//             {

//             }
//             column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
//             {
//                 Caption = 'Department';

//             }
//             column(comments; comments)
//             {

//             }
//             column(ApproverID; ApproverID)
//             {

//             }
//             column(ApproveDate; ApproveDate)
//             {

//             }
//             column(BRAND; BRAND)
//             {

//             }
//             column(CUSTOMER_GROUP; "CUSTOMER GROUP")
//             {

//             }
//             column(Department; Department)
//             {

//             }


//             //------AUXILO DIMENSIONS------------------
//             column(BRANCHES; BRANCHES)
//             {

//             }
//             column(PRODUCT_SEGMENTS; "PRODUCT SEGMENTS")
//             {

//             }
//             column(DEPARTMENTS; DEPARTMENTS)
//             {

//             }
//             column(FUNCTION; FUNCTION)
//             {

//             }
//             column(LAN; LAN)
//             {

//             }
//             column(INVESTMENT; INVESTMENT)
//             {

//             }

//             dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
//             {
//                 DataItemLinkReference = "Purch. Inv. Header";
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = where("No." = filter(<> ''));
//                 column(No_; "No.")
//                 {

//                 }
//                 column(Description; Description)
//                 {

//                 }
//                 column(Type; Type)
//                 {

//                 }
//                 column(HSN_SAC_Code; "HSN/SAC Code")
//                 {

//                 }
//                 column(GST_Group_Code; "GST Group Code")
//                 {

//                 }
//                 column(GST_Group_Type; "GST Group Type")
//                 {

//                 }
//                 column(GST_Jurisdiction_Type; "GST Jurisdiction Type")
//                 {

//                 }
//                 column(GST_Reverse_Charge; "GST Reverse Charge")
//                 {

//                 }
//                 column(Direct_Unit_Cost; "Direct Unit Cost")
//                 {

//                 }

//                 column(GSTAMNT; GSTAMNT)
//                 {

//                 }
//                 column(Amount_Including_VAT; "Amount Including VAT")
//                 {

//                 }
//                 column(Line_Amount; "Line Amount")
//                 {

//                 }
//                 column(Quantity; Quantity)
//                 {

//                 }
//                 column(Final_Amount; Final_Amount)
//                 {

//                 }
//                 column(TDS_Section_Code; "TDS Section Code")
//                 {

//                 }
//                 column(TDSamount; TDSamount)
//                 {

//                 }
//                 column(Exempted; Exempted)
//                 {

//                 }
//                 column(GST_Credit; "GST Credit")
//                 {

//                 }
//                 // column(tdssectioncode)
//                 // {

//                 // }
//                 // column(tdsamount)
//                 // {

//                 // }
//                 column(Location_Code; "Location Code")
//                 {

//                 }
//                 column(SystemCreatedAt; SystemCreatedAt)
//                 {

//                 }
//                 column(SystemCreatedBy; SystemCreatedBy)
//                 {

//                 }
//                 column(SystemModifiedAt; SystemModifiedAt)
//                 {

//                 }

//                 trigger OnAfterGetRecord()
//                 var
//                     recid: RecordId;
//                 begin

//                     // clear(total);
//                     // clear(Total_Amount);
//                     // clear(Final_Amount);

//                     // "Purch. Inv. Line".Reset();
//                     // "Purch. Inv. Line".SetRange("Document No.", "Purch. Inv. Header"."No.");
//                     // if "Purch. Inv. Line".FindSet() then begin
//                     //     repeat
//                     //         total += "Purch. Inv. Line"."Line Amount";
//                     //     until "Purch. Inv. Line".Next() = 0;

//                     // end;
//                     CLEAR(CGSTRate);

//                     CLEAR(CGSTAmt);

//                     CLEAR(GSTComponentCGST);

//                     CLEAR(SGSTRate);

//                     CLEAR(SGSTAmt);

//                     CLEAR(GSTComponentSGST);

//                     CLEAR(IGSTRate);

//                     CLEAR(IGSTAmt);

//                     CLEAR(GSTComponentIGST);
//                     GSTDetailLeger.Reset();
//                     GSTDetailLeger.SetRange("Document No.", "Purch. Inv. Line"."Document No.");
//                     GSTDetailLeger.SetRange("No.", "Purch. Inv. Line"."No.");
//                     GSTDetailLeger.SetRange("Document Line No.", "Purch. Inv. Line"."Line No.");
//                     If GSTDetailLeger.FindSet() then
//                         repeat
//                             recid := "Purch. Inv. Line".RecordId;
//                             if GSTDetailLeger."GST Component Code" = 'CGST' then begin
//                                 GSTComponentCGST := 'CGST';
//                                 CGSTAmt := abs(GSTDetailLeger."GST Amount");
//                                 CGSTRate := GSTDetailLeger."GST %";

//                             end else
//                                 if GSTDetailLeger."GST Component Code" = 'SGST' then begin
//                                     GSTComponentSGST := 'SGST';
//                                     SGSTAmt := abs(GSTDetailLeger."GST Amount");
//                                     SGSTRate := GSTDetailLeger."GST %";

//                                 end else
//                                     if GSTDetailLeger."GST Component Code" = 'IGST' then begin
//                                         GSTComponentIGST := 'IGST';
//                                         IGSTAmt := Abs(GSTDetailLeger."GST Amount");
//                                         IGSTRate := Abs(GSTDetailLeger."GST %");

//                                     end;

//                         until GSTDetailLeger.next = 0;
//                     totalRate := CGSTRATE + SGSTRATE + IGSTRATE;
//                     GSTAMNT := CGSTAmt + SGSTAmt + IGSTAmt;
//                     TDSamount := GetTDSAmount(recid);
//                     Total_Amount := "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt + TDSamount;
//                     Final_Amount := Total_Amount;

//                     //TDSamount := GetTDSAmount(recid);
//                 end;




//                 // column(msmeno)
//                 // {

//                 // }
//             }

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 //FOR COMMENTS OF PURCHASE INVOICE LINE

//                 FilterDimensionsInvoice();

//                 commentLine.Reset();
//                 commentLine.SetRange(commentLine."No.", "Purch. Inv. Header"."No.");
//                 if commentLine.FindFirst() then begin
//                     repeat
//                         comments += (commentLine.Comment + ', ');


//                     until commentLine.Next() = 0;

//                 end;
//                 //FOR VENDOR GST NO
//                 Vendor.Reset();
//                 Vendor.SetRange("No.", "Purch. Inv. Header"."Buy-from Vendor No.");
//                 if Vendor.FindFirst() then begin
//                     VendorGstNo := Vendor."GST Registration No.";

//                 end;
//                 //FOR APPROVER ID AND APPROVE DATE
//                 ApprovalEntries.Reset();
//                 ApprovalEntries.SetRange("Document No.", "Purch. Inv. Header"."No.");
//                 if ApprovalEntries.FindLast() then begin
//                     ApproverID := ApprovalEntries."Approver ID";
//                     ApproveDate := ApprovalEntries."Last Date-Time Modified"
//                 end;
//                 // GetTDSAmount(RecordId);


//             end;

//             trigger OnPreDataItem()
//             begin
//                 //  Srno := 0;

//                 "Purch. Inv. Header".SETRANGE("Purch. Inv. Header"."Posting Date", startdt, enddt);
//                 //IF "Purch. Inv. Header".FINDSET THEN;
//                 // "Purch. Inv. Header"."Purchaser Code" := '';
//             end;

//         }
//         dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
//         {
//             column(Document_NoCRR; "No.")
//             {
//             }
//             column(DocumentDate_PurchInvHeaderCR; "Document Date")
//             {
//             }
//             column(Buy_from_Vendor_No_CR; "Buy-from Vendor No.")
//             {

//             }
//             column(PostingDate_PurchInvHeaderCR; "Posting Date")
//             {
//             }
//             column(BuyfromVendorName_PurchInvHeaderCR; "Buy-from Vendor Name")
//             {
//             }
//             // column(VendorInvoiceNo_PurchInvHeaderCR; "Vendor Invoice No.")
//             // {
//             // }
//             column(Vendor_Cr__Memo_No_; "Vendor Cr. Memo No.")
//             {

//             }
//             column(Location_GST_Reg__No_CR; "Location GST Reg. No.")
//             {

//             }
//             // column(Applies_to_Doc__No_S; "Applies-to Doc. No.")
//             // {

//             // }

//             column(Applies_to_Doc__No_CR; "Applies-to Doc. No.")
//             {

//             }
//             column(Remaining_AmountCR; "Remaining Amount")
//             {

//             }
//             column(VendorGstNoCR; VendorGstNo)
//             {

//             }
//             column(Shortcut_Dimension_1_CodeCR; "Shortcut Dimension 1 Code")
//             {
//                 Caption = 'Department';

//             }
//             column(commentsCRss; commentsCRs)
//             {

//             }
//             column(ApproverIDCR; ApproverIDCR)
//             {

//             }
//             column(ApproveDatecr; ApproveDate)
//             {

//             }
//             column(Brandcr; Brandcr)
//             {

//             }
//             column(CustomerGrpcr; CustomerGrpcr)
//             {

//             }
//             column(Departmentcr; Departmentcr)
//             {

//             }
//             //------AUXILO DIMENSIONS------------------
//             column(BRANCHESCR; BRANCHESCR)
//             {

//             }
//             column(PRODUCT_SEGMENTSCR; "PRODUCT SEGMENTSCR")
//             {

//             }
//             column(DEPARTMENTSCR; DEPARTMENTSCR)
//             {

//             }
//             column(FUNCTIONCR; FUNCTIONCR)
//             {

//             }
//             column(LANCR; LANCR)
//             {

//             }
//             column(INVESTMENTCR; INVESTMENTCR)
//             {

//             }

//             dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
//             {
//                 DataItemLinkReference = "Purch. Cr. Memo Hdr.";
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = where(Type = filter(<> ' '));
//                 column(No_CR; "No.")
//                 {

//                 }
//                 column(Descriptioncr; Description)
//                 {

//                 }
//                 column(Typecr; Type)
//                 {

//                 }
//                 column(HSN_SAC_Codecr; "HSN/SAC Code")
//                 {

//                 }
//                 column(GST_Group_Codecr; "GST Group Code")
//                 {

//                 }
//                 column(GST_Group_Typecr; "GST Group Type")
//                 {

//                 }
//                 column(GST_Jurisdiction_Typecr; "GST Jurisdiction Type")
//                 {

//                 }
//                 column(GST_Reverse_Chargecr; "GST Reverse Charge")
//                 {

//                 }
//                 column(Direct_Unit_Costcr; "Direct Unit Cost")
//                 {

//                 }

//                 // column(GSTAMNTCR; GSTAMNTCR)
//                 // {

//                 // }
//                 column(Amount_Including_VATcr; "Amount Including VAT")
//                 {

//                 }
//                 column(Line_Amountcr; "Line Amount")
//                 {

//                 }
//                 column(Quantitycr; Quantity)
//                 {

//                 }
//                 column(Final_Amountcr; Final_Amount)
//                 {

//                 }

//                 // column(TDS_Section_Codecr; "TDS Section Code")
//                 // {

//                 // }
//                 column(TDSamountcr; TDSamount)
//                 {

//                 }
//                 column(Exemptedcr; Exempted)
//                 {

//                 }
//                 column(GST_Creditcr; "GST Credit")
//                 {

//                 }
//                 // column(tdssectioncode)
//                 // {

//                 // }
//                 // column(tdsamount)
//                 // {

//                 // }
//                 column(Location_Codecr; "Location Code")
//                 {

//                 }
//                 column(SystemCreatedAcr; SystemCreatedAt)
//                 {

//                 }
//                 column(GSTAMNTCR; GSTAMNTCR)
//                 {

//                 }
//                 column(SystemCreatedBycr; SystemCreatedBy)
//                 {

//                 }
//                 column(SystemModifiedAtcr; SystemModifiedAt)
//                 {

//                 }

//                 trigger OnAfterGetRecord()
//                 var

//                 begin
//                     text1 := '-';

//                     CLEAR(CGSTRate);

//                     CLEAR(CGSTAmt);

//                     CLEAR(GSTComponentCGST);

//                     CLEAR(SGSTRate);

//                     CLEAR(SGSTAmt);

//                     CLEAR(GSTComponentSGST);

//                     CLEAR(IGSTRate);

//                     CLEAR(IGSTAmt);

//                     CLEAR(GSTComponentIGST);
//                     GSTDetailLeger.Reset();
//                     GSTDetailLeger.SetRange("Document No.", "Purch. Cr. Memo Line"."Document No.");
//                     GSTDetailLeger.SetRange("No.", "Purch. Cr. Memo Line"."No.");
//                     GSTDetailLeger.SetRange("Document Line No.", "Purch. Cr. Memo Line"."Line No.");
//                     If GSTDetailLeger.FindSet() then
//                         repeat
//                             if GSTDetailLeger."GST Component Code" = 'CGST' then begin
//                                 GSTComponentCGST := 'CGST';
//                                 CGSTAmt := abs(GSTDetailLeger."GST Amount");
//                                 CGSTRate := GSTDetailLeger."GST %";
//                             end else
//                                 if GSTDetailLeger."GST Component Code" = 'SGST' then begin
//                                     GSTComponentSGST := 'SGST';
//                                     SGSTAmt := abs(GSTDetailLeger."GST Amount");
//                                     SGSTRate := GSTDetailLeger."GST %";
//                                 end else
//                                     if GSTDetailLeger."GST Component Code" = 'IGST' then begin
//                                         GSTComponentIGST := 'IGST';
//                                         IGSTAmt := Abs(GSTDetailLeger."GST Amount");
//                                         IGSTRate := Abs(GSTDetailLeger."GST %");
//                                     end;

//                         until GSTDetailLeger.next = 0;
//                     totalRate := CGSTRATE + SGSTRATE + IGSTRATE;

//                     // Total_Amount := "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt;
//                     // Final_Amount := Total_Amount;
//                     GSTAMNTCR := CGSTAmt + SGSTAmt + IGSTAmt;
//                     //TDSamount := GetTDSAmount(recid);
//                     Total_Amount := "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt + TDSamount;
//                     Final_Amount := Total_Amount;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin
//                 // if PurchCrMemoLine.Type = PurchCrMemoLine.Type::" " then
//                 //CurrReport.Skip();

//                 FilterDimensionsCreditmemo();

//                 commentLine.Reset();
//                 commentLine.SetRange(commentLine."No.", "Purch. Cr. Memo Hdr."."No.");
//                 if commentLine.FindFirst() then begin
//                     repeat
//                         commentsCRs += (commentLine.Comment + ', ');


//                     until commentLine.Next() = 0;

//                 end;
//                 //FOR VENDOR GST NO
//                 Vendor.Reset();
//                 Vendor.SetRange("No.", "Purch. Cr. Memo Hdr."."Buy-from Vendor No.");
//                 if Vendor.FindFirst() then begin
//                     VendorGstNo := Vendor."GST Registration No.";

//                 end;
//                 //FOR APPROVER ID AND APPROVE DATE
//                 ApprovalEntries.Reset();
//                 ApprovalEntries.SetRange("Document No.", "Purch. Cr. Memo Hdr."."No.");
//                 if ApprovalEntries.FindLast() then begin
//                     ApproverIDCR := ApprovalEntries."Approver ID";
//                     ApproveDatecr := ApprovalEntries."Last Date-Time Modified"
//                 end;
//                 // GetTDSAmount(Re

//             end;

//             trigger OnPreDataItem()
//             begin
//                 // SrnoCM := 0;
//                 "Purch. Cr. Memo Hdr.".SETRANGE("Purch. Cr. Memo Hdr."."Posting Date", startdt, enddt); //MJ
//             end;


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
//                     field("Start Date"; startdt)
//                     {

//                     }
//                     field("End Date"; enddt)
//                     {

//                     }
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

//     local procedure GetTDSAmount(RecID: RecordID): Decimal
//     var
//         TaxTransactionValue: Record "Tax Transaction Value";
//         TDSSetup: Record "TDS Setup";
//     // TDSSetup: Record "TCS Setup";

//     begin
//         if not TDSSetup.Get() then
//             exit;

//         TaxTransactionValue.SetRange("Tax Record ID", RecID);
//         TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
//         TaxTransactionValue.SetRange("Tax Type", TDSSetup."Tax Type");
//         TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
//         if not TaxTransactionValue.IsEmpty() then
//             TaxTransactionValue.CalcSums(Amount);

//         exit(TaxTransactionValue.Amount);
//         // TDSamount := GetTDSAmount(RecID);

//     end;

//     var
//         myInt: Integer;
//         StartDate: Date;
//         EndDate: Date;
//         TDSamount: Decimal;
//         salesp: Record "Salesperson/Purchaser";//"13";
//         staterec: Record State;//"13762";
//         VendorStateCode: Code[10];
//         item: Record Item;//"27";
//                           // schem: Record "Scheme Details";//"50001";
//         GstCredit: Code[20];
//         saleshdr: Record "Sales Header";//"36";
//         purchhdr: Record "Purchase Header";//"38";
//         VendorStateCodeCR: Code[10];

//         //Bank
//         Srno: Integer;
//         SrnoCM: Integer;
//         startdt: Date;
//         enddt: Date;
//         namecr: text[100];
//         RecVendor: Record Vendor;//"23";
//         CompInfo: Record "Company Information";//"79";
//         payterms: Record "Payment Terms";//"3";
//         postedshipment: Record "Purch. Rcpt. Header";//"120";
//         RecItemLed: Record "Item Ledger Entry";//"32";
//         PurchLine: Record "Purchase Line";//"39";
//         ServTaxPerc: Decimal;
//         PurchRectLine: Record "Purch. Rcpt. Line";//"121";
//         PRDt: Date;
//         EmieNo: Code[30];
//         SrlNo: Code[30];
//         cnt: Integer;
//         ItemNo: Code[20];
//         comments: Text;
//         commentsCRs: Text;
//         Vendor: Record Vendor;
//         PINVL: Record "Purch. Inv. Line";//"123";
//         ServTaxamt: Decimal;
//         reclocation: Record Location;//"14";
//         glacnt: Record "G/L Account";//"15";
//         GRTOTLCY: Decimal;
//         GST12CR: Text[10];
//         DimensionValueEntry: Record "Dimension Set Entry";
//         purchaserCode: Code[50];
//         VendorPartCode: Code[50];
//         GSTDetailLeger: Record "Detailed GST Ledger Entry";//"16419";
//         CGSTRates: Decimal;
//         //CGSTRATES:DECIMAL;
//         //SGSTRATES:DECIMAL;
//         //IGSTRATED:DECIMAL;
//         //CGST:DECIMAL;
//         //IGST:DECIMAL;
//         //SGST:DECIMAL;
//         //TOTALCGST:DECIMAL;
//         //TOTALSGST:DECIMAL;
//         //TOTALIGST:DECIMAL;
//         //CGSTAMT:DECIMAL;

//         CGSTAmt: Decimal;
//         SGSTAmt: Decimal;
//         SGSTRates: Decimal;
//         IGSTRates: Decimal;
//         IGSTAmt: Decimal;
//         GSTComponentCGST: Text;
//         GSTComponentSGST: Text;
//         GSTComponentIGST: Text;
//         GSTTIN_No: Code[20];
//         Vend_State: Code[20];
//         PlaceOfSupply: Text;
//         MapleGSTIN: Code[20];
//         StateCodeVendor: Code[10];
//         recLoc: Record Location;//"14";
//         recVen: Record Vendor;//"23";
//         recGSTSetup: Record "GST Setup";//"16408";
//         recPostedCRmemo: Record "Purch. Cr. Memo Hdr.";//"124";
//         CrDocument: Text;
//         VendorGstNo: Code[20];
//         ApprovalEntries: Record "Posted Approval Entry";
//         CrDate: Date;
//         recLoc1: Record Location;//"14";
//         recVen1: Record Vendor;//"23";
//         payterms1: Record "Payment Terms";//"3";
//         RecVendor1: Record Vendor;//"23";
//         CGSTAmt1: Decimal;
//         commentLine: Record "Purch. Comment Line";
//         CGSTRate1: Decimal;
//         GSTComponentCGST1: Text;
//         SGSTAmt1: Decimal;
//         SGSTRate1: Decimal;
//         GSTComponentSGST1: Text;
//         IGSTAmt1: Decimal;
//         IGSTRate1: Decimal;
//         GSTComponentIGST1: Text;
//         ApproverID: Code[50];
//         ApproverIDCR: Code[50];
//         ApproveDate: DateTime;

//         ApproveDatecr: DateTime;
//         RecVendor2: Record Vendor;//"23";
//         RecState2: Record State;// "13762";
//         PlaceofSupply_CR: Text;
//         IMEI_SERIAL_SHOW: Boolean;
//         // RecFre: Record "13798"; //not found_kj
//         Frt: Decimal;
//         //  RecFre1: Record "13798";//not found_kj
//         Frt1: Decimal;
//         Category: code[30];
//         itemRec: Record Item;

//         //my
//         GLacc: Record "G/L Account";
//         name: Text[100];
//         PostingG: Record "Vendor Posting Group";
//         PostingDes: text[220];
//         PostingDes2: text[20];
//         Purchinvline: Record "Purch. Inv. Line";
//         taxtransactionValue: Record "Tax Transaction Value";
//         IGST: Decimal;
//         SGST: Decimal;
//         CGST: Decimal;
//         TotalIGST: Decimal;
//         TotalSGST: Decimal;
//         TotalCGST: Decimal;
//         Taxrecordid: RecordId;
//         IGSTRATE: Decimal;
//         CGSTRATE: Decimal;
//         SGSTRATE: Decimal;
//         Total: Decimal;
//         Grandtotal: Decimal;

//         //Detail
//         Satename: Text[100];
//         StateCode: text[50];
//         // Total: Decimal;

//         // compinfo: Record "Company Information";
//         GSTDetailLegers: Record "Detailed GST Ledger Entry";
//         CGSTAmts: Decimal;
//         // CGSTRate: Decimal;
//         GSTComponentCGSTs: Code[20];
//         SGSTAmts: Decimal;
//         GSTAMNT: Decimal;
//         GSTAMNTCR: Decimal;
//         // SGSTRate: Decimal;
//         GSTComponentSGSTs: Code[20];
//         IGSTAmts: Decimal;
//         text1: Text[10];
//         // IGSTRate: Decimal;

//         GSTComponentIGSTs: Code[20];
//         Amount: Decimal;
//         Total_Amount: Decimal;
//         // repcheck: report Check;
//         AmountInWords: Text[200];
//         wordsinarray: array[2] of text;
//         Final_Amount: Decimal;
//         Address1: Text[50];
//         Address2: Text[50];
//         City: Text[50];
//         PostCode: Text[50];
//         countryCode: Text[50];
//         //  PostedVoucherRep: Report "Posted Voucher";
//         totalRate: Integer;
//         GstGroup: Record "GST Group";
//         GST12: text[10];
//         recstate: Record State;
//         recstateDesc2: Text[100];
//         recStateDesc: Text[100];
//         PurcCrMemoheadr: Record "Purch. Cr. Memo Hdr.";
//         PurchCrMemoLine: Record "Purch. Cr. Memo Line";
//         doc: Code[100];
//         doccr: Code[100];

//         "BC Document Type": Code[100];
//         BC_Document_TypeCR: Code[100];
//         Vendor_Name: Text[100];
//         Gstno: Code[50];
//         Vedor_PostingGrp: Code[50];
//         Location_State_Code: Code[50];
//         Vendor_Invoice_No: Code[35];
//         Posting_Date: Date;
//         Procurement_Type: Code[50];
//         Place_of_Supply: Text[100];
//         Client_G_L_Account_No: Code[10];
//         Description: Text[120];
//         HSN: code[20];
//         Classification: Text[120];
//         Eligibility: Code[120];
//         BRAND: Code[20];
//         Department: Code[20];
//         "CUSTOMER GROUP": Code[20];

//         Brandcr: Code[20];
//         Departmentcr: Code[20];
//         CustomerGrpcr: Code[20];

//         BRANCHES: Code[20];
//         "BUSINESS SEGMENTS": Code[20];
//         DEPARTMENTS: Code[20];
//         "PRODUCT SEGMENTS": Code[20];
//         FUNCTION: Code[20];
//         INVESTMENT: Code[20];
//         LAN: Code[20];
//         BRANCHESCR: Code[20];
//         "BUSINESS SEGMENTSCR": Code[20];
//         DEPARTMENTSCR: Code[20];
//         "PRODUCT SEGMENTSCR": Code[20];
//         FUNCTIONCR: Code[20];
//         INVESTMENTCR: Code[20];
//         LANCR: Code[20];

//     local procedure FilterDimensionsInvoice()
//     var

//         DimSetEntry: Record "Dimension Set Entry";
//         DimSetID: Integer;
//     //BUHEAD: Code[20];
//     begin
//         DimSetID := "Purch. Inv. Header"."Dimension Set ID";
//         if DimSetID <> 0 then begin

//             DimSetEntry.SetRange("Dimension Set ID", DimSetID);
//             if DimSetEntry.FindSet() then
//                 repeat
//                 begin
//                     // Rec.SetRange(BUHEAD, DimSetEntry."Dimension Value Code");
//                     if DimSetEntry."Dimension Code" = 'BRAND' then
//                         BRAND := DimSetEntry."Dimension Value Code";
//                     if DimSetEntry."Dimension Code" = 'CUSTOMER GROUP' then
//                         "CUSTOMER GROUP" := DimSetEntry."Dimension Value Code";
//                     if DimSetEntry."Dimension Code" = 'DEPARTMENT' then
//                         Department := DimSetEntry."Dimension Value Code";


//                 end;
//                 until DimSetEntry.Next() = 0;



//         end;
//     end;


//     local procedure FilterDimensionsCreditmemo()
//     var

//         DimSetEntry: Record "Dimension Set Entry";
//         DimSetID: Integer;

//     begin
//         DimSetID := "Purch. Cr. Memo Hdr."."Dimension Set ID";
//         if DimSetID <> 0 then begin

//             DimSetEntry.SetRange("Dimension Set ID", DimSetID);
//             if DimSetEntry.FindSet() then
//                 repeat
//                 begin
//                     // Rec.SetRange(BUHEAD, DimSetEntry."Dimension Value Code");
//                     if DimSetEntry."Dimension Code" = 'BRAND' then
//                         Brandcr := DimSetEntry."Dimension Value Code";
//                     if DimSetEntry."Dimension Code" = 'CUSTOMER GROUP' then
//                         CustomerGrpcr := DimSetEntry."Dimension Value Code";
//                     if DimSetEntry."Dimension Code" = 'DEPARTMENT' then
//                         Departmentcr := DimSetEntry."Dimension Value Code";
//                 end;
//                 until DimSetEntry.Next() = 0;
//         end;
//     end;

//     //------------FOR AUXILO DIMENSIONS-----JUST CALL THIS PROCEDURE AND MAP THE REQUIRED COLUMS
//     // local procedure FilterDimensionsInvoiceAuxilo()
//     // var

//     //     DimSetEntry: Record "Dimension Set Entry";
//     //     DimSetID: Integer;
//     // //BUHEAD: Code[20];
//     // begin
//     //     DimSetID := "Purch. Inv. Header"."Dimension Set ID";
//     //     if DimSetID <> 0 then begin

//     //         DimSetEntry.SetRange("Dimension Set ID", DimSetID);
//     //         if DimSetEntry.FindSet() then
//     //             repeat
//     //             begin
//     //                 // Rec.SetRange(BUHEAD, DimSetEntry."Dimension Value Code");
//     //                 if DimSetEntry."Dimension Code" = 'BRANCHES' then
//     //                     BRANCHES := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'BUSINESS SEGMENTS' then
//     //                     "BUSINESS SEGMENTS" := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'DEPARTMENT' then
//     //                     Department := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'PRODUCT SEGMENTS' then
//     //                     "PRODUCT SEGMENTS" := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'FUNCTION' then
//     //                     FUNCTION := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'LAN' then
//     //                     LAN := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'INVESTMENT' then
//     //                     INVESTMENT := DimSetEntry."Dimension Value Code";


//     //             end;
//     //             until DimSetEntry.Next() = 0;



//     //     end;
//     // end;

//     // local procedure FilterDimensionsCreditMemoAuxilo()
//     // var

//     //     DimSetEntry: Record "Dimension Set Entry";
//     //     DimSetID: Integer;
//     // //BUHEAD: Code[20];
//     // begin
//     //     DimSetID := "Purch. Inv. Header"."Dimension Set ID";
//     //     if DimSetID <> 0 then begin

//     //         DimSetEntry.SetRange("Dimension Set ID", DimSetID);
//     //         if DimSetEntry.FindSet() then
//     //             repeat
//     //             begin
//     //                 // Rec.SetRange(BUHEAD, DimSetEntry."Dimension Value Code");
//     //                 if DimSetEntry."Dimension Code" = 'BRANCHES' then
//     //                     BRANCHESCR := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'BUSINESS SEGMENTS' then
//     //                     "BUSINESS SEGMENTSCR" := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'DEPARTMENT' then
//     //                     DEPARTMENTSCR := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'PRODUCT SEGMENTS' then
//     //                     "PRODUCT SEGMENTSCR" := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'FUNCTION' then
//     //                     FUNCTIONCR := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'LAN' then
//     //                     LANCR := DimSetEntry."Dimension Value Code";
//     //                 if DimSetEntry."Dimension Code" = 'INVESTMENT' then
//     //                     INVESTMENTCR := DimSetEntry."Dimension Value Code";


//     //             end;
//     //             until DimSetEntry.Next() = 0;



//     //     end;
//     // end;

// }