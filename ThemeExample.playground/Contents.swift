//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ThemeExampleDemo<T: View, U: View, V: View>: View {
    private let headerWithCaptionViewProvider: (Binding<String>, Binding<String>) -> T
    private let contentViewProvider: (Binding<String>, Binding<String>) -> U
    private let primaryButton: V
    private let secondaryButton: V
    private let tertiaryButton: V
    @EnvironmentObject var theme: MaterialTheme

    @State private var headlineTitle = "Theme Example"
    @State private var headlineCaption = "Let's get the themes changing!"
    @State private var contentTitle = "What are Themes"
    @State private var contentText = "Themes let you apply a consistent design scheme to your app. It allows you to customize all design aspects of your project."

    init(
        headerWithCaptionViewProvider: @escaping (Binding<String>, Binding<String>) -> T,
        contentViewProvider: @escaping (Binding<String>, Binding<String>) -> U,
        primaryButton: (String) -> V,
        secondaryButton: (String) -> V,
        tertiaryButton: (String) -> V
    ) {
        self.headerWithCaptionViewProvider = headerWithCaptionViewProvider
        self.contentViewProvider = contentViewProvider
        self.primaryButton = primaryButton("Red Theme")
        self.secondaryButton = secondaryButton("White Theme")
        self.tertiaryButton = tertiaryButton("Switch Dark Mode")
    }

    var body: some View {
        return ZStack {
            VStack {
                headerWithCaptionViewProvider($headlineTitle, $headlineCaption)
                Spacer()
                Image(uiImage: UIImage(named: "image")!)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                    .shadow(color: theme.colorPalette.secondary, radius: 10.0, x: 0, y: 0)

                Spacer()
                HStack(spacing: 16.0) {
                    Spacer()
                    contentViewProvider($contentTitle, $contentText)
                    Spacer()
                }
                HStack(spacing: 16.0) {
                    primaryButton
                    secondaryButton
                }.padding(.top, 24.0)
                tertiaryButton
                    .padding(.top, 12.0)
                Spacer()
            }.padding(.top, 32.0)
        }
    }
}

let defaultTheme = MaterialTheme()

var env = defaultTheme

let view  = ThemeExampleDemo(
    headerWithCaptionViewProvider: { title, caption in
        return HeadlineWithCaption(title: title, caption: caption)
},
    contentViewProvider: { title, text in
        TitleWithText(title: title, text: text)
},
    primaryButton: { title in
        ActionButton(title: title, type: .primary)
},
    secondaryButton: { title in
        ActionButton(title: title, type: .secondary)
},
    tertiaryButton: { title in
        ActionButton(title: title, type: .tertiary)
})
PlaygroundPage.current.liveView = UIHostingController(rootView: view.environmentObject(env))
