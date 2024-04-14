// pageextension 50130 "Sales Order Extension" extends  "Sales Order Subform"
// {  
//     layout
//     {
//         modify(Quantity)
//         {
//            trigger OnAfterValidate()
//            var  codeunit1:Codeunit InventoryCheck;
//             begin
//                 // Call the custom procedure to check inventory after the user enters quantity
//                 codeunit1.CheckInventory(Rec);;
//             end;
//         }
//     }
// }
