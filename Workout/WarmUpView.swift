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
    @State private var isChecked = [false, false, false, false, false]
    
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
                Divider()
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(lineWidth: 2)
                                    .frame(width: 25, height: 25)
                                    .cornerRadius(5.0)
                                    .overlay {
                                        Image(systemName: isChecked[0] ? "checkmark" : "")
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isChecked[0].toggle()
                                        }
                                    }
                    Spacer()
                    Text("20 Band Pull Aparts")
                    Spacer()
                }
                Image("BandStretch").resizable()
                    .frame(width: 200, height: 200)
                Spacer()
                Divider()
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(lineWidth: 2)
                                    .frame(width: 25, height: 25)
                                    .cornerRadius(5.0)
                                    .overlay {
                                        Image(systemName: isChecked[1] ? "checkmark" : "")
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isChecked[1].toggle()
                                        }
                                    }
                    Spacer()
                    Text("20 Glute Bridges")
                    Spacer()
                }
                
                Image("Glute").resizable()
                    .frame(width: 200, height: 200)
                Spacer()
                Divider()
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(lineWidth: 2)
                                    .frame(width: 25, height: 25)
                                    .cornerRadius(5.0)
                                    .overlay {
                                        Image(systemName: isChecked[2] ? "checkmark" : "")
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isChecked[2].toggle()
                                        }
                                    }
                    Spacer()
                    Text("3 Hip Flexor Stretches each side")
                    Spacer()
                }

                Image("Flexor").resizable()
                    .frame(width: 200, height: 200)
                Divider()
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(lineWidth: 2)
                                    .frame(width: 25, height: 25)
                                    .cornerRadius(5.0)
                                    .overlay {
                                        Image(systemName: isChecked[3] ? "checkmark" : "")
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isChecked[3].toggle()
                                        }
                                    }
                    Spacer()
                    Text("10 Yoga Push Ups")
                    Spacer()
                }
                
                Image("Yoga").resizable()
                    .frame(width: 200, height: 200)
               
                Spacer()
                Divider()
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(lineWidth: 2)
                                    .frame(width: 25, height: 25)
                                    .cornerRadius(5.0)
                                    .overlay {
                                        Image(systemName: isChecked[4] ? "checkmark" : "")
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            isChecked[4].toggle()
                                        }
                                    }
                    Spacer()
                    Text("10 Fire Hydrant. Each side.")
                    Spacer()
                }
                Image("Hydrant").resizable()
                    .frame(width: 200, height: 200)
            }
        }.padding(.horizontal)
    }
}

#Preview {
    WarmUpView(dismissAction: {})
}
