/// <summary>
/// Codeunit QR Image (ID 50100).
/// </summary>
codeunit 50123 "QR Image"
{
    Permissions = tabledata "Sales Invoice Header" = rimd;

    trigger OnRun()
    begin

    end;
    // KK <<
    /// <summary>
    /// CreateQRInput.
    /// </summary>
    /// <param name="sellerName">text.</param>
    /// <param name="sellerVAT">Code[50].</param>
    /// <param name="PostingDate">DateTime.</param>
    /// <param name="InvAmt">Decimal.</param>
    /// <param name="VATAmt">Decimal.</param>
    /// <returns>Return value of type Text.</returns>
    procedure CreateQRInput(sellerName: text; sellerVAT: Text; PostingDate: DateTime; InvAmt: Decimal; VATAmt: Decimal): Text
    var
        RoundInvAmt: Decimal;
        RoundVATAmt: Decimal;
        TypeHelper: Codeunit "Type Helper";
        myText: Text;
        Input: Text;
        Output: Text;
        b: Integer;
        I: Integer;
        Stringlen: Integer;
        IntToHex: Text;
    begin
        QRInput := TextToHexForLength(sellerName, sellerVAT, Format(PostingDate, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z'), Format(InvAmt), Format(VATAmt));
    end;



    /// <summary>
    /// GenQRCode.
    /// </summary>
    /// <param name="recSIHeaderNo">code[20].</param>
    /// <returns>Return value of type Text.</returns>
    procedure GenQRCode(recSIHeaderNo: code[20]): Text
    var
        CompanyInfo: Record "Company Information";
        sellerVAT: Text[20];
        datetimecreated: DateTime;
        sellerName: Text;
    begin
        Clear(CompanyInfo);

        if SalesInvHdr.Get(recSIHeaderNo) then begin

            CompanyInfo.Get();
            sellerName := CompanyInfo.Name;
            sellerVAT := CompanyInfo."VAT Registration No.";
            datetimecreated := SalesInvHdr.SystemCreatedAt;

            SalesInvHdr.CALCFIELDS(Amount, "Amount Including VAT");
            QRGenInput := CreateQRInput(sellerName, sellerVAT, datetimecreated, SalesInvHdr."Amount Including VAT", (SalesInvHdr."Amount Including VAT" - SalesInvHdr.Amount));
            Message(QRGenInput);
        end;
    end;

    local procedure TextToHexForLength(sellerName: Text; sellerVAT: Text; PostingDate: Text; InvAmt: Text; VATAmt: Text): Text
    var
        RoundInvAmt: Decimal;
        RoundVATAmt: Decimal;
        TypeHelper: Codeunit "Type Helper";
        myText: Text;
        Input: Text;
        Output: Text;
        b: Integer;
        I: Integer;
        Stringlen: Integer;
        IntToHexFor: Text;
    begin
        clear(IntToHexFor);
        clear(myText);
        Clear(Input);
        Clear(Output);
        Clear(Stringlen);
        Input := 'Bobs Records';
        Stringlen := strlen(Input);
        for i := 1 to strlen(Input) do begin
            b := Input[i];
            if b < 16 then
                output += '0';
            output += TypeHelper.IntToHex(b);
        end;
        IntToHexFor := TypeHelper.IntToHex(Stringlen);

        if (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
            myText := '0' + IntToHexFor
        else
            myText := IntToHexFor;
        sellerName := '01' + myText + Output;



        clear(IntToHexFor);
        clear(myText);
        Clear(Input);
        Clear(Output);
        Clear(Stringlen);
        Input := '310122393500003';
        Stringlen := strlen(Input);
        for i := 1 to strlen(Input) do begin
            b := Input[i];
            if b < 16 then
                output += '0';
            output += TypeHelper.IntToHex(b);
        end;
        IntToHexFor := TypeHelper.IntToHex(Stringlen);

        if (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
            myText := '0' + IntToHexFor
        else
            myText := IntToHexFor;
        sellerVAT := '02' + myText + Output;
        

        clear(IntToHexFor);
        clear(myText);
        Clear(Input);
        Clear(Output);
        Clear(Stringlen);
        Input := '2022-04-25T15:30:0Z';
        Stringlen := strlen(Input);
        for i := 1 to strlen(Input) do begin
            b := Input[i];
            if b < 16 then
                output += '0';
            output += TypeHelper.IntToHex(b);
        end;
        IntToHexFor := TypeHelper.IntToHex(Stringlen);
        if (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
            myText := '0' + IntToHexFor
        else
            myText := IntToHexFor;
        PostingDate := '03' + myText + Output;


        clear(IntToHexFor);
        clear(myText);
        Clear(Input);
        Clear(Output);
        Clear(Stringlen);
        Input := '1000.00';
        Stringlen := strlen(Input);
        for i := 1 to strlen(Input) do begin
            b := Input[i];
            if b < 16 then
                output += '0';
            output += TypeHelper.IntToHex(b);
        end;
        IntToHexFor := TypeHelper.IntToHex(Stringlen);

        if (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
            myText := '0' + IntToHexFor
        else
            myText := IntToHexFor;
        InvAmt := '04' + myText + Output;

        clear(IntToHexFor);
        clear(myText);
        Clear(Input);
        Clear(Output);
        Clear(Stringlen);
        Input := '150.00';
        Stringlen := strlen(Input);
        for i := 1 to strlen(Input) do begin
            b := Input[i];
            if b < 16 then
                output += '0';
            output += TypeHelper.IntToHex(b);
        end;
        IntToHexFor := TypeHelper.IntToHex(Stringlen);

        if (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
            myText := '0' + IntToHexFor
        else
            myText := IntToHexFor;
        VATAmt := '05' + myText + Output;
    end;

    var
        SalesInvHdr: Record "Sales Invoice Header";
        lhttpclient: HttpClient;
        lContent: HttpContent;
        lcontentheader: HttpHeaders;
        lResponseMessage: HttpResponseMessage;
        lresponsetext: text;
        QRGenInput: text;
        QRInput: Text;
}