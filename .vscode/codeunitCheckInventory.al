codeunit 50130 "InventoryCheck"
{
    procedure CheckInventory(SalesLine:Record "Sales Line")
    var
        InventoryWarehouse: Record Inventory52;
        MinQuantity: Decimal;
        MaxQuantity:Decimal;
        TotalInventory: Decimal;
        LocationCode: Code[10];
        MagazineSelected: Boolean;
        SalesLine1:Record "Sales Line";
        // label1: label 'You are under min';
        label2:label 'You are above max';
        label1:Text;
        Item:Record Item;
        Inventory:Decimal;
        InventoryFormated:Text;
        
    begin
        // Initialize variables
        MagazineSelected := FALSE;
           
         InventoryWarehouse.SetRange("Kodi i Artikullit",SalesLine."No.");
         InventoryWarehouse.SetRange("Magazina",SalesLine."Location Code");

        IF InventoryWarehouse.FindFirst() Then begin
        MinQuantity:=InventoryWarehouse."Gjendja minimum";
        MaxQuantity:=InventoryWarehouse."Gjendja max";
        Inventory:=InventoryWarehouse.Inventory;
         IF SalesLine.Quantity < Inventory THEN 
              
                Error('You are under inventory')

            //  Inventory:=Item.Inventory;
            else  if SalesLine.Quantity >Inventory then
             Error('You are above inventory');
            
            
          
            END 
            
            
             
            
            // Item.SetRange("No.",SalesLine."No.");
            // if ITem.FindFirst() then begin
            //  Inventory:=Item.Inventory;
            //  InventoryFormated:=Format(Inventory);
            //  Message(InventoryFormated);
            // end;
        
          
        END;


         
    
}
