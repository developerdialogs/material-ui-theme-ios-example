import Foundation
import SwiftUI

public struct TitleWithText: View {
    @Binding var title: String
    @Binding var text: String
    @EnvironmentObject var theme: MaterialTheme

    public init(title: Binding<String>, text: Binding<String>) {
        _title = title
        _text = text
    }

    public var body: some View {
        VStack {
            Text(title)
                .font(theme.typography.h5)
                .foregroundColor(theme.colorPalette.onBackground)
            Text(text)
                .font(theme.typography.body1)
                .foregroundColor(theme.colorPalette.onBackground)
                .multilineTextAlignment(.center)
        }
    }
}
