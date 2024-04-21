page 50130 "Inventory Page"
{
    Caption = 'Caption';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Inventory52;



    layout
    {
        area(Content)
        {
            group(Inventory)
            {
                field("Kodi i Artikullit"; Rec."Kodi i Artikullit")
                {
                    ApplicationArea = all;
                }
                field(Magazina; Rec.Magazina)
                {
                    ApplicationArea = all;
                }
                field("Gjendja minimum"; Rec."Gjendja minimum")
                {
                    ApplicationArea = All;
                }
                field("Gjendja max"; Rec."Gjendja max")
                {  ApplicationArea=All;

                }



            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Item: record Item;
        Inventory: Decimal;
        Reservation: record "Reservation Entry";
        TotalQuantity: Decimal;
    begin
        Item.SetRange("No.", Rec."Kodi i Artikullit");
        if Item.FindFirst() then begin
            Item.CalcFields(Inventory);
            Inventory := Item.Inventory;
        end;
        Reservation.SetRange("Item No.", Rec."Kodi i Artikullit");
        Reservation.SetRange("Location Code", Rec.Magazina);
        Reservation.SetRange("Positive", false);
        if Reservation.FindSet() Then begin
            repeat
                TotalQuantity := TotalQuantity + Reservation."Quantity (Base)";
            until Reservation.Next() = 0;
            Rec."Sasia e disponueshme ITL" := Inventory - TotalQuantity;
        end
        else begin
            Rec."Sasia e disponueshme ITL" := Inventory;
        end;
        Rec.Modify();

    end;
}