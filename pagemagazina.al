page  50130 "Inventory Page"
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
          field("Kodi i Artikullit";Rec."Kodi i Artikullit"){
         ApplicationArea=all;
          } 
          field(Magazina;Rec.Magazina){
          ApplicationArea=all;
          }
          field("Gjendja minimum";Rec."Gjendja minimum")
          {
            ApplicationArea = All;
          }
        //   field("Gjendja maximum";Rec."Gjendja maximum"){
        //   ApplicationArea=all;
        //   }
        field("Gjendja max";Rec."Gjendja max"){

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
}