pageextension 50150 "Location ITem" extends "Item Availability by Location"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;


//          trigger OnAfterGetRecord()
//     var
//         Item: record Item;
//         Inventory1:Decimal;
//         Reservation1:record "Reservation Entry";
//         ReservationEntry1:record "Reservation Entry" temporary;
//         TotalQuantity:Decimal;
//         Itemno:code[20];
//         Location:record Location;
//          LocationCode1:Code[10];
//          Value:code[20];
       


//     begin
            
       
  
//         //    // LocationCode1:=Rec.
//             Itemno:=Item."No.";
//         //     ITemno1:=Item."No.";
          
//         //     Item.SetRange("Inventory",Item.Inventory);
//         //     if Item.FindFirst() then begin 
//         //         Item.Inventory:=Item."Inventory"+2;
//         //     end;

//     //         Itemno:=Item."No.";
//     //  Item.SetRange("No.",Itemno);
//     //  If Item.FindFirst() then
//     //  Inventory1:=Item.Inventory;

// //    Inventory1:=Location."Item by avail Inventory";
  

        
//     //     Reservation1.SetRange("Item No.",Itemno);
//         Reservation1.SetRange("Location Code",LocationCode1);
//         Reservation1.SetRange("Item No.",Itemno);

         

//         if  Reservation1.FindSet() Then  begin
//             repeat
           
//              clear(ReservationEntry1);
           
          
//             ReservationEntry1."Entry No.":=Reservation1."Entry No.";
//             ReservationEntry1."Item No.":=Reservation1."Item No.";
//             ReservationEntry1."Location Code":=Reservation1."Location Code";
//             ReservationEntry1."Quantity (Base)":=Reservation1."Quantity (Base)";
//             ReservationEntry1."Transferred from Entry No.":=Reservation1."Transferred from Entry No.";
//             ReservationEntry1."Reservation Status":=Reservation1."Reservation Status";
//             Reservation1.Positive:= false;
//             ReservationEntry1.Positive:=Reservation1.Positive;
//             TotalQuantity:=TotalQuantity + ReservationEntry1."Quantity (Base)";
//             ReservationEntry1.Insert();
//             Reservation1."Entry No.":=Reservation1."Entry No."+1;
         
            
//             until Reservation1.Next()=0;
//              Rec."Sasia e Disponueshme":=TotalQuantity;
//              Message('kjo eshte ekzekutuar');

             
       
         
            
          
//             END 
//             else if not Reservation1.FindSet() then begin
//                  clear(TotalQuantity);
//                 TotalQuantity:=Inventory1;
//                 Rec."Sasia e disponueshme":=TotalQuantity;
//                 MEssage('Ekzekutim 2');
//             end;
//             end;
}