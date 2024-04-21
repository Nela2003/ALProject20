tableextension 50131 "Location table ext"extends Location
{
    fields
    {
      
       field(50131;"Item No"; Code[20])
       { 
        TableRelation=Item."No.";
        DataClassification = ToBeClassified;
       }
       
       }
    
    
    keys
    {
       
    }
    
    fieldgroups
    {
      
    }
    
    var
        myInt: Integer;
    
}