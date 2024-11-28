//
//  EAMTheme.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 20/05/24.
//


import SwiftUI

let lightColors = EAMColors(
    primary: InforBlue1,
    background: .white,
    textPrimary: .black,
    onPrimary: .white,
    onBackground: InforGray1,
    isLight: true
)

let darkColors = EAMColors(
    primary: InforSecondaryBlue,
    background: InforGray1,
    textPrimary: .white,
    onPrimary: .white,
    onBackground: .white,
    isLight: false
)

//struct EAMTheme<Content: View>: View {
//    var typography: EAMTypography = EAMTypography()
//    //var shapes: Shapes = EAMTheme.shapes
//    var darkTheme: Bool = UITraitCollection.current.userInterfaceStyle == .dark
//    var content: () -> Content
//    
//    @State private var colors: EAMColors
//    
//}
//    init(
////        typography: EAMTypography =
//        //shapes: Shapes = EAMTheme.shapes,
//        darkTheme: Bool = UITraitCollection.current.userInterfaceStyle == .dark,
//        @ViewBuilder content: @escaping () -> Content
//    ) {
//        //self.typography = typography
//        //self.shapes = shapes
//        self.darkTheme = darkTheme
//        self.content = content
//        _colors = State(initialValue: darkTheme ? DarkColors : LightColors)
//    }
//
//    var body: some View {
//        let rememberedColors = colors
//        rememberedColors.updateColors(from: darkTheme ? DarkColors : LightColors)
//
//        return content()
//            .environment(\.colors, rememberedColors)
//            .environment(\.shapes, shapes)
//            .environment(\.typography, typography)
//            .environment(\.rippleTheme, MaterialRippleTheme())
//    }
//}

//extension EnvironmentValues {
//    var colors: EAMColors {
//        get { self[ColorsKey.self] }
//        set { self[ColorsKey.self] = newValue }
//    }
//
//    var typography: EAMTypography {
//        get { self[TypographyKey.self] }
//        set { self[TypographyKey.self] = newValue }
//    }
//
//}
//
//private struct ColorsKey: EnvironmentKey {
//    static let defaultValue: EAMColors = LightColors
//}
//
//private struct ShapesKey: EnvironmentKey {
//    static let defaultValue: Shapes = Shapes()
//}
//
//private struct TypographyKey: EnvironmentKey {
//    static let defaultValue: EAMTypography = EAMTypography()
//}




//// Usage example
//struct ContentView: View {
//    var body: some View {
//        EAMTheme {
//            Text("Hello, World!")
//                .font(.system(size: EAMTheme.typography.body1.fontSize))
//                .foregroundColor(EAMTheme.colors.textPrimary)
//        }
//    
//    }
//}


//import SwiftUI
//import Combine
//
//struct Theme {
//    var primary: Color
//    var background: Color
//    var textPrimary: Color
//    var onPrimary: Color
//    var onBackground: Color
//    var isLight: Bool
//}
//
//let LightTheme = Theme(
//    primary: Color.blue,
//    background: Color.white,
//    textPrimary: Color.white,
//    onPrimary: Color.white,
//    onBackground: Color.gray,
//    isLight: true
//)
//
//let DarkTheme = Theme(
//    primary: Color.secondary,
//    background: Color.gray,
//    textPrimary: Color.white,
//    onPrimary: Color.white,
//    onBackground: Color.white,
//    isLight: false
//)
//
//
//
//class ThemeManager: ObservableObject {
//    @Published var currentTheme: Theme = LightTheme
//    
//    func switchTheme(isDark: Bool) {
//        currentTheme = isDark ? DarkTheme : LightTheme
//    }
//}
