namespace WasteHeatEquipmentSetup.WasteHeatEquipmentSetup;

using Microsoft.Purchases.Document;
using Microsoft.Sales.Document;

pageextension 50101 PurchaseOrderSubFormExt extends "Sales Order Subform"
{
      layout
    {
        addlast(Control1) // Or choose the correct group name for where you want to display
        {
            field("Gross Requirement"; Rec."Gross Requiremeent")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        GrossMgt: Codeunit "Gross Requirement Mgt";
    begin
        if Rec.Type = Rec.Type::Item then
            Rec."Gross Requiremeent" := GrossMgt.CalculateGrossRequirement(Rec."No.")
        else
            Rec."Gross Requiremeent" := 0;
    end;
}