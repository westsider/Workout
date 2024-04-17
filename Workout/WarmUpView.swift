//
//  WarmUpView.swift
//  Workout
//
//  Created by Warren Hansen on 4/17/24.
//  Copyright © 2024 Warren Hansen. All rights reserved.
//

import SwiftUI

struct WarmUpView: View {
    var dismissAction : (() -> Void)
    var body: some View {
        Button {
            dismissAction()
        } label: {
            HStack {
                Image(systemName: "chevron.backward")
                Text("Back")
            }
        }.offset(x: -150)
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                
                Text("Warm Ups").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("20 Band Pull Aparts")
                Image("BandStretch").resizable()
                    .frame(width: 200, height: 200)
                Divider().frame( width: 200, height: 5.0).overlay(.gray)
                Spacer()
                Text("20 Glute Bridges")
                Image("Glute").resizable()
                    .frame(width: 200, height: 200)
                Divider().frame( width: 200, height: 5.0).overlay(.gray)
                Spacer()
                Text("3 Hip Flexor Stretches")
              
                Text("Each Side").font(.subheadline)
                Image("Flexor").resizable()
                    .frame(width: 200, height: 200)
                Divider().frame( width: 200, height: 5.0).overlay(.gray)
                Spacer()
                Text("10 Yoga Push Ups")
                Image("Yoga").resizable()
                    .frame(width: 200, height: 200)
                Divider().frame( width: 200, height: 5.0).overlay(.gray)
                Spacer()
                Text("10 Fire Hydrant")
                Text("Each Side").font(.subheadline)
                Image("Hydrant").resizable()
                    .frame(width: 200, height: 200)
            }
        }
    }
}

#Preview {
    WarmUpView(dismissAction: {})
}
