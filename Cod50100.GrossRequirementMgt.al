namespace WasteHeatEquipmentSetup.WasteHeatEquipmentSetup;
using Microsoft.Sales.Document;

codeunit 50100 "Gross Requirement Mgt"
{
    procedure CalculateGrossRequirement(ItemNo: Code[20]): Decimal
    var
        SalesLine: Record "Sales Line";
        TotalDemand: Decimal;
    begin
        TotalDemand := 0;

        // Demand from Sales Orders
        SalesLine.SetCurrentKey("Document Type", "Type", "No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetRange("No.", ItemNo);
        if SalesLine.FindSet() then
            repeat
                TotalDemand += SalesLine.Quantity;
            until SalesLine.Next() = 0;

        exit(TotalDemand);
    end;
    
}
