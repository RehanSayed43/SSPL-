report 50031 "AK-MSME"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    // Caption = 'vendorl';
    RDLCLayout = 'v.rdl';
    //INFOBAN REPORT- FOR VENDOR LEDGER ENTRIES

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            RequestFilterFields = "Document No.", "Posting Date";

            dataitem("Vendor Ledger Entry2"; "Vendor Ledger Entry")
            {
                column(bbbb; bbbb) { }
                column(vendDocument_No_; "Vendor Ledger Entry"."Document No.") { }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    bbbb := 'from vend led 2';
                end;

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    CalcFields("Remaining Amount");
                    "Vendor Ledger Entry2".SetFilter("Remaining Amount", '<>%1', 0);
                    // Clear(DelayDays);

                end;
            }
            dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
            {
                DataItemLinkReference = "Vendor Ledger Entry";
                DataItemLink = "Vendor Ledger Entry No." = field("Entry No.");
                DataItemTableView = where("Initial Document Type" = filter(Invoice));
                dataitem("Detailed Vendor Ledg. Entry2"; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLinkReference = "Detailed Vendor Ledg. Entry";
                    DataItemLink = "Document No." = field("Document No.");
                    DataItemTableView = where("Initial Document Type" = filter(" " | Payment), "Entry Type" = filter(Application));

                    column(Document_No_; "Vendor Ledger Entry"."Document No.") { }
                    column(DocumentDate; "Vendor Ledger Entry"."Document Date")
                    {

                    }
                    column(ExternalDocNo; "Vendor Ledger Entry"."External Document No.")
                    {

                    }
                    column(PostingDaate; "Vendor Ledger Entry"."Posting Date")
                    {

                    }
                    column(DocType; "Vendor Ledger Entry"."Document Type")
                    {

                    }
                    column(vendorInvno; "Vendor Ledger Entry"."Vendor No.")
                    {

                    }
                    column(VendorName; "Vendor Ledger Entry"."Vendor Name")
                    {

                    }
                    column(StartDate; StartDate)
                    {

                    }
                    column(EndDate; EndDate)
                    {

                    }
                    column(DuDate; "Vendor Ledger Entry"."Due Date")
                    {

                    }
                    column(Amunts; "Vendor Ledger Entry"."Amount (LCY)")
                    {

                    }
                    column(Amount__LCY_; "Amount (LCY)")
                    {

                    }
                    column(DelayDays; DelayDays)
                    {

                    }
                    column(Initial_Entry_Due_Date; "Initial Entry Due Date") { }
                    // column(aaaa; aaaa) { }
                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;
                    begin
                        //aaaa := 'det led 2';
                    end;

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    // Clear(DelayDays);
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
                end;
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                aaaa := 'vend led';
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

    var
        aaaa: text;
        bbbb: text;
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