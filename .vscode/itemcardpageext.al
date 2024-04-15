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
        // Add changes to page actions here
    }
    


    trigger OnAfterGetRecord()
    var
        Item: record Item;
        Inventory1:Decimal;
        Reservation1:record "Reservation Entry";
        ReservationEntry1:record "Reservation Entry" temporary;
        TotalQuantity:Decimal;
        Itemno:code[20];

    begin
        
        Inventory1:=Rec.Inventory;

      Itemno:=Rec."No.";
      


        
        Reservation1.SetRange("Item No.",Itemno);
  

         

        if  Reservation1.FindSet() Then  begin
            repeat
           
             clear(ReservationEntry1);
           
          
            ReservationEntry1."Entry No.":=Reservation1."Entry No.";
            ReservationEntry1."Item No.":=Reservation1."Item No.";
            ReservationEntry1."Location Code":=Reservation1."Location Code";
            ReservationEntry1."Quantity (Base)":=Reservation1."Quantity (Base)";
            ReservationEntry1."Transferred from Entry No.":=Reservation1."Transferred from Entry No.";
            ReservationEntry1."Reservation Status":=Reservation1."Reservation Status";
            Reservation1.Positive:= false;
            ReservationEntry1.Positive:=Reservation1.Positive;
            TotalQuantity:=TotalQuantity + ReservationEntry1."Quantity (Base)";
            ReservationEntry1.Insert();
            Reservation1."Entry No.":=Reservation1."Entry No."+1;
         
            
            until Reservation1.Next()=0;
             Rec."Sasia e disponueshme":=Inventory1-TotalQuantity;

             
       
         
            
          
            END 
            else if not Reservation1.FindSet() then begin
                 clear(TotalQuantity);
                TotalQuantity:=Inventory1;
                Rec."Sasia e disponueshme":=TotalQuantity;
            end;
            end;
            
            // IF not Reservation1.FindSet()then begin
            //     TotalQuantity:=Inventory1;
            // end;

    
    var
        myInt: Integer;
        Reservation1:record "Reservation Entry";


  
         
  
}