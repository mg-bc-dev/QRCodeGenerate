namespace QRCodeGenerate.QRCodeGenerate;

using Microsoft.Sales.History;

tableextension 50100 "Sales Invoice Header Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "QR text"; Text[1000])
        {
            Caption = 'QR text';
        }
    }
    var
        QRtext: Text;
}

