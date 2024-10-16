report 50106 "Vendor overdue detail-MSME"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    // Caption = 'vendorl';
    RDLCLayout = 'vendorl.rdl';
    //INFOBAN REPORT- FOR VENDOR LEDGER ENTRIES

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            //DataItemTableView = sorting("Entry No.") where("Document Type" = const(Invoice));
            DataItemTableView = where("Document Type" = filter(Invoice));
            RequestFilterFields = "Document No.", "Posting Date";

            //DataItemTableView=

            column(DocumentDate_VendorLedgerEntry; "Document Date")
            {
                Caption = 'Posting Date';
            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Document_Type; "Document Type")
            {
                Caption = 'Document type';

            }
            column(VendorNo_VendorLedgerEntry; "Vendor No.")
            {
                Caption = 'Vendor No';
            }
            column(VendorName_VendorLedgerEntry; "Vendor Name")
            {
                Caption = 'Vendor Name';
            }
            column(DueDate_VendorLedgerEntry; "Due Date")
            {
                Caption = 'Due Date';
            }
            column(Document_No_; "Document No.")
            {
                Caption = 'Document No';

            }
            column(Posting_Date; "Posting Date")
            {
                Caption = 'Posting Date';

            }
            column(SalesPersonName; SalesPersonName)
            {

            }
            column(Salecode; Salecode)
            {

            }
            column(DelayDays; DelayDays) { }
            // column(Amount; Amountlc)
            // {
            //     Caption = 'Amount';

            // }
            column(Amount__LCY_; "Amount (LCY)")
            {

            }
            // column(PaymentAount; PaymentAount)
            // {
            //     Caption = 'Payment Amount';

            // }
            // column(PaymentDate; PaymentDate)
            // {
            //     Caption = 'Payment Date';

            // }

            column(MSME; MSME)
            {

            }
            column(StartDate; StartDate)
            {

            }
            column(EndDate; EndDate)
            {

            }

            column(PaymentTerms; PaymentTerms)
            {
                Caption = 'Payment terms:-Example-10 days';

            }


            dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
            {
                DataItemLinkReference = "Vendor Ledger Entry";
                DataItemLink = "Vendor Ledger Entry No." = field("Closed by Entry No.");
                // DataItemLink = "Vendor Ledger Entry No." = field("Entry No.");
                //"Initial Document Type" = field("Document Type");
                //DataItemLink = "Document No." = field("Document No.");
                DataItemTableView = where("Initial Document Type" = filter(" " | Payment));
                //    DataItemTableView = where("Initial Document Type" = const(" "));
                // DataItemTableView = where("Initial Document Type" = filter(Invoice));
                column(Document_No_Detail; "Document No.")
                {

                }

                column(Amounts; Amount)
                {

                }
                column(Posting_Dates; "Posting Date")
                {

                }
                column(PaymentAount; PaymentAount)
                {

                }
                column(PaymentDate; PaymentDate)
                {

                }
                column(Initial_Entry_Due_Date; "Initial Entry Due Date") { }
                // column(Initial_Entry_Due_Date; InitialDate)
                // {

                // }
                // column(InitialDate; InitialDate)
                // {

                // }
                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    //rehan 
                    //     if PaymentDoumentNo <> '' then
                    //         "Detailed Vendor Ledg. Entry".SetFilter("Document No.", PaymentDoumentNo);
                    //     "Detailed Vendor Ledg. Entry".SetFilter("Initial Document Type", '%1|%2|%3', "Initial Document Type"::Payment, "Initial Document Type"::" ", "Initial Document Type"::"Credit Memo");
                end;

                trigger OnAfterGetRecord()
                var
                    myInt: Code[20];


                begin
                    Clear(DelayDays);

                    //  Message('hi');
                    //  if "Initial Document Type"="Initial Document Type"::" "&
                    PaymentAount := 0;
                    PaymentDate := 0D;

                    PaymentAount := "Detailed Vendor Ledg. Entry"."Amount (LCY)";
                    PaymentDate := "Detailed Vendor Ledg. Entry"."Posting Date";

                    if (PaymentDate <> 0D) and ("Vendor Ledger Entry"."Due Date" <> 0D) then begin
                        // DelayDuration := PaymentDate - "Due Date";
                        DelayDays := PaymentDate - "Vendor Ledger Entry"."Due Date";

                        if DelayDays < 0 then begin
                            DelayDays := 0;
                        end else begin
                            DelayDays := DelayDays;
                        end;

                    end;

                    //   if (PaymentDate <> 0D) and ("Vendor Ledger Entry"."Due Date" <> 0D) then begin
                    //     // DelayDuration := PaymentDate - "Due Date";
                    //     DelayDays := PaymentDate - "Vendor Ledger Entry"."Due Date";
                    // end else begin
                    //     DelayDays := 0; // Handle case where dates are not valid
                    // end;
                    //     Clear(myInt);
                    //     myInt := "Detailed Vendor Ledg. Entry"."Document No.";

                    //     DetailedVendorLedger.Reset();
                    //     // DetailedVendorLedger.SetRange("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                    //     DetailedVendorLedger.SetRange("Document No.", "Detailed Vendor Ledg. Entry"."Document No.");
                    //     DetailedVendorLedger.Setfilter("Initial Document Type", '%1|%2', "Initial Document Type"::Payment, "Initial Document Type"::" ");
                    //     if DetailedVendorLedger.FindFirst() then begin
                    //         InitialDate := "Detailed Vendor Ledg. Entry"."Initial Entry Due Date";
                    //     end;
                end;

            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                delayduration: Integer;

            begin
                DelayDays := EndDate - "Vendor Ledger Entry"."Due Date";


                //  For Vendor MSME
                // Vendor.Reset();
                // Vendor.SetRange("No.","Vendor Ledger Entry"."Vendor No.");
                // Vendor.FindFirst() then begin
                //     MSME:=Vendor.MSME
                // end
                // VendorLedger.Reset();
                // VendorLedger.SetRange("Due Date", "Detailed Vendor Ledg. Entry"."Initial Entry Due Date");
                // if VendorLedger.FindLast() then begin
                //     InitialDate := "Detailed Vendor Ledg. Entry"."Initial Entry Due Date";

                // end;
                //  DelayDays := EndDate - "Vendor Ledger Entry"."Due Date";

                // DetailedVendorLedger.Reset();
                // DetailedVendorLedger.SetRange("Vendor Ledger Entry No.", "Vendor Ledger Entry"."Entry No.");
                // DetailedVendorLedger.SetRange("Initial Document Type", DetailedVendorLedger."Initial Document Type"::Invoice);
                // if DetailedVendorLedger.FindFirst() then begin
                //     if VenDledgerntry.Get(DetailedVendorLedger."Vendor Ledger Entry No.") then
                //         PaymentDoumentNo := DetailedVendorLedger."Document No.";
                // end;

                PurchInv.Reset();
                PurchInv.SetRange("No.", "Vendor Ledger Entry"."Document No.");
                if PurchInv.FindFirst() then begin
                    PaymentTerms := PurchInv."Payment Terms Code";
                end;

                //--Rehan
                //This is code is written for SalesPerson Name for my instance In Vendor Ledger the salesperson was not there
                //I have just writtem the code for Infoban you just need to change the table.
                // CustLedger.Reset();
                // CustLedger.SetRange("Document Type", CustLedger."Document Type"::Invoice);
                // CustLedger.SetRange("Document No.", PostedSalesinv."No.");
                // if CustLedger.FindFirst() then begin
                //     SalesPersonName := salesperson.Name;
                // end;


                //For Sales Person Code and name
                salesperson.Reset();
                salesperson.SetRange(Code, VendorLedger."Purchaser Code");
                if salesperson.FindFirst() then begin
                    SalesPersonName := salesperson.Name;
                    Salecode := salesperson.Code;
                end;

            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                if EndDate <> 0D then
                    "Vendor Ledger Entry".SetRange("Posting Date", StartDate, EndDate)
                else
                    "Vendor Ledger Entry".SetRange("Posting Date", StartDate);
            end;

        }


    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                    field(StartDate; StartDate)
                    {
                        ApplicationArea = all;
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }
    //   local procedure GetDocumentNo(): Code[20]
    // var
    //     VendLedgEntry: Record "Vendor Ledger Entry";
    // begin
    //     if VendLedgEntry.Get(Rec."Vendor Ledger Entry No.") then;
    //     exit(VendLedgEntry."Document No.");
    // end;

    var
        myInt: Integer;
        PaymentLines: Record "Detailed Vendor Ledg. Entry" temporary;
        VendorLedger: Record "Vendor Ledger Entry";
        InitialDate: date;

        PaymentTerms: Code[20];
        Vendor: Record Vendor;
        Salecode: Code[20];

        DetailedVendorLedger: Record "Detailed Vendor Ledg. Entry";
        PurchInv: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
        PaymentDate: Date;
        DelayDays: Integer;
        PaymentAount: Decimal;
        MSME: Option;
        SalesPersonName: Text;
        CustLedger: Record "Cust. Ledger Entry";
        salesperson: Record "Salesperson/Purchaser";
        PostedSalesinv: Record "Sales Invoice Header";
        StartDate: Date;
        EndDate: Date;
        VLP: page "Vendor Ledger Entries";
        PaymentDoumentNo: Code[20];
        VenDledgerntry: Record "Vendor Ledger Entry";


}