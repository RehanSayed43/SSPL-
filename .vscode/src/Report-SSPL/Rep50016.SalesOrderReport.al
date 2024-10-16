report 50016 "Sales Order Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    Caption = 'SSPL-Sales Confimation';
    RDLCLayout = 'SalesOrder.rdl';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {

            }
            column(Bill_to_Address; "Bill-to Address")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Address_2; "Bill-to Address 2")
            {

            }
            column(Bill_to_City; "Bill-to City")
            {

            }
            column(Bill_to_Contact; "Bill-to Contact")
            {

            }
            column(Bill_to_Post_Code; "Bill-to Post Code")
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
            column(Ship_to_Contact; "Ship-to Contact")
            {

            }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code")
            {

            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {

            }
            column(comapnyinfoname; comapnyinfo.Name)
            {

            }
            column(comapnyinfoAddress; comapnyinfo.Address)
            {

            }
            column(comapnyinfo2; comapnyinfo."Address 2")
            {

            }
            column(comapnyinfoCity; comapnyinfo.City)
            {

            }
            column(comapnyinfophoneno; comapnyinfo."Phone No.")
            {

            }
            column(comapnyinfoEmail; comapnyinfo."E-Mail")
            {

            }
            column(comapnyinfopostcode; comapnyinfo."Post Code")
            {

            }
            column(comapnyinfobankaccno; comapnyinfo."Bank Account No.")
            {

            }
            column(comapnyinfobankbranchno; comapnyinfo."Bank Branch No.")
            {

            }
            column(comapnyinfobankname; comapnyinfo."Bank Name")
            {

            }
            column(comapnyinfoswiftcode; comapnyinfo."SWIFT Code")
            {

            }
            column(CustName; CustName)
            {

            }
            column(CustAddress; CustAddress)
            {

            }
            column(CustAddress2; CustAddress2)
            {

            }
            column(CustCity; CustCity)
            {

            }
            column(CustEmail; CustEmail)
            {

            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");
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
                column(Unit_Cost__LCY_; "Unit Price")
                {

                }
                column(Line_Amount; "Line Amount")
                {

                }
                column(CGST; CGST)
                {

                }
                column(SGST; SGST)
                {

                }
                column(IGST; IGST)
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
                column(Amtinwrds; Amtinwrds)
                {

                }
                column(AmountToVendor; AmountToVendor)
                {

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    RecPurchaseLine.Reset();
                    RecPurchaseLine.SetRange("Document Type", "Sales Header"."Document Type");
                    RecPurchaseLine.SetRange("Document No.", "Sales Header"."No.");
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
                        //TotalIGST + TotalCGST + TotalSGST;
                        until RecPurchaseLine.Next() = 0;
                    AmountToVendor := Total + CGST + SGST + IGST;
                    //Naveen--
                    PostedVoucher.InitTextVariable();
                    "Sales Header".CalcFields(Amount);
                    // PostedVoucher.FormatNoText(AmountinWords, Round("Purchase Header".Amount), "Purchase Header"."Currency Code");
                    PostedVoucher.FormatNoText(AmountinWords, Round(AmountToVendor), "Sales Header"."Currency Code");
                    Amtinwrds := AmountinWords[1] + AmountinWords[2];
                end;

                //end;
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Customer.Reset();
                Customer.SetRange("No.", "Sales Header"."Bill-to Customer No.");
                if Customer.FindFirst() then begin
                    CustName := Customer.Name;
                    CustAddress := Customer.Address;
                    CustAddress2 := Customer."Address 2";
                    CustCity := Customer.City;
                    CustEmail := Customer."E-Mail";
                end;

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
                    // field(Name; SourceExpression)
                    // {

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }

    }
    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        comapnyinfo.get();

    end;

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    var
        myInt: Integer;
        comapnyinfo: Record "Company Information";
        Customer: Record customer;
        CustAddress: Text;
        CustAddress2: Text;
        CustEmail: Text;
        CustPhnno: Text;
        CustCity: Text;
        CustName: Text;

        MobileNo: Text[100];
        StateCode: Code[20];
        StateName: Text[100];
        RecPurchaseLine: Record "Sales Line";
        Vendor: Record vendor;
        States: Record State;
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
        AmountToVendor: Decimal;
        IGSTtxt: text[10];
        CGSTtxt: text[10];
        SGSTtxt: text[10];
        TaxtransactionValue: Record "Tax Transaction Value";
        TaxRecordId: RecordId;
        Amount: Decimal;
        WholeAmount: Decimal;
        Amtinwrds: Text;
        // SalesPersnPurchaseCode:Record sales
        FractionalAmount: Decimal;
        AmountinWords: array[2] of Text;

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
        // CGSTtxt := '';
        // IGSTtxt := '';

        IGST := 0;
        CGST := 0;
        SGST := 0;
        Clear(AmountinWords);
        AmountToVendor := 0;
    end;
}