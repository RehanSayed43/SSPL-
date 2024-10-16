report 50007 "Purchase Order Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'RM-PM  Purchase Order Report-SSPL';
    DefaultLayout = RDLC;
    RDLCLayout = 'PurchaseOrder.rdl';
    // EnableHyperlinks = true;


    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            // RequestFilterFields = "No.";

            column(No_; "No.")
            {
            }
            column(termsOfPayment; termsOfPayment) { }
            column(MobileNO; MobileNO) { }
            column(TelNO; TelNO) { }
            column(Remarks; Remark)
            {

            }

            column(Phone1; Phone1)
            {

            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Due_Date; "Due Date")
            {

            }
            column(Email1; Email1)
            {

            }
            column(ContactName; ContactName)
            {

            }
            column(ContactEmailId; ContactEmailId)
            {

            }
            column(ContactPhoneNo; ContactPhoneNo)
            {

            }
            column(VendorGST; VendorGST)
            {

            }
            column(VendorPan; VendorPan)
            {

            }
            column(VendorContactName; VendorContactName)
            {

            }
            column(commentHDR; commentHDR)
            {

            }
            column(Your_Reference; "Your Reference")
            {
                // Caption = 'Quote No';

            }
            column(Order_Date; "Order Date")
            {
                // Caption = 'Quote Date';

            }
            column(Pay_to_Address; "Pay-to Address" + "Pay-to Address 2" + "Pay-to City" + ' - ' + "Pay-to Post Code" + ', ' + stateAdd + ', ' + ContryRegion + ', ' + "Pay-to County")
            {

            }
            column(Pay_to_City; "Pay-to City")
            {

            }
            column(Pay_to_Post_Code; "Pay-to Post Code")
            {

            }

            column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Buy-from Address")
            {
            }
            column(BuyfromCity_PurchaseHeader; "Buy-from City")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Buy-from Contact")
            {
            }
            column(PostingDate_PurchaseHeader; "Posting Date")
            {
            }


            column(Quote_No_; "Quote No.")
            {

            }
            column(Reference_Invoice_No_; "Reference Invoice No.")
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }

            column(Ship_to_Address; "Ship-to Address")
            {

            }
            column(Ship_to_Address_2; "Ship-to Address 2")
            {

            }
            column(Ship_to_City; "Ship-to City")
            {

            }
            column(Ship_to_County; "Ship-to County")
            {

            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {

            }
            column(companyinfogstregno; companyinfo."GST Registration No.")
            {

            }
            column(Billname; Billname)
            {

            }
            column(BillAddress; BillAddress)
            {

            }
            column(BillAddress2; BillAddress2)
            {

            }
            column(Billcity; Billcity)
            {

            }
            column(BillPostcode; BillPostcode)
            {

            }
            column(companyinfoname; companyinfo.Name)
            {

            }
            column(companyinfoaddress; companyinfo.Address)
            {

            }
            column(companyinfocity; companyinfo.City + '- ' + companyinfo."Post Code")
            {

            }
            column(companyinfocountry; stateAdd + ', ' + ContryRegion)
            {
            }
            column(HomePage; companyinfo."Home Page") { }
            column(picture; companyinfo.Picture) { }
            column(companyinfostatecode; companyinfo."State Code")
            {

            }
            column(companyinfophoneno; companyinfo."Phone No.")
            {

            }
            column(companyinfoemail; companyinfo."E-Mail")
            {

            }

            column(companyinfogst; companyinfo."GST Registration No.")
            {

            }
            column(companyinfopan; companyinfo."P.A.N. No.")
            {

            }
            column(CGST; CGST)
            {

            }
            column(SGST; SGST) { }
            column(IGST; IGST) { }
            column(CGSTRATE; CGSTRATE) { }
            column(SGSTRATE; SGSTRATE) { }
            column(IGSTRATE; IGSTRATE) { }
            column(TOTALCGST; TOTALCGST)
            {

            }

            column(TOTALSGST; TOTALSGST) { }
            column(TOTALIGST; TOTALIGST) { }
            column(GrandTotal; GrandTotal)
            {

            }
            column(VendorStateCdode; VendorStateCdode)
            {

            }
            column(VendorPostcode; VendorPostcode)
            {

            }
            column(StateNameVendor; StateNameVendor)
            {

            }
            column(CityVendor; CityVendor)
            {

            }
            column(LocationGStno; LocationGStno)
            {

            }




            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLinkReference = "Purchase Header";
                DataItemLink = "Document No." = field("No.");
                //DataItemTableView = where(Type = filter('G/L Account'));

                column(DeliverCompFor_PurchaseLine; "Deliver Comp. For")
                {
                }
                column(Quantity_PurchaseLine; Quantity)
                {
                }
                column(LineAmount_PurchaseLine; "Line Amount")
                {
                }
                //DataItemLink
                column(Description; Description)
                {

                }
                column(Description_2; "Description 2")
                {

                }
                column(Unit_Cost__LCY_; "Direct Unit Cost")
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                // column(Deleivery; Delivery)
                // {

                // }
                column(AmountToVendor; AmountToVendor) { }


                trigger OnAfterGetRecord()
                begin

                    if "Purchase Header"."Bill to-Location(POS)" = '' then begin
                        Billname := "Purchase Header"."Ship-to Name";
                        BillAddress := "Purchase Header"."Ship-to Address";
                        BillAddress2 := "Purchase Header"."Ship-to Address 2";
                        Billcity := "Purchase Header"."Ship-to City";
                        BillPostcode := "Purchase Header"."Ship-to Post Code";
                    end else begin
                        // Location.Reset();
                        Location.SetRange(Code, "Purchase Header"."Bill to-Location(POS)");
                        if Location.FindFirst() then begin
                            Billname := Location.Name;
                            BillAddress := Location.Address;
                            BillAddress2 := Location."Address 2";
                            Billcity := Location.City;
                            BillPostcode := Location."Post Code";
                        end;

                    end;
                    Clear(Location);
                    if Location.get("Purchase Header"."Location Code") then begin

                        LocationGStno := Location."GST Registration No.";

                    end;
                    commentPurchLine.Reset();
                    commentPurchLine.SetRange("No.", "Purchase Header"."No.");
                    if commentPurchLine.FindSet() then begin
                        repeat
                            commentHDR := commentHDR + commentPurchLine.Comment + ',';//+ ', ';
                        until commentPurchLine.Next() = 0;
                        commentHDR := DelStr(commentHDR, STRLEN(commentHDR), 1);
                    end;

                    vendor.Reset();
                    vendor.SetRange("No.", "Purchase Header"."Pay-to Vendor No.");
                    if vendor.FindFirst() then begin
                        Phone1 := vendor."Phone No.";
                        Email1 := vendor."E-Mail";
                        VendorGST := vendor."GST Registration No.";
                        VendorPan := vendor."P.A.N. No.";
                        VendorContactName := vendor.Contact;
                        VendorPostcode := vendor."Post Code";
                        CityVendor := vendor.City;
                        State.Reset();
                        State.SetRange(Code, vendor."State Code");
                        if State.FindFirst() then begin
                            StateNameVendor := State.Description;
                            VendorStateCdode := State."State Code (GST Reg. No.)";
                        end;

                        Contact.Reset();
                        Contact.SetRange("No.", vendor."Primary Contact No.");
                        if Contact.FindFirst() then begin
                            ContactName := Contact.Name;
                            ContactPhoneNo := Contact."Phone No.";
                            ContactEmailId := Contact."E-Mail";
                        end;


                        // Location.Reset();
                        // Location.SetRange(Code, vendor."State Code");
                        // if Location.FindFirst() then begin
                        //     StateNameVendor := Location.Name;

                        // end;

                    end;

                    RecPurchaseLine.Reset();
                    RecPurchaseLine.SetRange("Document Type", "Purchase Header"."Document Type");
                    RecPurchaseLine.SetRange("Document No.", "Purchase Header"."No.");
                    RecPurchaseLine.SetFilter("GST Group Code", '<>%1', '');
                    if RecPurchaseLine.FindSet() then
                        repeat
                            TaxRecordID := RecPurchaseLine.RecordId();//tk
                                                                      // PurchaseHeaderRecordID := RecPurchaseLine.RecordId();
                                                                      //                                                                       //Message('%1', PurchHeaderRecordID);
                            TaxTransactionValue.Reset();
                            TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//tk
                            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                            TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
                            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                            TaxTransactionValue.SetRange("Visible on Interface", true);
                            TaxTransactionValue.SetFilter("Value ID", '%1|%2', 6, 2);
                            if TaxTransactionValue.FindSet() then begin

                                CGSTRate := TaxTransactionValue.Percent;
                                SGSTRate := TaxTransactionValue.Percent;
                                CGST += TaxTransactionValue.Amount;
                                SGST += TaxTransactionValue.Amount;

                                SGSTtxt := 'SGST';
                                CGSTtxt := 'CGST';
                                TotalCGST += CGST;
                                TotalSGST += SGST;
                            end else begin
                                TaxTransactionValue.Reset();
                                TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//tk
                                TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                                TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
                                TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                                TaxTransactionValue.SetRange("Visible on Interface", true);
                                TaxTransactionValue.SetFilter("Value ID", '%1', 3);
                                if TaxTransactionValue.FindSet() then
                                    IGSTRate := TaxTransactionValue.Percent;
                                IGST += TaxTransactionValue.Amount;
                                IGSTtxt := 'IGST';
                                TotalIGST += IGST;

                            END;

                            Total += RecPurchaseLine."Line Amount";

                        until RecPurchaseLine.Next() = 0;
                    AmountToVendor := Total + CGST + SGST + IGST;

                    PostedVoucher.InitTextVariable();
                    "Purchase Header".CalcFields(Amount);
                    // PostedVoucher.FormatNoText(AmountinWords, Round("Purchase Header".Amount), "Purchase Header"."Currency Code");
                    PostedVoucher.FormatNoText(AmountinWords, Round(AmountToVendor), "Purchase Header"."Currency Code");
                    Amtinwrds := AmountinWords[1] + AmountinWords[2];
                end;

            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                recPaymentTerms: Record "Payment Terms";
                recVendor: Record Vendor;
                recState: record State;
                recContryRegion: record "Country/Region";
            begin
                Clear(termsOfPayment);
                recPaymentTerms.Reset();
                recPaymentTerms.SetRange(code, "Payment Terms Code");
                if recPaymentTerms.FindFirst() then
                    termsOfPayment := recPaymentTerms.Description;


                Clear(TelNO);
                Clear(MobileNO);
                recVendor.Reset();
                recVendor.SetRange("No.", "Purchase Header"."Buy-from Vendor No.");
                if recVendor.FindFirst() then begin
                    MobileNO := recVendor."Mobile Phone No.";
                    TelNO := recVendor."Phone No."
                end;



                Clear(Remark);
                RemarkSrNo := 0;

                PurchCommentLine.Reset();
                PurchCommentLine.SetRange("Document Type", PurchCommentLine."Document Type"::Order);
                PurchCommentLine.SetRange("No.", "Purchase Header"."No.");
                if PurchCommentLine.FindSet() then
                    repeat
                        RemarkSrNo += 1;
                        Remark += Format(RemarkSrNo) + ' .' + '&nbsp;' + PurchCommentLine.Comment + '<BR>';
                    until PurchCommentLine.Next() = 0;


                Clear(ContryRegion);
                recContryRegion.Reset();
                recContryRegion.SetRange(Code, "Purchase Header"."Buy-from Country/Region Code");
                if recContryRegion.FindFirst() then begin
                    ContryRegion := recContryRegion.Name;
                end;


                Clear(stateAdd);
                // vendor.Reset();
                // vendor.SetRange("No.", "Purchase Header"."Buy-from Vendor No.");
                // if vendor.FindFirst() then begin
                recState.SetRange("Code", "Purchase Header".State);
                if recState.FindFirst() then begin
                    stateAdd := recState.Description;
                end;
                // end;

                // Clear(ContryRegion);
                // vendor.Reset();
                // vendor.SetRange("State Code", recContryRegion."Code");
                // if vendor.FindFirst() then begin
                //     ContryRegion := recContryRegion.Name;
                // end;
            end;

            // trigger OnPreDataItem()
            // var
            //     myInt: Integer;
            // begin

            //     "Purchase Header".SetFilter("No.", '%1', "SalesNo.");
            // end;
        }

    }

    requestpage
    {
        layout
        {
            //         area(Content)
            //         {
            //             // group(Option)
            //             // {
            //             //     field("SalesNo."; "SalesNo.")
            //             //     {
            //             //         // ApplicationArea = All;
            //             //         Caption = 'No.';
            //             //         TableRelation = "Purchase Header"."No.";
            //             //     }
            //             // }
        }
    }
    // actions
    // {
    //     area(processing)
    //     {
    //         action(LayoutName)
    //         {
    //             ApplicationArea = All;

    //         }
    //     }
    // }
    // }
    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        companyinfo.get();
        companyinfo.CalcFields(Picture);
    end;


    var
        myInt: Integer;
        stateAdd: Text;
        ContryRegion: text;
        RemarkSrNo: Integer;

        Remark: Text;
        PurchCommentLine: Record "Purch. Comment Line";
        TelNO: text[40];
        MobileNO: text[40];
        "SalesNo.": code[30];
        HomePage: text[50];
        vendor: Record vendor;
        termsOfPayment: text;

        Nettotal: Decimal;
        Contact: Record Contact;
        ContactPhoneNo: Text[100];
        ContactEmailId: Text[100];
        ContactName: Text[100];
        State: Record State;
        LocationGStno: Code[20];
        LocationPanno: Code[20];
        Billname: Text[100];
        BillAddress: Text[100];
        BillAddress2: Text[100];
        Billcity: Text[100];
        BillPostcode: Code[20];
        StateNameVendor: Text[100];
        CityVendor: Text[100];
        Location: Record Location;
        Email1: Text[80];
        Phone1: Text[80];
        RecPurchaseLine: Record "Purchase Line";
        sales: Record "Purchase Line";
        AmountToVendor: Decimal;
        VendorGST: Code[20];
        VendorPan: Code[20];
        VendorContactName: Text[100];

        IGSTtxt: text[10];
        CGSTtxt: text[10];
        SGSTtxt: text[10];
        States: Text[30];
        VendorPostcode: Text[30];
        VendorStateCdode: Code[20];

        PostCode: Code[20];
        companyinfo: Record "Company Information";
        Amount: Decimal;
        WholeAmount: Decimal;
        Amtinwrds: Text;
        // SalesPersnPurchaseCode:Record sales
        FractionalAmount: Decimal;
        AmountinWords: array[2] of Text;
        // AmntinWrds: Text;
        CGST: Decimal;
        SGST: Decimal;
        IGST: Decimal;
        CGSTRate: Decimal;
        SGSTRate: Decimal;
        IGSTRate: Decimal;
        TotalCGST: Decimal;
        TotalSGST: Decimal;
        TotalIGST: Decimal;
        Total: Decimal;
        GrandTotal: Decimal;
        Currency: Code[20];
        PostedVoucher: Report "Posted Voucher";
        TaxtransactionValue: Record "Tax Transaction Value";
        TaxRecordId: RecordId;
        commentHDR: Text[1500];
        commentPurchLine: record "Purch. Comment Line";
        // Vendor:Record Vendor;

        Txatotal: Decimal;


    local procedure ClearData()
    Begin
        IGSTRate := 0;
        SGSTRate := 0;
        CGSTRate := 0;
        SGSTtxt := '';
        CGSTtxt := '';
        TotalCGST := 0;
        TotalSGST := 0;
        TotalIGST := 0;
        CGSTtxt := '';
        IGSTtxt := '';

        IGST := 0;
        CGST := 0;
        SGST := 0;
        Clear(AmountinWords);
        AmountToVendor := 0;

    End;




}