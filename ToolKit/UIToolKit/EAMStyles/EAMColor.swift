import SwiftUI


let unknownColor = Color(hex: "#218BE1")
let unknownBackgroundColor = Color(hex: "#fbf9fa")


let greenColor = Color(hex: "#348718")
let orangeColor = Color(hex: "#E49A37")

// Highlight colors
let ceruleanl = Color(hex: "#0097BA")
let ceruleand = Color(hex: "#4AB5CE")

// Light Accent Colors
let primary20l = Color(hex: "#005072")
let primary100l = Color(hex: "#FFFFFF")
let secondary40l = Color(hex: "#52717A")
let secondary20l = Color(hex: "#FFFFFF")
let secondary30l = Color(hex: "#E0E9EB")
let secondary90l = Color(hex: "#141B1F")

// Light Neutral Colors
let neutral1l = Color(hex: "#FAFAFA")
let neutral2l = Color(hex: "#1A1A1A")
let neutral3l = Color(hex: "#96979C") //Color(hex: "#7C7D83")
let neutral4l = Color(hex: "#E5E5E6")
let neutral5l = Color(hex: "#4A4B4F")
let neutral6l = Color(hex: "#CACBCE")
let neutral7l = Color(hex: "#FFFFFF")
let neutral8l = Color(hex: "#F5F5F5")
let neutral9l = Color(hex: "#F0F0F0")
let neutral10l = Color(hex: "#EBEBEB")
let neutral11l = Color(hex: "#E6E6E6")
let neutral12l = Color(hex: "#4D4D4D")




// Dark Accent Colors
let primary20d = Color(hex: "#4AB5CE")
let primary100d = Color(hex: "#000000")
let secondary40d = Color(hex: "#C2D2D6")
let secondary20d = Color(hex: "#29373D")
let secondary30d = Color(hex: "#3D545C")
let secondary90d = Color(hex: "#E0E9EB")

// Dark Neutral Colors
let neutral1d = Color(hex: "#0F0F0F")
let neutral2d = Color(hex: "#E6E6E6")
let neutral3d = Color(hex: "#96979C")
let neutral4d = Color(hex: "#4A4B4F")
let neutral5d = Color(hex: "#E5E5E6")
let neutral6d = Color(hex: "#4A4B4F")
let neutral7d = Color(hex: "#0A0A0A")
let neutral8d = Color(hex: "#1A1A1A")
let neutral9d = Color(hex: "#1F1F1F")
let neutral10d = Color(hex: "#2B2B2B")
let neutral11d = Color(hex: "#383838")
let neutral12D = Color(hex: "#E6E6E6")

// Define LightColors and DarkColors
let LightColors = EAMColors(
    isLight: true,
    primary: primary20l,
    onPrimary: neutral1l,
    secondary: secondary40l,
    onSecondary: neutral1l,
    secondaryContainer: secondary30l,
    onSecondaryContainer: neutral2l,
    surface: neutral7l,
    onSurface: neutral2l,
    outline: neutral3l,
    surfaceVariant: neutral8l,
    onSurfaceVariant: neutral3l,
    outlineVariant: neutral4l,
    surfaceContainerLowest: neutral9l,
    surfaceContainerLow: neutral10l,
    surfaceContainer: neutral11l,
    surfaceContainerHigh: neutral6l,
    surfaceContainerHighest: neutral2l,
    orange: orangeColor,
    cerulean: ceruleanl
)

let DarkColors = EAMColors(
    isLight: false,
    primary: primary20d,
    onPrimary: neutral1d,
    secondary: secondary40d,
    onSecondary: neutral1d,
    secondaryContainer: secondary30d,
    onSecondaryContainer: neutral2d,
    surface: neutral7d,
    onSurface: neutral2d,
    outline: neutral3d,
    surfaceVariant: neutral8d,
    onSurfaceVariant: neutral3d,
    outlineVariant: neutral4d,
    surfaceContainerLowest: neutral9d,
    surfaceContainerLow: neutral10d,
    surfaceContainer: neutral11d,
    surfaceContainerHigh: neutral6d,
    surfaceContainerHighest: neutral2d,
    orange: orangeColor,
    cerulean: ceruleand
)

// Color Struct
struct EAMColors {
    var isLight: Bool
    var primary: Color
    var onPrimary: Color
    var secondary: Color
    var onSecondary: Color
    var secondaryContainer: Color
    var onSecondaryContainer: Color
    var surface: Color
    var onSurface: Color
    var outline: Color
    var surfaceVariant: Color
    var onSurfaceVariant: Color
    var outlineVariant: Color
    var surfaceContainerLowest: Color
    var surfaceContainerLow: Color
    var surfaceContainer: Color
    var surfaceContainerHigh: Color
    var surfaceContainerHighest: Color
    var orange: Color
    var cerulean: Color
    
    func copy(
        isLight: Bool? = nil,
        primary: Color? = nil,
        onPrimary: Color? = nil,
        secondary: Color? = nil,
        onSecondary: Color? = nil,
        secondaryContainer: Color? = nil,
        onSecondaryContainer: Color? = nil,
        surface: Color? = nil,
        onSurface: Color? = nil,
        outline: Color? = nil,
        surfaceVariant: Color? = nil,
        onSurfaceVariant: Color? = nil,
        outlineVariant: Color? = nil,
        surfaceContainerLowest: Color? = nil,
        surfaceContainerLow: Color? = nil,
        surfaceContainer: Color? = nil,
        surfaceContainerHigh: Color? = nil,
        surfaceContainerHighest: Color? = nil,
        orange: Color? = nil,
        cerulean: Color? = nil
        
    ) -> EAMColors {
        return EAMColors(
            isLight: isLight ?? self.isLight,
            primary: primary ?? self.primary,
            onPrimary: onPrimary ?? self.onPrimary,
            secondary: secondary ?? self.secondary,
            onSecondary: onSecondary ?? self.onSecondary,
            secondaryContainer: secondaryContainer ?? self.secondaryContainer,
            onSecondaryContainer: onSecondaryContainer ?? self.onSecondaryContainer,
            surface: surface ?? self.surface,
            onSurface: onSurface ?? self.onSurface,
            outline: outline ?? self.outline,
            surfaceVariant: surfaceVariant ?? self.surfaceVariant,
            onSurfaceVariant: onSurfaceVariant ?? self.onSurfaceVariant,
            outlineVariant: outlineVariant ?? self.outlineVariant,
            surfaceContainerLowest: surfaceContainerLowest ?? self.surfaceContainerLowest,
            surfaceContainerLow: surfaceContainerLow ?? self.surfaceContainerLow,
            surfaceContainer: surfaceContainer ?? self.surfaceContainer,
            surfaceContainerHigh: surfaceContainerHigh ?? self.surfaceContainerHigh,
            surfaceContainerHighest: surfaceContainerHighest ?? self.surfaceContainerHighest,
            orange: orange ?? self.orange,
            cerulean: cerulean ?? self.cerulean
        )
    }
    
    mutating func updateColorsFrom(_ other: EAMColors) {
        self = other
    }
}

