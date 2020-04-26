import Foundation
import SwiftUI

public struct HeadlineWithCaption: View {
    @Binding var title: String
    @Binding var caption: String
    @EnvironmentObject var theme: MaterialTheme

    public init(title: Binding<String>, caption: Binding<String>) {
        _title = title
        _caption = caption
    }

    public var body: some View {
        return VStack {
            Text(title)
                .font(theme.typography.h1)
                .foregroundColor(theme.colorPalette.onBackground)
            Text(caption)
                .font(theme.typography.subtitle1)
                .foregroundColor(theme.colorPalette.onBackground)
        }
    }
}
