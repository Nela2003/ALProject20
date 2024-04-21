codeunit 50130 "Purchase Event Sub"
{
   [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeRunPurchPost', '', true, true)]
   local procedure MyProcedure(var PurchaseHeader: Record "Purchase Header")
   var InventoryWarehouse: Record Inventory52;
        MaxQuantity:Decimal;
        LocationCode: Code[10];
        Number:Code[20];
        PurchaseLine:Record "Purchase Line";
        Item:Record Item;
        location:record Location;
        Inventory:Decimal;
   
   begin
     PurchaseLine.SetRange("Document No.",PurchaseHeader."No.");
        if PurchaseLine.FindFirst() then begin 
         Number:=PurchaseLine."No.";
         LocationCode:=PurchaseLine."Location Code";
         InventoryWarehouse.SetRange("Kodi i Artikullit",Number);
         InventoryWarehouse.SetRange("Magazina",LocationCode);
           IF InventoryWarehouse.FindFirst() Then begin
           MaxQuantity:=InventoryWarehouse."Gjendja max";
           Item.setRange("No.",PurchaseLine."No.") ;
           location.SetRange(Code,LocationCode);
           location.SetRange("Item No",PurchaseLine."No.");
              if location.FindFirst() then begin 
                Inventory:=Item.Inventory;
              end;
      
              If PurchaseLine."Location Code"<>'' then begin 
                if  Inventory+PurchaseLine.Quantity>=MaxQuantity then begin
                    Error('Ju keni tejkaluar sasine maximale te' +PurchaseLine.Description+' ne magazinen '+InventoryWarehouse.Magazina);
                end
            end
            else begin
                InventoryWarehouse.CalcFields(MaxInventoryinWarehouse);
                if Inventory+PurchaseLine.Quantity>InventoryWarehouse.MaxInventoryinWarehouse then begin
                Error('Ju keni tejkaluar sasine maximale te te gjitha magazinave ');
                end;
            end;
            
            
            
          
            END 
            
        end;
   end;
    
}