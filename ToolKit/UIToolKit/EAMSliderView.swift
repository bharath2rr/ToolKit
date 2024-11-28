//
//  EAMSliderView.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 21/05/24.
//
//

import SwiftUI

struct EAMSliderView: View {
    @Binding var value: Double
    var minValue: Double
    var maxValue: Double
    var minmaxVisibility: Bool = false
    var width: CGFloat? = nil
    var trackColor: Color = Color.gray
    var thumbSize: CGSize = CGSize(width: 30, height: 30) // Default thumb size
    var onValueChange: (Double) -> Void
    
    var body: some View {
        VStack {
            HStack {
                if minmaxVisibility {
                    Text("\(Int(minValue))")
                        .foregroundColor(.gray)
                }
                
                SliderWrapper(
                    value: $value,
                    minValue: minValue,
                    maxValue: maxValue,
                    trackColor: trackColor,
                    thumbColor: EAMTheme.eamColors.primary,
                    thumbSize: thumbSize,
                    width: width,
                    onValueChange: onValueChange
                )
                if minmaxVisibility {
                    Text("\(Int(maxValue))")
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
    }
    
    struct SliderWrapper: UIViewRepresentable {
        @Binding var value: Double
        var minValue: Double
        var maxValue: Double
        var trackColor: Color
        var thumbColor: Color
        var thumbSize: CGSize
        var width: CGFloat?
        var onValueChange: (Double) -> Void
        
        func makeUIView(context: Context) -> UISlider {
            let slider = UISlider()
            slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
            return slider
        }
        
        func updateUIView(_ uiView: UISlider, context: Context) {
            uiView.minimumValue = Float(minValue)
            uiView.maximumValue = Float(maxValue)
            uiView.value = Float(value)
            uiView.frame.size.width = width ?? uiView.frame.size.width
            
            uiView.minimumTrackTintColor = UIColor(trackColor)
            uiView.maximumTrackTintColor = UIColor.gray
            
            uiView.setThumbImage(createThumbImage(size: thumbSize, color: thumbColor), for: .normal)
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject {
            var parent: SliderWrapper
            
            init(_ parent: SliderWrapper) {
                self.parent = parent
            }
            
            @objc func valueChanged(_ sender: UISlider) {
                parent.value = Double(sender.value)
                parent.onValueChange(parent.value)
            }
        }
        
        private func createThumbImage(size: CGSize, color: Color) -> UIImage? {
            let renderer = UIGraphicsImageRenderer(size: size)
            return renderer.image { context in
                let rect = CGRect(origin: .zero, size: size)
                context.cgContext.setFillColor(UIColor(color).cgColor)
                context.cgContext.fillEllipse(in: rect)
            }
        }
    }
}
