pageextension 50144 "Item avail page ext" extends "Item Avail. by Location Lines"
{
    layout
    {
     addlast(Control1){
        field("Sasia e Disponueshme Item avail";Rec."Sasia e Disponueshme Item avail"){
         ApplicationArea=all;
        }
     }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
       Reservation1:Record "Reservation Entry";
       ReservationPage:PAge "Reservation Entries";
       Page1:PAge "Item Availability by Location";
       ITem4:Record "Item Ledger Entry";
       Item:Record Item;
       ItemAvailByLocation:Page "Item Availability by Location";



        ///
        trigger OnAfterGetRecord()
    var
        // Item: record Item;
        Inventory1:Decimal;
        Reservation1:record "Reservation Entry";
        ReservationEntry1:record "Reservation Entry" temporary;
        TotalQuantity:Decimal;
        Itemno:code[20];
        Location:record Location;
         LocationCode1:Code[10];
         Value:code[20];
         Item4:Record "Item Ledger Entry";
         Number:Code[20];
         LocationCode2:Code[10];
         Description3:Text[100];
         counter:integer;
         Invent:Decimal;
         LocationCode4:Code[10];
         ItemLedgerEntries:Page "Item Ledger Entries";
       Quant:Decimal;


    begin
            
       
  
        //    // LocationCode1:=Rec.
       
            LocationCode1:=Rec.Code ;
            
            
        //     ITemno1:=Item."No.";
        // Location.SetRange(Code,LocationCode1);
        // if Location.FindFirst() then begin
        //     LocationCode2:=Location.Code;
            //
              Item4.SetRange("Location Code",Rec.Code);
            //   counter:=0;
            //   Item4.SetRange(Description,Description3);
            If Item4.FindSet() then begin 
         repeat 
         if Item4.FindFirst()then begin
              Number:=Item4."Item No.";
              LocationCode4:='M6';
              Inventory1:=Item4.Quantity;
              
              
          
                 
            //       Item.SetRange("No.",Item4."Item No.");
               

            //  If Item.FindFirst() then 
            // Message('%1',Item.Inventory);
                  
        //   If Item.FindFirst() then begin
        //     clear(Invent);
        //     Invent:=Item.Inventory;
        
        //     Message('%1',Invent);
        //   end;
         Item.SetRange("No.",Item4."Item No.");
         Item.SetRange("Location Filter",'M6');
               

             If Item.FindFirst() then 
             SetItemFilter();
             ItemAvailFormsMgt.ShowItemLedgerEntries(Item,false);
            Item4.SetRange("Item No.",Item4."Item No.");
Item4.SetRange("Location Code",'M6');
If Item4.FindSet() then begin
 Quant:=0;
    repeat
    Quant:=Quant+Item4.Quantity;
        
    until Item4.Next() = 0;
    Message('%1',Quant);
end;
             ItemLedgerEntries.Close();
             ItemLedgerEntries.Update(true);
             ItemLedgerEntries.Close();
            //  Page.Run(Page::"Item Availability by Location");
             
             

             
            
        break;
          end; 
             
        //       Item.SetRange("No.",Number);
        //   If Item.FindFirst() then begin
        //     clear(Invent);
        //     Invent:=Item4.Inventory2;
        
        //     Message('%1',Invent);
        //   end;
            //   exit;
        
          
           
               until Item4.Next=0;
            
        //       Item.SetRange("No.",Number);
        //   If Item.FindFirst() then begin
        //     clear(Invent);
        //     Invent:=Item.Inventory;
        
        //     Message('%1',Invent);
        //   end;  
        //   Item.SetRange("No.",Number);
        //  If Item.FindFirst() then 
        //     Message('%1',Item.Inventory);
        
        end;
        //    Item.SetRange("No.",Number);
               

        //      If Item.FindFirst() then 
        //     Message('%1',Item.Inventory);
        ////
        //  Item.SetRange("No.",Number);
        //  If Item.FindFirst() then begin
        //     Message('%1',Item.Inventory);
        //  end;
     // **********  Item.SetRange("No.",Number);
        //   If Item.FindFirst() then begin
        //     Inventory1:=Item.Inventory;
//         //     Message('%1',Inventory1);
//         //   end;
//         //***************////////////
// Item.SetRange("No.",Item4."Item No.");
// Item.SetRange("Location Filter",'M6');
// If Item.FindSet() then begin
//  Quant:=0;
//     repeat
//     Quant:=Quant+Item4.Quantity;
        
//     until Item.Next() = 0;
//     Message('%1',Quant);
// end;




  Reservation1.SetRange("Item No.",Item4."Item No.");
  

         

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
             Rec."Sasia e Disponueshme Item avail":=Quant-TotalQuantity;

             
       
         
            
          
            END 
            else if not Reservation1.FindSet() then begin
                 clear(TotalQuantity);
                TotalQuantity:=Inventory1;
                Rec."Sasia e Disponueshme Item avail":=TotalQuantity;
            end;





        //////////////////////////
          
        //    until Item4.Next()=0;
             
            end;
          
        //     Item.SetRange("Inventory",Item.Inventory);
        //     if Item.FindFirst() then begin 
        //         Item.Inventory:=Item."Inventory"+2;
        //     end;

    //         Itemno:=Item."No.";
    //  Item.SetRange("No.",Itemno);
    //  If Item.FindFirst() then
    //  Inventory1:=Item.Inventory;

//    Inventory1:=Location."Item by avail Inventory";
  

        
    //     Reservation1.SetRange("Item No.",Itemno);*******************
        // Reservation1.SetRange("Location Code",LocationCode1);
        // Reservation1.SetRange("Item No.",Itemno);

         

        // if  Reservation1.FindSet() Then  begin
        //     repeat
           
        //      clear(ReservationEntry1);
           
          
        //     ReservationEntry1."Entry No.":=Reservation1."Entry No.";
        //     ReservationEntry1."Item No.":=Reservation1."Item No.";
        //     ReservationEntry1."Location Code":=Reservation1."Location Code";
        //     ReservationEntry1."Quantity (Base)":=Reservation1."Quantity (Base)";
        //     ReservationEntry1."Transferred from Entry No.":=Reservation1."Transferred from Entry No.";
        //     ReservationEntry1."Reservation Status":=Reservation1."Reservation Status";
        //     Reservation1.Positive:= false;
        //     ReservationEntry1.Positive:=Reservation1.Positive;
        //     TotalQuantity:=TotalQuantity + ReservationEntry1."Quantity (Base)";
        //     ReservationEntry1.Insert();
        //     Reservation1."Entry No.":=Reservation1."Entry No."+1;
         
            
        //     until Reservation1.Next()=0;
        //      Rec."Sasia e Disponueshme Item avail":=TotalQuantity;

             
       
         
            
          
        //     END 
        //     else if not Reservation1.FindSet() then begin
        //          clear(TotalQuantity);
        //         TotalQuantity:=Inventory1;
        //         Rec."Sasia e Disponueshme Item avail":=TotalQuantity;
        //     end;
          

}