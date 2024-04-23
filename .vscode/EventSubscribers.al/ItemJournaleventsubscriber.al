codeunit 50135 "Item Journal"
{
   [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnBeforeCode', '', true, true)]
   local procedure MyProcedure(var ItemJournalLine: Record "Item Journal Line")
   var
       InventoryWarehouse: Record Inventory52;
        MinQuantity: Decimal;
        MaxQuantity:Decimal;
        Item:Record Item;
        Inventory:Decimal;
        labelmax:label 'Ju keni kaluar maximum te lejueshem ';
    begin
       InventoryWarehouse.SetRange("Kodi i Artikullit",ItemJournalLine."Item No.");
         InventoryWarehouse.SetRange("Magazina",ItemJournalLine."Location Code");
        IF InventoryWarehouse.FindFirst() Then begin
        MinQuantity:=InventoryWarehouse."Gjendja minimum";
        MaxQuantity:=InventoryWarehouse."Gjendja max";
        Item.setRange("No.",ItemJournalLine."Item No.") ;
        If Item.FindFirst() then begin 
            Item.CalcFields(Inventory);
            Inventory:=Item.Inventory;
             end;
        case ItemJournalLine."Entry Type" of
       "Item Ledger Entry Type"::"Positive Adjmt.":
            
                if  Inventory+ItemJournalLine.Quantity>=MaxQuantity then 
                    Error(labelmax);
                
            
         "Item Ledger Entry Type"::Purchase:
           
                if  Inventory+ItemJournalLine.Quantity>=MaxQuantity then begin
                    Error(labelmax);
                end;
        
            
         "Item Ledger Entry Type"::"Negative Adjmt.":
            
                if  Inventory-ItemJournalLine.Quantity<=MinQuantity then begin
                     Error('Ju keni tejkaluar sasine minimum te artikullit ' +ItemJournalLine.Description+' ne magazinen  '+InventoryWarehouse.Magazina);
                end;
          
         "Item Ledger Entry Type"::Sale:
       
                if  Inventory-ItemJournalLine.Quantity<=MinQuantity then 
                     Error('Ju keni tejkaluar sasine minimum te artikullit' +ItemJournalLine.Description+' ne magazinen '+InventoryWarehouse.Magazina);
          
        end;
    end;
    
   end;       
}