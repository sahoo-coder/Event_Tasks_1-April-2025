codeunit 50450 salesOrderCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header")
    var
        logDetails: Record "Log Details";
        salesLine: Record "Sales Line";
        entryNo: Integer;
        isPosted: Boolean;
        userName: Code[50];
        users: Record User;
    // logDetailsPage: Page "Log Details Page_KSS";
    begin
        entryNo := 0;
        logDetails.Reset();
        logDetails.DeleteAll();
        salesLine.Reset();
        salesLine.SetRange("Document No.", SalesHeader."No.");
        if salesLine.FindSet() then begin
            if users.Get(UserSecurityId()) then begin
                userName := users."User Name";
            end;
            repeat
                entryNo += 1;
                logDetails.entryNo := entryNo;
                logDetails.user_name := userName;
                logDetails.item_no := salesLine."No.";
                if salesLine.Quantity <= 50 then begin
                    logDetails.message := 'Within Limit <= 50';
                end
                else
                    logDetails.message := 'Quantity exceeded > 50';
                logDetails.Insert();
            until salesLine.Next() = 0;
            isPosted := true;
            if (isPosted = true) and (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) then
                Page.Run(Page::"Log Details Page_KSS");
        end;
    end;
}