page 50131 "Magazine list"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Inventory52;
    Caption='Magazine list';
    CardPageId="Inventory Page";
    Editable=false;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
              field("Kodi i Artikullit";Rec."Kodi i Artikullit"){
               ApplicationArea=all;
              }
              field(Magazina;Rec.Magazina){
              ApplicationArea=all;
              }
              field("Gjendja minimum";Rec."Gjendja minimum"){
              ApplicationArea=all;
              }
            field("Gjendja max";Rec."Gjendja max"){
                ApplicationArea=all;
            }
            }
        }
        area(Factboxes)
        {
            
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