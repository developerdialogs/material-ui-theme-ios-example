import Foundation
import SwiftUI


public enum ButtonType {
    case primary, secondary, tertiary
}

public struct ActionButton: View {
    private let title: String
    private let type: ButtonType
    @EnvironmentObject var theme: MaterialTheme

    public init(title: String, type: ButtonType) {
        self.title = title
        self.type = type
    }

    private var foregroundColor: Color {
        switch type {
        case .primary:
            return theme.colorPalette.onPrimary
        case .secondary:
            return theme.colorPalette.onSecondary
        case .tertiary:
            return theme.colorPalette.onSurface
        }
    }

    private var backgroundColor: Color {
        switch type {
        case .primary:
            return theme.colorPalette.primary
        case .secondary:
            return theme.colorPalette.secondary
        case .tertiary:
            return theme.colorPalette.surface
        }
    }
    
    public var body: some View {
        Button(action: { }) {
            Text(title)
                .font(theme.typography.button)
                .foregroundColor(foregroundColor)
                .frame(width: 150, height: 50.0)
        }
        .background(backgroundColor)
        .cornerRadius(12.0)
    }
}
