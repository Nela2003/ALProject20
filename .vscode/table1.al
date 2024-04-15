table 50134 "Test Table"
{
    DataClassification = ToBeClassified;
    Caption='Test Table';
    
    fields
    {
        field(1;"Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
          field(2;"Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }
          field(3;"Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            
        }
          field(4;"Quantity (Base)"; Decimal)
        {
            DataClassification = ToBeClassified;
            
        }
          field(5;"Transferred from Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
            field(6;"Reservation Status"; Enum "Reservation Status")
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}