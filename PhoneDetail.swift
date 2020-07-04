//
//  PhoneDetail.swift
//  SearchBarListView
//
//  Created by Võ Thanh Sang on 7/4/20.
//

import SwiftUI

struct PhoneDetail: View {
    
    var phone: Phone
    var intro = "The iPhone is a line of smartphones designed and marketed by Apple Inc. All generations of the iPhone use Apple's iOS mobile operating system software. The first-generation iPhone was released on June 29, 2007, and multiple new hardware iterations with new iOS releases have been released since."
    
    var body: some View {
        VStack(alignment: .center) {
            Text(phone.name)
                .font(.largeTitle)
            Divider()
            Text(phone.price)
                .font(.title)
            Divider()
            Text(intro)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(10)
        }
        .padding()
        .navigationBarTitle(phone.name)
    }
}

struct PhoneDetail_Previews: PreviewProvider {
    static var previews: some View {
        PhoneDetail(phone: phoneData[0] )
    }
}
