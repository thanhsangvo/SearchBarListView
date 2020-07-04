//
//  PhoneCell.swift
//  SearchBarListView
//
//  Created by Võ Thanh Sang on 7/4/20.
//

import SwiftUI

struct PhoneCell: View {
    var phone: Phone
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(phone.name)
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
                    .background(Color.gray)
                Text(phone.price)
                    .border(Color.gray, width: 1)
                    .foregroundColor(Color.red)
            }
            
            if phone.didBuy == true {
                Spacer()
                
                Image(systemName: "checkmark")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct PhoneCell_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCell(phone: phoneData[0])
    }
}
