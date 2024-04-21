pageextension 50133 "Sales Order Extension " extends  "Sales Order Subform"
{  
    layout
    {
       
        modify("Location Code"){
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
               if Rec."Location Code"='' then Rec."Location Code":='' ;
               
            end;
        }
    }
}
