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
                //   field("Gjendja maximum";Rec."Gjendja maximum"){
                //   ApplicationArea=all;
                //   }
                field("Gjendja max"; Rec."Gjendja max")
                {

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
        Inventory1: Decimal;
        Reservation1: record "Reservation Entry";
        ReservationEntry1: record "Reservation Entry" temporary;
        TotalQuantity: Decimal;
        Itemno: code[20];
    begin
        Item.SetRange("No.", Rec."Kodi i Artikullit");
        if Item.FindFirst() then begin
            Item.CalcFields(Inventory);
            Inventory1 := Item.Inventory;
        end;
        Reservation1.SetRange("Item No.", Rec."Kodi i Artikullit");
        Reservation1.SetRange("Location Code", Rec.Magazina);
        Reservation1.SetRange("Positive", false);
        if Reservation1.FindSet() Then begin
            repeat
                TotalQuantity := TotalQuantity + Reservation1."Quantity (Base)";
            until Reservation1.Next() = 0;
            Rec."Sasia e disponueshme ITL" := Inventory1 - TotalQuantity;
        end
        else begin
            Rec."Sasia e disponueshme ITL" := Inventory1;
        end;
        Rec.Modify();

    end;
}