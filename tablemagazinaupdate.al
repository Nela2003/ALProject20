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
        field(4; "Gjendja maximum"; Blob)
        {
            DataClassification = ToBeClassified;
            Caption = 'Gjendja maximum';
        }
        field(5; "Gjendja max"; Integer)
        {
            dataclassification = ToBeClassified;
            Caption = 'Gjendja max';
        }
        field(6;Inventory;Integer){
            caption='Inventory';
            TableRelation=Item."Sasia e disponueshme";
            ///nga Item.Inventory ne Item.Sasia e disponueshme
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