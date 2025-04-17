namespace WasteHeatEquipmentSetup.WasteHeatEquipmentSetup;

using Microsoft.Sales.Document;

tableextension 50100 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50100; "Gross Requiremeent"; Decimal)
        {
            Caption = 'Gross Requirement';
            Editable = false;
        }
    }
}
