import Foundation
import SwiftUI

public class MaterialTheme: ObservableObject {

    @Published public var colorPalette: ColorPalette
    @Published public var typography: Typography

    public struct ColorPalette {
        public private(set) var primary: Color
        public private(set) var secondary: Color
        public private(set) var primaryVariant: Color
        public private(set) var secondaryVariant: Color
        public private(set) var background: Color
        public private(set) var surface: Color
        public private(set) var error: Color

        public private(set) var onPrimary: Color
        public private(set) var onSecondary: Color
        public private(set) var onBackground: Color
        public private(set) var onSurface: Color
        public private(set) var onError: Color

        public init(
            primary: Color = .black,
            secondary: Color = .gray,
            primaryVariant: Color = .black,
            secondaryVariant: Color = .gray,
            background: Color = .white,
            surface: Color = .white,
            error: Color = .white,
            onPrimary: Color = .white,
            onSecondary: Color = .white,
            onBackground: Color = .black,
            onSurface: Color = .black,
            onError: Color = .red) {
            self.primary = primary
            self.secondary = secondary
            self.primaryVariant = primaryVariant
            self.secondaryVariant = secondaryVariant
            self.background = background
            self.surface = surface
            self.error = error
            self.onPrimary = onPrimary
            self.onSecondary = onSecondary
            self.onBackground = onBackground
            self.onSurface = onSurface
            self.onError = onError
        }

    }

    public struct Typography {
        public private(set) var h1: Font
        public private(set) var h2: Font
        public private(set) var h3: Font
        public private(set) var h4: Font
        public private(set) var h5: Font
        public private(set) var h6: Font

        public private(set) var subtitle1: Font
        public private(set) var subtitle2: Font

        public private(set) var body1: Font
        public private(set) var body2: Font

        public private(set) var button: Font

        public private(set) var caption: Font
        public private(set) var overline: Font

        public init(
            h1: Font = Font.system(size: 40).weight(.bold),
            h2: Font = Font.system(size: 36).weight(.bold),
            h3: Font = Font.system(size: 32).weight(.bold),
            h4: Font = Font.system(size: 24).weight(.semibold),
            h5: Font = Font.system(size: 20).weight(.semibold),
            h6: Font = Font.system(size: 18).weight(.semibold),
            subtitle1: Font = Font.system(size: 16),
            subtitle2: Font = Font.system(size: 14),
            body1: Font = Font.system(size: 16),
            body2: Font = Font.system(size: 14),
            button: Font = Font.system(size: 16).bold(),
            caption: Font = Font.system(size: 12),
            overline: Font = Font.system(size: 14)) {
            self.h1 = h1
            self.h2 = h2
            self.h3 = h3
            self.h4 = h4
            self.h5 = h5
            self.h6 = h6
            self.subtitle1 = subtitle1
            self.subtitle2 = subtitle2
            self.body1 = body1
            self.body2 = body2
            self.button = button
            self.caption = caption
            self.overline = overline
        }
    }
    
    public init(colorPalette: ColorPalette = ColorPalette(), typography: Typography = Typography()) {
        self.colorPalette = colorPalette
        self.typography = typography
    }
}
