pageextension 50136  "item card extension" extends "Item Card"
{
    layout
    {
       addlast(InventoryGrp){
     field("Sasia e disponueshme";Rec."Sasia e disponueshme"){
        ApplicationArea=all;
     }
       }
    }


    
    actions
    {
        
    }
    


    trigger OnAfterGetRecord()
    var
        Item: record Item;
        Inventory:Decimal;
        Reservation:record "Reservation Entry";
        ReservationEntry1:record "Reservation Entry" temporary;
        TotalQuantity:Decimal;
        Itemno:code[20];

    begin
        
        Inventory:=Rec.Inventory;
        Itemno:=Rec."No.";
        Reservation.SetRange("Item No.",Itemno);
          if  Reservation.FindSet() Then  begin
             repeat
               TotalQuantity:=TotalQuantity + Reservation."Quantity (Base)";
             until Reservation.Next()=0;
             Rec."Sasia e disponueshme":=Inventory-TotalQuantity;
             END 
            else if not Reservation.FindSet() then begin
              Rec."Sasia e disponueshme":=Inventory;
            end;
            end;
            
          

    



  
         
  
}