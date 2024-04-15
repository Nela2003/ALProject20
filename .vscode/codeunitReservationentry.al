codeunit 50133 "Check Reservation Entries"{
    
    procedure CheckReservation(SalesLine:Record "Sales Line")
    var
        InventoryWarehouse: Record Inventory52;
        Reservation:Record "Reservation Entry";
        Testvariable:Record "Test Table";
    
     
        
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
            Testvariable:Record "Test Table";
          page1:Page "Reservation Entries";
     
        
    begin
     
           
         Reservation.SetRange("Item No.",SalesLine."No.");
         Reservation.SetRange("Location Code",SalesLine."Location Code");

         

        if  Reservation.FindSet() Then  begin
            repeat
           
             clear(ReservationEntry1);
          
          
            ReservationEntry1."Entry No.":=Reservation."Entry No.";
            ReservationEntry1."Item No.":=Reservation."Item No.";
            ReservationEntry1."Location Code":=Reservation."Location Code";
            ReservationEntry1."Quantity (Base)":=Reservation."Quantity (Base)";
            ReservationEntry1."Transferred from Entry No.":=Reservation."Transferred from Entry No.";
            ReservationEntry1."Reservation Status":=Reservation."Reservation Status";
            Reservation.Positive:= false;
            ReservationEntry1.Positive:=Reservation.Positive;
            ReservationEntry1.Insert();
            Reservation."Entry No.":=Reservation."Entry No."+1;
         
            //////////

            //  Testvariable."Entry No.":=Reservation."Entry No.";
            // Testvariable."Item No.":=Reservation."Item No.";
            //  Testvariable."Location Code":=Reservation."Location Code";
            // Testvariable."Quantity (Base)":=Reservation."Quantity (Base)";
            // Testvariable."Transferred from Entry No.":=Reservation."Transferred from Entry No.";
            // Testvariable."Reservation Status":=Reservation."Reservation Status";
            // Testvariable.Insert();
            // Testvariable."Entry No." := Reservation."Entry No." +1;

            //  ReservationEntry1."Entry No." := Reservation."Entry No.";

            // Page.Run(Page::"Reservation Entries",ReservationEntry1);
            until Reservation.Next()=0;
             Page.Run(497,ReservationEntry1);
       
         
            
          
            END ;

           
            
            
             
            
            // Item.SetRange("No.",SalesLine."No.");
            // if ITem.FindFirst() then begin
            //  Inventory:=Item.Inventory;
            //  InventoryFormated:=Format(Inventory);
            //  Message(InventoryFormated);
            // end;
        
          
        END;

////////////

procedure sasiaedisponueshme(SalesLine:Record "Sales Line");
begin

end;
         
    
}

