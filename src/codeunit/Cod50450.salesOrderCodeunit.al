codeunit 50450 salesOrderCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header")
    var
        logDetails: Record "Log Details";
        salesLine: Record "Sales Line";
        userName: Code[50];
        users: Record User;
        logDetailsPage: page "Log Details Page_KSS";
        logDetailsTable: Record "Log Details";
        item: Record Item;
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            salesLine.Reset();
            salesLine.SetRange("Document No.", SalesHeader."No.");
            salesLine.SetRange("Document Type", salesLine."Document Type"::Order);
            if salesLine.FindSet() then begin
                if users.Get(UserSecurityId()) then begin
                    userName := users."User Name";
                end;
                repeat
                    item.Reset();
                    item.Get(salesLine."No.");
                    if item.FindFirst() then begin
                        item.CalcFields(Inventory);
                        if item.Inventory < salesLine.Quantity then
                            Error('Order Out Of stock for item %1', salesLine."No.");
                    end;
                    logDetails.user_name := userName;
                    logDetails.item_no := salesLine."No.";
                    logDetails.orderNo := salesLine."Document No.";
                    if salesLine.Quantity <= 50 then begin
                        logDetails.message := 'Within Limit <= 50';
                    end
                    else
                        logDetails.message := 'Quantity exceeded > 50';
                    logDetails.Insert();
                until salesLine.Next() = 0;
            end;
            logDetails.Reset();
            logDetails.SetRange(orderNo, SalesHeader."No.");
            logDetailsPage.SetTableView(logDetails);
            logDetailsPage.Run();
        end;
    end;
}