codeunit 50132 "Events"
{
    [EventSubscriber(ObjectType::Codeunit,Codeunit::"Sales-Post (Yes/No)", 'OnBeforeRunSalesPost', '', true, true)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header")
     var InventoryWarehouse: Record Inventory52;
        MinQuantity: Decimal;
        LocationCode: Code[10];
        Number:Code[20];
        SalesLine:Record "Sales Line";
        Item:Record Item;
        Inventory:Decimal;
    begin
        SalesLine.SetRange("Document No.",SalesHeader."No.");
        if SalesLine.FindSet() then begin 
          repeat
         InventoryWarehouse.SetRange("Kodi i Artikullit",SalesLine."No.");
         InventoryWarehouse.SetRange("Magazina",SalesLine."Location Code");
           IF InventoryWarehouse.FindFirst() Then begin
             MinQuantity:=InventoryWarehouse."Gjendja minimum";
             Item.setRange("No.",SalesLine."No.") ;
               If Item.FindFirst() then begin 
                 Item.CalcFields(Inventory);
                 Inventory:=Item.Inventory;
                end;
                If SalesLine."Location Code"<>'' then begin 
                   if  Inventory-SalesLine.Quantity<=MinQuantity then begin
                     Error('Ju keni tejkaluar sasine minimum te artikullit ' +SalesLine.Description+' ne magazinen '+InventoryWarehouse.Magazina);
                   end
                end
            else begin
                if SalesLine.Quantity>Inventory  then 
                  Error('Ju keni tejkaluar sasine minimum '+SalesLine.Description);
            end;
          END 
            until SalesLine.Next()=0;
        end;
      
    end;
    
    
}

 