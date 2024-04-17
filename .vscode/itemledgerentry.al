tableextension 50132 "It Ledger ext" extends "Item Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
         field(50132; "Inventory2"; Decimal)
              {  CalcFormula=lookup(Item.Inventory where("No."=field("Item No.")));
                
                FieldClass=FlowField;

                trigger OnLookup();
                begin
                    CalcFields(Inventory2);
                end;
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
        Item:Record Item;
}