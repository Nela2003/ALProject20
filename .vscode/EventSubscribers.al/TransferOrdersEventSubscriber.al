codeunit 50134 "Transfer orders in system"{
[EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post (Yes/No)", 'OnBeforePost', '',true, true)]
local procedure MyProcedure(var TransHeader: Record "Transfer Header")

 var InventoryWarehouse: Record Inventory52;
        MinQuantity: Decimal;
        MaxQuantity1:Decimal;
        TransferLine:Record "Transfer Line";
        Item:Record Item;
        Inventory:Decimal;
        Quantity:Decimal;
begin

TransferLine.SetRange("Document No.",TransHeader."No.");
    if TransferLine.FindFirst() then begin 
         Item.SetRange("No.",TransferLine."Item No.");
           If Item.FindFirst() then begin 
              Item.CalcFields(Inventory);
              Inventory:=Item.Inventory;
              InventoryWarehouse.SetRange("Kodi i Artikullit",TransferLine."Item No.");
              InventoryWarehouse.SetRange("Magazina",TransHeader."Transfer-from Code");
              IF InventoryWarehouse.FindFirst() Then begin
                 MinQuantity:=InventoryWarehouse."Gjendja minimum";
                Quantity:=TransferLine.Quantity;
              InventoryWarehouse.SetRange("Magazina",TransHeader."Transfer-to Code");
                If InventoryWarehouse.FindFirst()then begin 
                MaxQuantity1:=InventoryWarehouse."Gjendja max";
                end;
                if Inventory-Quantity<MinQuantity then 
                  Error('Ju keni tejkaluar minimum te magazines'+TransHeader."Transfer-from Code")
                else begin 
                    if Inventory+Quantity>MaxQuantity1 then begin 
                       Error('Ju keni tejkaluar maximum te magazines'+TransHeader."Transfer-to Code")
                    end;
                     Message('Transferimi lejohet');
                 end;
                end;
        
               END 
            
        end;


end;
}