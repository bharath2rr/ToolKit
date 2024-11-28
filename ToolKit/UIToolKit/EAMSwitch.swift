//
//  © 2022 Hexagon AB and/or its subsidiaries and affiliates. All rights reserved.
//  EAMSwitch.swift
//  EAMNext
// 
//  Created by PASUPULETI Ramakrishna S (Kiran) on 30/05/24.
//


import SwiftUI

/// A custom switch component that toggles between on and off states.
struct EAMSwitch: View {
    /// The binding to the switch's on/off state.
    @Binding var isOn: Bool
    /// The color of the switch when it is in the "on" state.
    var onColor: Color = .green
    /// The color of the switch when it is in the "off" state.
    var offColor: Color = .gray
    /// The size of the switch's thumb.
    var thumbSize: CGFloat = 20
    /// The size of the switch.
    var switchSize: CGSize = CGSize(width: 50, height: 30)
    
    var body: some View {
        EAMZStack(alignment: isOn ? .trailing : .leading) {
            RoundedRectangle(cornerRadius: switchSize.height / 2)
                .fill(isOn ? onColor : offColor)
                .frame(width: switchSize.width, height: switchSize.height)
            
            Circle()
                .fill(Color.white)
                .frame(width: thumbSize, height: thumbSize)
                .shadow(radius: 1)
                .padding(2)
        }
        .onTapGesture {
            withAnimation {
                isOn.toggle()
            }
        }
    }
}

//import SwiftUI
//
///// A custom switch component that toggles between on and off states.
//struct EAMSwitch: View {
//    /// The binding to the switch's on/off state.
//    @Binding var isOn: Bool
//    /// The color of the switch when it is in the "on" state.
//    var onColor: Color = .green
//    /// The color of the switch when it is in the "off" state.
//    var offColor: Color = .gray
//    /// The size of the switch's thumb.
//    var thumbSize: CGFloat = 20
//    /// The size of the switch.
//    var switchSize: CGSize = CGSize(width: 50, height: 30)
//    
//    var body: some View {
//        EAMZStack(alignment: isOn ? .trailing : .leading) {
//            RoundedRectangle(cornerRadius: switchSize.height / 2)
//                .fill(isOn ? onColor : offColor)
//                .frame(width: switchSize.width, height: switchSize.height)
//            
//            Circle()
//                .fill(Color.white)
//                .frame(width: thumbSize, height: thumbSize)
//                .shadow(radius: 1)
//                .padding(2)
//        }
//        .onTapGesture {
//            withAnimation {
//                isOn.toggle()
//            }
//        }
//    }
//}

//struct EAMSwitch_Previews: PreviewProvider {
//    @State static var isOn = true
//
//    static var previews: some View {
//        EAMSwitch(isOn: $isOn)
//            .padding()
//            .previewLayout(.sizeThatFits)
//    }
//}
