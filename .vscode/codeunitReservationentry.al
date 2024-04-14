codeunit 50133 "Check Reservation Entries"{
    
    procedure CheckReservation(SalesLine:Record "Sales Line")
    var
        InventoryWarehouse: Record Inventory52;
        Reservation:Record "Reservation Entry";
    
     
        
    begin
     
           
         Reservation.SetRange("Item No.",SalesLine."No.");
         

        IF Reservation.FindSet() Then begin
            repeat
            until Reservation.Next()=0;
       
            
            
          
            END 
            
            
             
            
            // Item.SetRange("No.",SalesLine."No.");
            // if ITem.FindFirst() then begin
            //  Inventory:=Item.Inventory;
            //  InventoryFormated:=Format(Inventory);
            //  Message(InventoryFormated);
            // end;
        
          
        END;

        ///////////////////////////
          procedure CheckReservation2(SalesLine:Record "Sales Line")
    var
        InventoryWarehouse: Record Inventory52;
        Reservation:Record "Reservation Entry";
        ReservationEntry1:Record "Reservation Entry" temporary;
    
     
        
    begin
     
           
         Reservation.SetRange("Item No.",SalesLine."No.");
         Reservation.SetRange("Location Code",SalesLine."Location Code");

         

        if  Reservation.FindSet() Then begin
            repeat
            Clear(ReservationEntry1);
            ReservationEntry1."Item No.":=Reservation."Item No.";
            ReservationEntry1."Location Code":=Reservation."Location Code";
            ReservationEntry1."Quantity (Base)":=Reservation."Quantity (Base)";
            ReservationEntry1."Entry No.":=Reservation."Entry No.";
            ReservationEntry1."Transferred from Entry No.":=Reservation."Transferred from Entry No.";
            ReservationEntry1."Reservation Status":=Reservation."Reservation Status";
            ReservationEntry1.Insert();
            Reservation."Entry No." := Reservation."Entry No." +1;
             ReservationEntry1."Entry No." := ReservationEntry1."Entry No." +1;

            // Page.Run(Page::"Reservation Entries",ReservationEntry1);
            until Reservation.Next()=0;
             Page.Run(Page::"Reservation Entries",ReservationEntry1);
       
         
            
          
            END ;

           
            
            
             
            
            // Item.SetRange("No.",SalesLine."No.");
            // if ITem.FindFirst() then begin
            //  Inventory:=Item.Inventory;
            //  InventoryFormated:=Format(Inventory);
            //  Message(InventoryFormated);
            // end;
        
          
        END;


         
    
}

