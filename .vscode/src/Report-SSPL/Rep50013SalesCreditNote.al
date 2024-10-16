report 50013 "Sales Credit Note"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Credit Note-SSPL';
    DefaultLayout = RDLC;
    //Credit Note  For SSPL-REHAN SAYED
    RDLCLayout = 'SalesCreditnote.rdl';
    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.";
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {

            }
            column(RemarkHeader; Remark)
            {

            }


            column(CustomerStatecodeNo; CustomerStatecodeNo)
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }

            column(Document_Date; "Document Date")
            {

            }
            column(External_Document_No_; "External Document No.")
            { }


            column(ShiptoName_SalesInvoiceHeader; "Ship-to Name")
            {
            }
            column(ShiptoCode_SalesInvoiceHeader; "Ship-to Code")
            {
            }
            column(ShiptoCity_SalesInvoiceHeader; "Ship-to City")
            {
            }
            column(ShipmentDate_SalesInvoiceHeader; "Shipment Date")
            {
            }
            column(ShiptoCounty_SalesInvoiceHeader; "Ship-to County")
            {
            }
            column(ShiptoName2_SalesInvoiceHeader; "Ship-to Name 2")
            {
            }
            column(ShiptoAddress_SalesInvoiceHeader; "Ship-to Address")
            {
            }
            column(Ship_to_Address_2; "Ship-to Address 2")
            { }
            column(ShiptoContact_SalesInvoiceHeader; "Ship-to Contact")
            {
            }
            column(ShiptoCustomer_SalesInvoiceHeader; "Ship-to Customer")
            {
            }
            column(ShiptoPostCode_SalesInvoiceHeader; "Ship-to Post Code")
            {
            }
            column(ShiptoAddress2_SalesInvoiceHeader; "Ship-to Address 2")
            {
            }
            column(ShiptoGSTRegNo_SalesInvoiceHeader; "Ship-to GST Reg. No.")
            {
            }
            column(ShippingAgentCode_SalesInvoiceHeader; "Shipping Agent Code")
            {
            }
            column(ShiptoGSTCustomerType_SalesInvoiceHeader; "Ship-to GST Customer Type")
            {
            }
            column(ShipmentMethodCode_SalesInvoiceHeader; "Shipment Method Code")
            {
            }
            column(No_SalesInvoiceHeader; "No.")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(BilltoCity_SalesInvoiceHeader; "Bill-to City")
            {
            }
            column(BilltoCounty_SalesInvoiceHeader; "Bill-to County")
            {
            }
            column(BilltoAddress_SalesInvoiceHeader; "Bill-to Address")
            {
            }
            column(Bill_to_Address_2; "Bill-to Address 2")
            { }
            column(BilltoPostCode_SalesInvoiceHeader; "Bill-to Post Code")
            {
            }
            column(BilltoCountryRegionCode_SalesInvoiceHeader; "Bill-to Country/Region Code")
            {
            }
            column(BilltoCustomerNo_SalesInvoiceHeader; "Bill-to Customer No.")
            {
            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }


            column(SalesPersonName; SalesPersonName)
            {
            }
            column(AgentCode; AgentCode)
            {

            }

            column(CustomerGSTNo; CustomerGSTNo)
            {

            }
            column(CustomerPan; CustomerPan)
            {

            }
            column(CustomerStateCode; CustomerStateCode)
            {

            }
            column(CustomerStateName; CustomerStateName)
            {

            }
            column(CompanyInfoName; CompanyInfo.Name)
            {

            }
            column(CompanyInfoAddress; CompanyInfo.Address)
            {

            }
            column(CompanyInfoAdress2; CompanyInfo."Address 2")
            {

            }
            column(CompanyInfoCity; CompanyInfo.City)
            {

            }
            column(CompanyInfoGSTNo; CompanyInfo."GST Registration No.")
            {

            }
            column(CompanyInfoPanno; CompanyInfo."P.A.N. No.")
            {

            }
            column(CompanyInfoEmail; CompanyInfo."E-Mail")
            {

            }
            column(CompanyInfoPhoneno; CompanyInfo."Phone No.")
            {

            }
            column(CompanyInfodrug; CompanyInfo."Drug Liscense No.")
            {

            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyInfoBankName; CompanyInfo."Bank Name")
            {

            }
            column(CompanyInfoBankAccno; CompanyInfo."Bank Account No.")
            {

            }
            column(CompanyInfoIFSC; CompanyInfo."SWIFT Code")
            {

            }
            column(QR_Code; "QR Code")
            {

            }
            column(IRN_Hash; "IRN Hash")
            {

            }
            column(E_Way_Bill_No_; "E-Way Bill No.")
            {

            }
            column(Vehicle_No_; "Vehicle No.")
            {
            }
            column(Remark; Remark)
            { }
            column(Acknowledgement_No_; "Acknowledgement No.")
            {

            }
            column(Acknowledgement_Date; "Acknowledgement Date")
            {

            }


            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(OutPutNo; OutPutNo)
                {
                }
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));



                    column(CopyText; COPYTEXT) { }

                    dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
                    {
                        DataItemLinkReference = "Sales Cr.Memo Header";
                        DataItemLink = "Document No." = field("No.");
                        // DataItemTableView = where(Type = filter());
                        // DataItemTableView = where("No." = filter(<> ''));
                        DataItemTableView = where(Type = filter('Item'));
                        column(No_s; "No.")
                        {

                        }
                        column(Description; Description)
                        {

                        }
                        column(Quantity; Quantity)
                        {

                        }
                        column(HSN_SAC_Code; "HSN/SAC Code")
                        {

                        }
                        column(Unit_of_Measure_Code; "Unit of Measure Code")
                        {

                        }
                        column(Line_Amount; "Line Amount")
                        {

                        }
                        column(CGSTRate; CGSTRate)
                        {

                        }
                        column(SGSTRate; SGSTRate)
                        {

                        }
                        column(IGSTRate; IGSTRate)
                        {

                        }
                        column(CGSTAmt; CGSTAmt)
                        {

                        }
                        column(SGSTAmt; SGSTAmt)
                        {

                        }
                        column(IGSTAmt; IGSTAmt)
                        {

                        }

                        column(Unit_Price_Incl__of_Tax; "Unit Price Incl. of Tax")
                        {

                        }
                        column(Unit_Price; "Unit Price")
                        {

                        }
                        column(IGSTAMT2; IGSTAMT2)
                        {

                        }
                        column(AmtinWords; Wordsinarray[1] + ' ' + Wordsinarray[2])
                        {

                        }
                        // column(AmountInWords; AmountInWords[1] + ' ' + AmountinWords[2])//AmountInWords
                        // {
                        // }
                        column(TaxAmountInWords; TaxNoText[1] + ' ' + TaxNoText[2]) { }
                        column(GrandTotal; GrandTotal)
                        {

                        }
                        column(TotalCGST; TotalCGST)
                        { }
                        column(TotalSGST; TotalSGST)
                        { }
                        column(TotalIGST; TotalIGST)
                        { }
                        column(GrandTotalRound; Round(Roundgrandtotal, 1)) { }
                        column(RoundingAmount; RoundingAmount)
                        {

                        }


                        dataitem("Value Entry"; "Value Entry")
                        {
                            DataItemLinkReference = "Sales Cr.Memo Line";
                            DataItemLink = "Document No." = field("Document No."), "Document Line No." = field("Line No.");
                            column(Srno; Srno)
                            {

                            }
                            column(ItemLotNo; ItemLotNo)
                            {

                            }
                            column(ExpirationDates; ExpirationDates)
                            {

                            }
                            column(ManufaturingDate; ManufaturingDate)
                            {
                            }

                            column(ValueQuantity; abs(ValueQuantity))
                            {

                            }
                            column(InvLineAmount; InvLineAmount)
                            {

                            }

                            trigger OnAfterGetRecord()
                            var
                                myInt: Integer;
                            begin
                                Srno += 1;
                                //ItemLedger.get("Entry No.");
                                // ItemLedger.SetRange("Entry No.", "Value Entry"."Entry No.");
                                ItemLedger.Reset();
                                ItemLedger.SetRange("Entry No.", "Value Entry"."Item Ledger Entry No.");
                                if ItemLedger.FindFirst() then begin
                                    ItemLotNo := ItemLedger."Lot No.";
                                    ExpirationDates := ItemLedger."Expiration Date";
                                    ValueQuantity := ItemLedger.Quantity;
                                    InvLineAmount := ItemLedger."Sales Amount (Actual)";
                                    ManufaturingDate := ItemLedger."Warranty Date";
                                end;

                            end;

                        }

                        trigger OnAfterGetRecord()
                        var
                            myInt: Integer;
                        begin

                            //Location Details
                            // Reclocation.Reset();
                            // Reclocation.SetRange(Code, "Sales Invoice Header"."Location Code");
                            // if Reclocation.FindFirst() then begin
                            //     LocationAddress := Reclocation.Address;
                            //     LocationAddress2 := Reclocation."Address 2";
                            //     LocationCity := Reclocation.City;
                            //     LocationEmail := Reclocation."E-Mail";
                            //     LocationGSTNo := Reclocation."GST Registration No.";
                            //     //LocationPanno:=Reclocation.P
                            // end;

                            //Procker Name
                            SalesPerson.Reset();
                            SalesPerson.SetRange(Code, "Sales Cr.Memo Header"."Salesperson Code");
                            if SalesPerson.FindFirst() then begin
                                SalesPersonName := SalesPerson.Name;

                            end;
                            //Dispatch Details
                            ShippingAgent.Reset();
                            ShippingAgent.SetRange(Code, "Sales Cr.Memo Header"."Shipping Agent Code");
                            if ShippingAgent.FindFirst() then begin
                                AgentCode := ShippingAgent.Code;
                            end;

                            //------------------yash
                            Clear(CGSTAmt);
                            Clear(CGSTRate);
                            Clear(SGSTRate);
                            Clear(SGSTAmt);
                            Clear(IGStAmt);
                            Clear(GrandTotal);
                            Clear(IGSTAMT2);
                            Clear(Roundgrandtotal);
                            Clear(IGSTRate);
                            Clear(GSTComponentCGST);
                            Clear(GSTComponentSGST);
                            Clear(GSTComponentIGST);
                            Clear(CustomerPostingGrp);
                            if CustomerPostingGrp.get("Sales Cr.Memo Header"."Customer Posting Group") then;
                            SalesCrMemoline.Reset();
                            SalesCrMemoline.SETFILTER("Type", '%1', SalesCrMemoline.Type::"G/L Account");
                            SalesCrMemoline.SetRange("Document No.", "Sales Cr.Memo Header"."No.");
                            SalesCrMemoline.SETFILTER("No.", CustomerPostingGrp."Invoice Rounding Account");
                            if SalesCrMemoline.FindFirst() then begin
                                RoundingAmount := SalesCrMemoline."Line Amount";
                            end;

                            DetailedGSTLedgerEntry.RESET;
                            DetailedGSTLedgerEntry.SETRANGE("Document No.", "Document No.");
                            DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                            DetailedGSTLedgerEntry.SETRANGE("GST Group Code", "GST Group Code");
                            DetailedGSTLedgerEntry.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry."Transaction Type"::Sales);
                            DetailedGSTLedgerEntry.SETRANGE("GST Component Code", 'CGST');
                            IF DetailedGSTLedgerEntry.FIND('-') THEN
                                REPEAT
                                    CGSTAmt := Abs(DetailedGSTLedgerEntry."GST Amount");
                                    CGSTRate := DetailedGSTLedgerEntry."GST %";
                                UNTIL DetailedGSTLedgerEntry.NEXT() = 0;
                            //SGST
                            DetailedGSTLedgerEntry1.RESET;
                            DetailedGSTLedgerEntry1.SETRANGE("Document No.", "Document No.");
                            DetailedGSTLedgerEntry1.SETRANGE("Document Line No.", "Line No.");
                            DetailedGSTLedgerEntry1.SETRANGE("GST Group Code", "GST Group Code");
                            DetailedGSTLedgerEntry1.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry1."Transaction Type"::Sales);
                            DetailedGSTLedgerEntry1.SETRANGE("GST Component Code", 'SGST');
                            IF DetailedGSTLedgerEntry1.FIND('-') THEN
                                REPEAT
                                    SGSTAmt := Abs(DetailedGSTLedgerEntry1."GST Amount");
                                    SGSTRate := DetailedGSTLedgerEntry1."GST %";
                                UNTIL DetailedGSTLedgerEntry1.NEXT() = 0;
                            //IGST
                            DetailedGSTLedgerEntry2.RESET;
                            DetailedGSTLedgerEntry2.SETRANGE("Document No.", "Document No.");
                            DetailedGSTLedgerEntry2.SETRANGE("Document Line No.", "Line No.");
                            DetailedGSTLedgerEntry2.SETRANGE("GST Group Code", "GST Group Code");
                            DetailedGSTLedgerEntry2.SETFILTER("Transaction Type", '%1', DetailedGSTLedgerEntry2."Transaction Type"::Sales);
                            DetailedGSTLedgerEntry2.SETRANGE("GST Component Code", 'IGST');
                            IF DetailedGSTLedgerEntry2.FindSet() THEN
                                REPEAT
                                    IGSTRate := DetailedGSTLedgerEntry2."GST %";
                                    IGSTAMT2 := Abs(DetailedGSTLedgerEntry2."GST Amount");

                                    if DetailedGSTLedgerEntry2."Currency Code" = '' then
                                        IGSTAmt := Abs(DetailedGSTLedgerEntry2."GST Amount")
                                    else
                                        IGSTAmt := IGSTAMT2 * "Sales Cr.Memo Header"."Currency Factor"
                                UNTIL DetailedGSTLedgerEntry2.NEXT() = 0;
                            if CopyLoop.Number <> xpglp then begin
                                Clear(Total);
                                Clear(TaxTotal);
                            end;
                            Total := Total + "Sales Cr.Memo Line"."Line Amount";    // Amt;
                            TaxTotal += Abs(CGSTAmt) + AbS(SGSTAmt) + Abs(IGSTAMT2);
                            GrandTotal := Total + TaxTotal + RoundingAmount; //Abs(CGSTAmt) + Abs(SGSTAmt) + Abs(IGSTAmt);

                            TotalIGST += Abs(IGStAmt2);
                            TotalCGST += Abs(CGSTAmt);
                            TotalSGST += Abs(SGSTAmt);
                            Roundgrandtotal += Total + TaxTotal;
                            PostedVoucher.InitTextVariable;
                            PostedVoucher.FormatNoText(Wordsinarray, GrandTotal, '');
                            // AmtinWords := Wordsinarray[1] + Wordsinarray[2];

                            PostedVoucher1.InitTextVariable();
                            PostedVoucher1.FormatNoText(TaxNoText, TaxTotal, '');
                            //  end;
                            xpglp := CopyLoop.Number;
                        end;
                    }
                    trigger OnPreDataItem()
                    var
                        myInt: Integer;
                    begin
                        Srno := 0;
                    end;

                }



                trigger OnAfterGetRecord();
                begin
                    IF Number = 1 THEN BEGIN
                        COPYTEXT := TEXT001;
                        OutPutNo += 1;
                    END

                    ELSE
                        IF Number = 2 THEN BEGIN
                            COPYTEXT := TEXT002;
                            OutPutNo += 1;
                        END

                        ELSE
                            IF Number = 3 THEN BEGIN
                                COPYTEXT := TEXT003;
                                OutPutNo += 1;
                            END
                            ELSE
                                IF Number = 4 THEN BEGIN
                                    COPYTEXT := TEXT004;
                                    OutPutNo += 1;
                                END;
                    CurrReport.PAGENO := 1;
                end;

                trigger OnPreDataItem();
                begin
                    Clear(total);
                    Clear(TaxTotal);
                    IF NoOfCopies <> 0 THEN
                        NoOfLoops := NoOfCopies
                    ELSE
                        NoOfLoops := 2;
                    //MESSAGE('%1',NoOfLoops);                          // ABS(NoOfCopies) + 1;
                    IF NoOfLoops <= 1 THEN
                        NoOfLoops := 1;
                    COPYTEXT := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutPutNo := 1;
                    //  TotalAmount := 0;
                end;
            }


            trigger OnAfterGetRecord()
            var
            //  myInt: Integer;
            begin
                Clear(Remark);
                RemarkSrNo := 0;

                SalesCommentLine.Reset();
                SalesCommentLine.SetRange("Document Type", SalesCommentLine."Document Type"::"Posted Invoice");
                SalesCommentLine.SetRange("No.", "Sales Cr.Memo Header"."No.");
                if SalesCommentLine.FindSet() then
                    repeat
                        RemarkSrNo += 1;
                        Remark += Format(RemarkSrNo) + ' .' + '&nbsp;' + SalesCommentLine.Comment + '<BR>';
                    until SalesCommentLine.Next() = 0;
                Customer.Reset();
                Customer.SetRange("No.", "Sales Cr.Memo Header"."Bill-to Customer No.");
                if Customer.FindFirst() then begin
                    CustomerPan := Customer."P.A.N. No.";
                    CustomerGSTNo := Customer."GST Registration No.";
                    CustomerStateCode := Customer."State Code";
                    stateRec.Reset();
                    stateRec.SetRange(Code, Customer."State Code");
                    if stateRec.FindFirst() then begin
                        CustomerStateName := stateRec.Description;
                        CustomerStatecodeNo := stateRec."State Code (GST Reg. No.)";
                    end;
                end;
            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin

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
                    field("No Of Copies"; NoOfCopies)
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



    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        CompanyInfo.GET();
        CompanyInfo.CalcFields(Picture);

    end;



    var
        SalesCommentLine: Record "Sales Comment Line";
        RemarkSrNo: Integer;
        Remark: Text;
        myInt: Integer;
        Reclocation: Record Location;
        AmtinWords: Text[200];

        xpglp: Integer;
        //CustomerStateName: Text[100];

        //PostedVoucherRep: Report "Posted Voucher";
        ItemLedger: Record "Item Ledger Entry";
        SalesPerson: Record "Salesperson/Purchaser";
        ShippingAgent: Record "Shipping Agent";
        AgentCode: Code[20];
        Srno: Integer;
        SalesPersonName: Text[100];
        LocationAddress: Text[100];
        LocationAddress2: Text[100];
        LocationCity: Text[40];
        LocationEmail: Text[100];
        LocationPhoneNo: Text[20];
        AmountinWords: Text;

        // TOTALCGST: Decimal;
        // TotalLineamount: Decimal;
        // TOTALSGST: Decimal;
        // TOTALIGST: Decimal;
        RoundingAmount: Decimal;
        CustomerPostingGrp: Record "Customer Posting Group";
        Amountneg: Decimal;
        LocationGSTNo: Code[20];
        ValueQuantity: Decimal;
        LocationPanno: Code[20];
        CustomerStatecodeNo: Code[20];
        Customer: Record Customer;
        Currency: Code[20];
        CustomerPanno: Code[20];
        CustomerGSTNo: Code[20];
        SalesInvoiceLine: Record "Sales Invoice Line";        //ItemLedger: Record "Item Ledger Entry";
        CompanyInfo: Record "Company Information";
        //  PostedVoucherRep2: Report "Posted Voucher";
        CommentDescription: Text[500];
        TEXT001: Label 'Original for Recipent';
        TEXT002: Label 'Duplicate for  Transporter';
        TEXT003: Label 'Triplicate for Supplier';
        TEXT004: Label 'Extra Copy';
        PageCaption: Label 'Page %1 of %2';
        NoOfCopies: Integer;
        TaxNoText: array[2] of Text;
        NoOfLoops: Integer;
        OutPutNo: Integer;
        COPYTEXT: Text;
        NoOfRows: Integer;
        NoOfRecords: Integer;
        stateRec: Record State;
        CustomerStateCode: Code[10];
        LotNo: Code[20];
        ExpirationDate: Date;
        // GRANDTOTAL: Decimal;
        InvLineAmount: Decimal;
        PayTerms: Record "Payment Terms";
        "Sales Invoice Line1": Record "Sales Invoice Line";
        //RecCust: Record Customer;
        CustomerGST: Code[20];
        Particular: Text[700];
        CustomerPan: Code[20];
        AmountSales: Decimal;
        commentLine: Record "Sales Comment Line";
        //GST 
        GSTDetailLeger: Record "Detailed GST Ledger Entry";
        // Tax: Decimal;
        // tax2: Decimal;
        baseValue: Decimal;
        // CGSTAmt: Decimal;
        // GSTComponentCGST: Code[20];
        // SGSTAmt: Decimal;
        // GSTComponentSGST: Code[20];
        Bank: Record "Bank Account";
        Bankno: Code[100];
        BankAccno: Text[30];
        BankName: Text[100];
        BankIFSC: Text[190];
        // IGSTAmt: Decimal;
        CGSTPERCENT: Decimal;
        SGSTPERCENT: Decimal;
        IGSTPERCENT: Decimal;
        CustomerSateCode: Code[10];
        CustomerStateName: text[20];
        StateS: Record State;
        //GSTComponentIGST: Code[20];
        UTGST: Decimal;
        brand: Code[50];
        // CGSTRate: Decimal;
        // SGSTRate: Decimal;
        // IGSTRate: Decimal;
        TaxDescription: Decimal;
        taxDesc: text;
        tdsValue: Decimal;
        GrossAmt: Decimal;
        total: Decimal;
        totalGST: Decimal;
        CommentTypeDescription: Text[1000];
        // Wordsinarray: array[2] of Text;
        // Wordsinarray2: array[2] of Text;
        // AmountInWords: Text[200];
        // Wordsinarray: array[2] of Text;
        // Wordsinarray2: array[2] of Text;
        // TaxInWords2: Text[200];
        total1: Decimal;
        ItemLotNo: Code[50];
        ExpirationDates: Date;
        ManufaturingDate: Date;


        comments: Text;
        SalesCrMemoline: Record "Sales Cr.Memo Line";
        //------yash 

        CGSTRate: Decimal;
        CGSTAmt: Decimal;
        SGSTRate: Decimal;
        SGSTAmt: Decimal;
        IGSTRate: Decimal;
        IGStAmt: Decimal;
        TotalCGST: Decimal;
        TotalSGST: Decimal;
        TotalIGST: Decimal;
        BankAccount: Record "Bank Account";
        GSTComponentCGST: Code[20];
        GSTComponentSGST: Code[20];
        GSTComponentIGST: Code[20];
        TotalAmount: Decimal;
        FinalAmount: Decimal;

        Wordsinarray: array[2] of Text;
        Wordsinarray2: array[2] of Text;
        TaxInWords2: Text[200];
        Tax: Decimal;
        Tax2: Decimal;
        PostedVoucher1: Report "Posted Voucher";
        PostedVoucher: Report "Posted Voucher";
        // PostedVoucher1:Report "Posted Voucher";

        PostedVoucherRep: Report "Posted Voucher";
        PostedVoucherRep2: Report "Posted Voucher";

        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        DetailedGSTLedgerEntry1: Record "Detailed GST Ledger Entry";
        DetailedGSTLedgerEntry2: Record "Detailed GST Ledger Entry";
        TaxTotal: Decimal;
        IGSTAMT2: Decimal;
        Roundgrandtotal: Decimal;
        GrandTotal: Decimal;


    local procedure ClearData()
    Begin
        IGSTAMT2 := 0;
        IGSTRate := 0;
        SGSTRate := 0;
        CGSTRate := 0;
        CGSTAmt := 0;
        SGSTAmt := 0;
        IGSTAmt := 0;
        GrandTotal := 0;
        Roundgrandtotal := 0;
        //  SERIALNO :=
        //   Clear(SERIALNO);

        Clear(AmountinWords);
        // Clear(TaxAmountInWords);
        Clear(Roundgrandtotal);
        Clear(GrandTotal);
        Clear(TaxTotal);
        Clear(Total);

    End;





}

