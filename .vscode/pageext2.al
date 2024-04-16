pageextension 50133 "Sales Order Extension 2" extends  "Sales Order Subform"
{  
    layout
    {
        modify(Quantity)
        {
           trigger OnAfterValidate()
        //    var  codeunit1:Codeunit "Check Reservation Entries" ;
            var codeunit2:Codeunit InventoryCheck;
            begin
              
                // codeunit1.CheckReservation2(Rec);;
                codeunit2.CheckInventory(Rec);;
               
            end;



            
        }
        modify("Location Code"){
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
               if Rec."Location Code"='' then Rec."Location Code":='' ;
               ///Nga Rec.Location Code <>' '  ne =
              
            end;
        }
    }
}
