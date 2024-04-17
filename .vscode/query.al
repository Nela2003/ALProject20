query  50130  "Sasia lidhur me location"{
    elements{
        dataitem(itemledger;"Item Ledger Entry"){
            column(Item_No_;"Item No."){

            }
            column(Location_Code;"Location Code"){

            } 
            dataitem(Itemtable;Item){
            DataitemLink="No."=Itemledger."Item No.";          
            SqlJoinType=InnerJoin;
            column(Inventory;Inventory){
                
            }
            column(Description;Description){

            }

            dataitem(Location;Location){
                DataItemLink=Code=Itemledger."Location Code";
                SqlJoinType=InnerJoin;
                column(Code;Code){

                }
                column(Country_Region_Code;"Country/Region Code"){

                }
            }
            }
              
           
        }
    }
}