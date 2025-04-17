// codeunit 50100 "WHE Company Setup"
// {
//     procedure RunSetup()
//     begin
//         CreateChartOfAccounts();
//         CreatePostingGroups();
//         CreateNumberSeries();
//         ApplyDefaultConfigurations();
//     end;

//     local procedure CreateChartOfAccounts()
//     var
//         GLAccount: Record "G/L Account";
//     begin
//         // Assets (1000-1999)
//         InsertGLAccount('1000', 'ASSETS', 'Heading', 'Balance Sheet', '1000..1999');
//         InsertGLAccount('1010', '>> Cash & Equivalents', 'Begin-Total', 'Balance Sheet', '1010..1099');
//         InsertGLAccount('1011', 'Petty Cash', 'Bank', 'Balance Sheet', '');
//         // Continue for all accounts...
//     end;

//     local procedure CreatePostingGroups()
//     begin
//         // Business Posting Groups
//         InsertBusPostingGroup('DOMESTIC', 'Domestic Transactions');
//         InsertBusPostingGroup('EXPORT', 'Export Transactions');
        
//         // Product Posting Groups
//         InsertProdPostingGroup('PLATES', 'Steel Plates');
//         // Continue for all groups...
//     end;

//     local procedure CreateNumberSeries()
//     var
//         NoSeries: Record "No. Series";
//         NoSeriesLine: Record "No. Series Line";
//     begin
//         // Sales Orders
//         InsertNoSeries('S-ORD', 'Sales Orders', 'S-ORD-10000', 'S-ORD-99999', 1);
//         // Continue for all number series...
//     end;

//     // Helper methods
//     local procedure InsertGLAccount(No: Code[20]; Name: Text[100]; AccountType: Enum "G/L Account Type"; 
//                                   IncomeBalance: Enum "Income/Balance"; Totaling: Text[100])
//     var
//         GLAccount: Record "G/L Account";
//     begin
//         GLAccount.Init();
//         GLAccount."No." := No;
//         GLAccount.Name := Name;
//         GLAccount."Account Type" := AccountType;
//         GLAccount."Income/Balance" := IncomeBalance;
//         GLAccount.Totaling := Totaling;
//         GLAccount.Insert(true);
//     end;


// local procedure CreateProdPostingGroups()
// var
//     GenProdPostingGroup: Record "Gen. Product Posting Group";
// begin
//     InsertGenProdGroup('PLATES', 'Steel Plates');
//     InsertGenProdGroup('TUBES', 'Tubes and Pipes');
//     InsertGenProdGroup('FORGING', 'Forgings');
//     // Repeat for others...
// end;

// local procedure InsertGenProdGroup(Code: Code[20]; Description: Text[100])
// var
//     GenProdPostingGroup: Record "Gen. Product Posting Group";
// begin
//     GenProdPostingGroup.Init();
//     GenProdPostingGroup.Code := Code;
//     GenProdPostingGroup.Description := Description;
//     GenProdPostingGroup.Insert(true);
// end;

// local procedure CreateCustPostingGroups()
// var
//     CustPostingGroup: Record "Customer Posting Group";
// begin
//     CustPostingGroup.Init();
//     CustPostingGroup.Code := 'DOMESTIC';
//     CustPostingGroup.Description := 'Domestic Customers';
//     CustPostingGroup."Receivables Account" := '1100';
//     CustPostingGroup."Service Charge Acc." := '6100';
//     CustPostingGroup.Insert(true);
// end;

// local procedure CreateVendPostingGroups()
// begin
//     InsertVendGroup('MATERIALS', 'Material Suppliers', '2000');
//     InsertVendGroup('SERVICES', 'Service Providers', '2000');
//     InsertVendGroup('SUBCON', 'Subcontractors', '2000');
// end;

// local procedure InsertVendGroup(Code: Code[20]; Description: Text[100]; PayablesAcc: Code[20])
// var
//     VendPostingGroup: Record "Vendor Posting Group";
// begin
//     VendPostingGroup.Init();
//     VendPostingGroup.Code := Code;
//     VendPostingGroup.Description := Description;
//     VendPostingGroup."Payables Account" := PayablesAcc;
//     VendPostingGroup.Insert(true);
// end;

// local procedure CreateGenPostingSetup()
// var
//     GenPostingSetup: Record "General Posting Setup";
// begin
//     // Domestic + Plates
//     GenPostingSetup.Init();
//     GenPostingSetup."Gen. Bus. Posting Group" := 'DOMESTIC';
//     GenPostingSetup."Gen. Prod. Posting Group" := 'PLATES';
//     GenPostingSetup."Sales Account" := '4010'; // Sales of Plates
//     GenPostingSetup."Purch. Account" := '5110'; // COGS - Plates
//     GenPostingSetup."COGS Account" := '5110';
//     GenPostingSetup.Insert(true);
    
//     // Repeat for other combinations...
// end;
// }