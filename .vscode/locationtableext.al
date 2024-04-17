tableextension 50131 "Location table ext"extends Location
{
    fields
    {
       field(50130;"Sasia e Disponueshme Item avail";Decimal )
       {
        DataClassification = ToBeClassified;
       }
       field(50131;"Item No"; Code[20])
       { 
        TableRelation=Item."No.";
        DataClassification = ToBeClassified;
       }
       field(50132; "Item by avail Inventory"; Decimal)
       {  TableRelation=Item.Inventory;
        DataClassification = ToBeClassified;
       }
       field(50133;"Decript"; Text[100])
       { TableRelation="Item Ledger Entry".Description;
        DataClassification = ToBeClassified;
       }
       }
    
    
    keys
    {
        // Add changes to keys here
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
        ItemLedgerEntry:Record "Item Ledger Entry";
}