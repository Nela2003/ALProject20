table 50161 "Inventory52"
{
    DataClassification = ToBeClassified;

    caption = 'Inventory52';
    LookupPageId = "Magazine list";
    DrillDownPageId = "Magazine list";


    fields
    {
        field(1; "Kodi i Artikullit"; Code[20])
        {
            DataClassification = ToBeClassified;
            caption = 'Kodi i Artikullit';
            TableRelation = Item."No.";

        }
        field(2; "Magazina"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Magazina';
            TableRelation = Location;
        }
        field(3; "Gjendja minimum"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Gjendja minimum';
        }
        field(5; "Gjendja max"; Integer)
        {
            dataclassification = ToBeClassified;
            Caption = 'Gjendja max';
        }
        field(7;"Artikulli"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation=Item.Description;
        }
        field(8; "Sasia e disponueshme ITL"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; MaxInventoryinWarehouse; Integer)
        {  
           FieldClass=FlowField;
           CalcFormula=sum(Inventory52."Gjendja max" where(Magazina=field(Magazina)));
        }
    }
    
    keys
    {
        key(Key1; "Kodi i Artikullit","Magazina")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
      
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