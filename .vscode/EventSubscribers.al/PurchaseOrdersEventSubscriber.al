codeunit 50130 "Purchase Event Sub"
{
   [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeRunPurchPost', '', true, true)]
   local procedure MyProcedure(var PurchaseHeader: Record "Purchase Header")
   var InventoryWarehouse: Record Inventory52;
        LocationCode: Code[10];
        Number:Code[20];
        PurchaseLine:Record "Purchase Line";
        Item:Record Item;
        location:record Location;
        Inventory:Decimal;
   
   begin
     PurchaseLine.SetRange("Document No.",PurchaseHeader."No.");
     PurchaseLine.SetRange("Document Type",PurchaseHeader."Document Type");
        if PurchaseLine.FindSet() then begin 
          repeat
         InventoryWarehouse.SetRange("Kodi i Artikullit",PurchaseLine."No.");
         InventoryWarehouse.SetRange("Magazina",PurchaseLine."Location Code");
           IF InventoryWarehouse.FindFirst() Then begin
           Item.setRange("No.",PurchaseLine."No.") ;
               If Item.FindFirst() then begin 
                 Item.CalcFields(Inventory);
                 Inventory:=Item.Inventory;
                end;
      
              If PurchaseLine."Location Code"<>'' then begin 
                if  Inventory+PurchaseLine.Quantity>=InventoryWarehouse."Gjendja max" then begin
                    Error('Ju keni tejkaluar sasine maximale te' +PurchaseLine.Description+' ne magazinen '+InventoryWarehouse.Magazina);
                end
            end
            else begin
               
             if Inventory+PurchaseLine.Quantity>InventoryWarehouse."Gjendja max" then begin
                Error('Ju keni tejkaluar sasine maximale te artikullit ne nivel total inventari per artikullin '+PurchaseLine.Description);
                end;
            end;
   end;
            
            
            
          until  PurchaseLine.Next()=0;
            END;
            
        end;
   
    
}