pageextension 50133 "Sales Order Extension 2" extends  "Sales Order Subform"
{  
    layout
    {
        modify(Quantity)
        {
           trigger OnAfterValidate()
           var  codeunit1:Codeunit "Check Reservation Entries" ;
            begin
                // Call the custom procedure to check inventory after the user enters quantity
                codeunit1.CheckReservation2(Rec);;
            end;



            
        }
    }
}
