namespace QRCodeGenerate.QRCodeGenerate;
using System.Text;

codeunit 50101 TLVFormet
{
    trigger OnRun()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
        TLVString: Text;
        CompanyInfoTag: Text;
        VATRegNoTag: Text;
        InvoiceDateTag: Text;
        VATAmountTag: Text;
        InvoiceAmountTag: Text;
        // TextEncoder: re "Text Encoder";
        QRCode: Text;
    begin
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";

        // Encode each data field in TLV format
        // CompanyInfoTag := '01' + TextEncoder.Utf8ToAnsi(CompanyInfo.Name);
        // VATRegNoTag := '02' + TextEncoder.Utf8ToAnsi(CompanyInfo.“VAT Registration No.”);
        // InvoiceDateTag := '03' + TextEncoder.Utf8ToAnsi(Format(header.“Document Date”, ‘YYYYMMdd’));
        // VATAmountTag := '04' + TextEncoder.Utf8ToAnsi(Format(TotalVatAmount, 0, ‘.’, ‘’));
        // InvoiceAmountTag := '05' + TextEncoder.Utf8ToAnsi(Format(total_IncVatAmt, 0, ‘.’, ‘’));

        // Combine all the TLV tags and values into a single TLV string
        TLVString := CompanyInfoTag + VATRegNoTag + InvoiceDateTag + VATAmountTag + InvoiceAmountTag;

        // Generate the QR code using the TLV encoded string
        QRCode := BarcodeFontProvider2D.EncodeFont(TLVString, BarcodeSymbology2D);

    end;



}
