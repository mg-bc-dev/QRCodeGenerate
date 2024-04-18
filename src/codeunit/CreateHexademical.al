/// <summary>
/// Codeunit TextToHexadeical (ID 50100).
/// </summary>
codeunit 50140 "Text To Hexadeical"
{
    trigger OnRun()
    var
        TypeHelper: Codeunit "Type Helper";
        Input: Text;
        Output: Text;
        b: Integer;
        I: Integer;
        Stringlen: Integer;
    begin
        // Input := 'Youtube';
        // Stringlen := strlen(Input);
        // Message(Format(Stringlen));
        // for i := 1 to strlen(Input) do begin
        //     b := Input[i];
        //     if b < 16 then
        //         output += '0';
        //     output += TypeHelper.IntToHex(b);
        // end;
        // Message('Input = %1, output = %2', Input, Output);
        //Message('Dec %1 = Hex %2', 4, TypeHelper.IntToHex(4));
    end;

    /// <summary>
    /// TextToHexForLength.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    procedure TextToHexForLength(): Text
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
        sellerName: Text;
        sellerVAT: Text;
        PostingDate: Text;
        InvAmt: Text;
        VATAmt: Text;
        EncodeStr : Text;
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

        if (IntToHexFor = '1') or (IntToHexFor = '2') or (IntToHexFor = '3') or (IntToHexFor = '4') or (IntToHexFor = '5') or (IntToHexFor = '6') or (IntToHexFor = '7') or (IntToHexFor = '8') or (IntToHexFor = '9') or (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
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

        if (IntToHexFor = '1') or (IntToHexFor = '2') or (IntToHexFor = '3') or (IntToHexFor = '4') or (IntToHexFor = '5') or (IntToHexFor = '6') or (IntToHexFor = '7') or (IntToHexFor = '8') or (IntToHexFor = '9') or (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
            myText := '0' + IntToHexFor
        else
            myText := IntToHexFor;
        sellerVAT := '02' + myText + Output;


        clear(IntToHexFor);
        clear(myText);
        Clear(Input);
        Clear(Output);
        Clear(Stringlen);
        Input := '2022-04-25T15:30:00Z';
        Stringlen := strlen(Input);
        for i := 1 to strlen(Input) do begin
            b := Input[i];
            if b < 16 then
                output += '0';
            output += TypeHelper.IntToHex(b);
        end;
        IntToHexFor := TypeHelper.IntToHex(Stringlen);
        if (IntToHexFor = '1') or (IntToHexFor = '2') or (IntToHexFor = '3') or (IntToHexFor = '4') or (IntToHexFor = '5') or (IntToHexFor = '6') or (IntToHexFor = '7') or (IntToHexFor = '8') or (IntToHexFor = '9') or (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
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

        if (IntToHexFor = '1') or (IntToHexFor = '2') or (IntToHexFor = '3') or (IntToHexFor = '4') or (IntToHexFor = '5') or (IntToHexFor = '6') or (IntToHexFor = '7') or (IntToHexFor = '8') or (IntToHexFor = '9') or (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
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

        if (IntToHexFor = '1') or (IntToHexFor = '2') or (IntToHexFor = '3') or (IntToHexFor = '4') or (IntToHexFor = '5') or (IntToHexFor = '6') or (IntToHexFor = '7') or (IntToHexFor = '8') or (IntToHexFor = '9') or (IntToHexFor = 'A') or (IntToHexFor = 'B') or (IntToHexFor = 'C') or (IntToHexFor = 'D') or (IntToHexFor = 'E') or (IntToHexFor = 'F') then
            myText := '0' + IntToHexFor
        else
            myText := IntToHexFor;
        VATAmt := '05' + myText + Output;

        EncodeStr := sellerName + sellerVAT + PostingDate + InvAmt + VATAmt;
        exit(EncodeStr);
    end;
}