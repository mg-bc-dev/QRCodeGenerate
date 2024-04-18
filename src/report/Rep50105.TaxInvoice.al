report 50105 "Tax Invoice"
{
    Caption = 'Tax Invoice';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Due_Date; "Due Date")
            {
            }
            column(Cominfo_Picture; Cominfo.Picture)
            {
            }
            column(Cominfo_Name; Cominfo.Name)
            {
            }
            column(CominfoAddress; Cominfo.Address)
            {
            }
            column(Cominfo_City; Cominfo."Address 2" + Cominfo.City)
            {
            }
            column(Cominfo_Country; CountryName)
            {
            }
            column(Cominfobankaccountno; Cominfo."Bank Account No.")
            {
            }
            column(Cominfobranchname; Cominfo."Bank Branch No.")
            {
            }
            column(CominfoIBAN; Cominfo.IBAN)
            {
            }
            column(Cominfobankname; Cominfo."Bank Name")
            {
            }
            column(CustomerName; Customer.Name)
            {
            }
            column(CustomerAddress; Customer.Address)
            {
            }
            column(custcity; Customer.City)
            {
            }
            column(customercountry; CustomerCountryName)
            {
            }
            column(Customertaxid; Customer."VAT Registration No.")
            {
            }
            column(Order_No_; "Your Reference")
            {
            }
            column(Order_Date; "Order Date")
            {

            }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {

            }
            column(Lbl001; Lbl001)
            {

            }
            column(paymnettermsdes; PaymentTerms.Description)
            {
            }
            column(Lbl002; Lbl002)
            {
            }
            // column(Media_QR_Image; "Media QR Image")
            // {
            // }
            column(QR_text; qrtext)
            {

            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                {
                }
                column(ItemNo_; "No.")
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(VAT_Base_Amount; "VAT Base Amount")
                {
                }
                column(VAT__; "VAT %")
                {
                }
                column(TotalExcludingvat; TotalExcludingvat)
                {
                }
                column(TotalVAT; TotalVAT)
                {
                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {
                }
                column(Total; Total)
                {
                }
                column(Line_No_; "Line No.")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }

                trigger OnAfterGetRecord()
                var
                    SalesLine: Record "Sales Invoice Line";
                    SalesLine_2: Record "Sales Invoice Line";
                begin
                    SalesLine.Reset();
                    SalesLine.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    if SalesLine.FindFirst() then begin
                        repeat
                            SalesLine_2.Reset();
                            SalesLine_2.SetRange("No.", SalesLine."No.");
                            SalesLine_2.SetRange("Line No.", SalesLine."Line No.");
                            if SalesLine_2.FindSet() then begin
                                TotalExcludingvat += SalesLine."VAT Base Amount";
                                TotalVAT += SalesLine."Amount Including VAT" - SalesLine."Line Amount";
                                Total += SalesLine."Amount Including VAT";
                            end;
                        until SalesLine.Next() = 0;
                    end;
                end;
            }
            trigger OnAfterGetRecord()
            var
                QrImage: Codeunit "QR Image";
                CountryRegion: Record "Country/Region";
            begin
                if Customer.get("Sell-to Customer No.") then;
                if PaymentTerms.Get("Payment Terms Code") then;
                // CalcFields("Media QR Image");
                // CQRImage.GenQRCode("Sales Invoice Header"."No.");
                Clear(CustomerCountryName);
                if CountryRegion.Get(Customer."Country/Region Code") then
                    CustomerCountryName := CountryRegion.Name;

                if "Sales Invoice Header"."QR text" = '' then
                    QRText := QrImage.GenQRCode("Sales Invoice Header"."No.")
                else
                    QRText := "Sales Invoice Header"."QR text";
                RecSalesInvHeader.Get("Sales Invoice Header"."No.");
            end;
        }
    }

    requestpage
    {
        layout
        {

        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'src\Layout\TaxInvoice.rdl';
        }
    }
    trigger OnPreReport()
    var
        SIHeader: Record "Sales Invoice Header";
        CQRImage: Codeunit "QR Image";
        CountryRegion: Record "Country/Region";
    begin
        if Cominfo.get() then
            Cominfo.CalcFields(Picture);
        if CountryRegion.Get(Cominfo."Country/Region Code") then
            CountryName := CountryRegion.Name;
        // SIHeader.Reset();
        // SIHeader.Copy("Sales Invoice Header");
        // if SIHeader.FindSet() then
        //     repeat
        //         CQRImage.GenQRCode(SIHeader."No.");
        //     until SIHeader.Next() = 0;
    end;

    var
        Cominfo: Record "Company Information";
        Customer: Record Customer;
        CountryName: Text;
        QRText: Text[1000];
        RecSalesInvHeader: record "Sales Invoice Header";
        PaymentTerms: Record "Payment Terms";
        TotalVAT: Decimal;
        CustomerCountryName: text;
        Lbl001: Label 'Please use the follwing communication for your payment :';
        Lbl002: Label 'Payment Method:';
        TotalExcludingvat: Decimal;
        Total: Decimal;
}