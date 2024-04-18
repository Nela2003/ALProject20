codeunit 50130 "InventoryCheck"
{
    procedure CheckInventory(SalesLine:Record "Sales Line")
    var
        InventoryWarehouse: Record Inventory52;
        MinQuantity: Decimal;
        MaxQuantity:Decimal;
        TotalInventory: Decimal;
        LocationCode: Code[10];
       
        SalesLine1:Record "Sales Line";
        // label1: label 'You are under min';
        label2:label 'You are above max';
        label1:Text;
        Item:Record Item;
        Inventory:Decimal;
        InventoryFormated:Text;
        
    begin
        
       
           
         InventoryWarehouse.SetRange("Kodi i Artikullit",SalesLine."No.");
         InventoryWarehouse.SetRange("Magazina",SalesLine."Location Code");

        IF InventoryWarehouse.FindFirst() Then begin
        MinQuantity:=InventoryWarehouse."Gjendja minimum";
        MaxQuantity:=InventoryWarehouse."Gjendja max";
        Item.setRange("No.",SalesLine."No.") ;
        If Item.FindFirst() then begin 
            Item.CalcFields(Inventory);
            Inventory:=Item.Inventory;
            
        end;
       
            If SalesLine."Location Code"<>'' then begin 
                if  Inventory-SalesLine.Quantity<=MinQuantity then begin
                     Error('Ju keni tejkaluar sasine minimum te artikullit' +SalesLine.Description+' ne magazinen '+InventoryWarehouse.Magazina);
                end
            end
            else begin
                if SalesLine.Quantity>Inventory  then 
                  Error('Ju keni tejkaluar sasine maximum te artikullit  '+InventoryWarehouse.Artikulli);
            end;
            
            
            
          
            END 
            
            
             
            
            // Item.SetRange("No.",SalesLine."No.");
            // if ITem.FindFirst() then begin
            //  Inventory:=Item.Inventory;
            //  InventoryFormated:=Format(Inventory);
            //  Message(InventoryFormated);
            // end;
        
          
        END;


         
    
}
