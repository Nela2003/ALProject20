codeunit 50134 "Transfer orders in system"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post (Yes/No)", 'OnBeforePost', '', true, true)]
    local procedure MyProcedure(var TransHeader: Record "Transfer Header")

    var
        InventoryWarehouse: Record Inventory52;
        TransferLine: Record "Transfer Line";
        Item: Record Item;
    begin

        TransferLine.SetRange("Document No.", TransHeader."No.");
        if TransferLine.FindSet() then begin
            repeat
                Item.SetRange("No.", TransferLine."Item No.");
                If Item.FindFirst() then begin
                    Item.CalcFields(Inventory);
                    InventoryWarehouse.SetRange("Kodi i Artikullit", TransferLine."Item No.");
                    InventoryWarehouse.SetRange("Magazina", TransHeader."Transfer-from Code");
                    IF InventoryWarehouse.FindFirst() Then begin
                        if Item.Inventory - TransferLine.Quantity <InventoryWarehouse."Gjendja minimum"  then
                            Error('Ju keni tejkaluar minimum te magazines' + TransHeader."Transfer-from Code")


                    end;
                    InventoryWarehouse.Reset();
                    InventoryWarehouse.SetRange("Kodi i Artikullit", TransferLine."Item No.");
                    InventoryWarehouse.SetRange("Magazina", TransHeader."Transfer-to Code");
                    If InventoryWarehouse.FindFirst() then begin
                    if Item.Inventory + TransferLine.Quantity >=InventoryWarehouse."Gjendja max" then begin
                            Error('Ju keni tejkaluar maximum te magazines' + TransHeader."Transfer-to Code")
                        end;
                    end;
                  
                end;


            until TransferLine.Next() = 0;
        end;


    end;
}