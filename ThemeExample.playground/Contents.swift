//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ThemeExampleDemo: View {
    @EnvironmentObject var theme: MaterialTheme
    @State var headlineTitle = "Theme Example"
    @State private var headlineCaption = "Let's get the themes changing!"

    @State private var contentTitle = "What are Themes"
    @State private var contentText = "Themes let you apply a consistent design scheme to your app. It allows you to customize all design aspects of your project."
    var body: some View {
        return ZStack {
            VStack {
                HeadlineWithCaption(title: $headlineTitle, caption: $headlineCaption)
                Spacer()
                Image(uiImage: UIImage(named: "image")!)
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                    .shadow(color: theme.colorPalette.secondary, radius: 10.0, x: 0, y: 0)
                Spacer()
                HStack(spacing: 16.0) {
                    Spacer()
                    TitleWithText(title: $contentTitle, text: $contentText)
                    Spacer()
                }
                
                HStack(spacing: 16.0) {
                    ActionButton(title: "Primary", type: .primary)
                    ActionButton(title: "Secondary", type: .secondary)
                }.padding(.top, 24.0)
                
                ActionButton(title: "Link", type: .tertiary)
                    .padding(.top, 12.0)
                
                Spacer()
            }.padding(.top, 32.0)
        }
    }
}



let defaultTheme = MaterialTheme()

var env = defaultTheme

let view  = ThemeExampleDemo().environmentObject(env)
PlaygroundPage.current.liveView = UIHostingController(rootView: view)



//let redColorPalette = MaterialTheme.ColorPalette(
//    primary: .red,
//    secondary: .red,
//    primaryVariant: .red,
//    secondaryVariant: .red,
//    background: .red,
//    onSecondary: .black,
//    onBackground: .red,
//    onSurface: .red)
//
//let redTypography = MaterialTheme.Typography(
//    h1: Font.system(size: 40).italic(),
//    h2: Font.system(size: 36).italic(),
//    h3: Font.system(size: 32).italic(),
//    h4: Font.system(size: 24).italiTc(),
//    h5: Font.system(size: 20).italic(),
//    h6: Font.system(size: 18).italic())
//var currentTheme = "black"
//Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
//    if currentTheme == "red" {
//        currentTheme = "black"
//        env.colorPalette = MaterialTheme.ColorPalette()
//        env.typography = MaterialTheme.Typography()
//    } else {
//        currentTheme = "red"
//        env.colorPalette = redColorPalette
//        env.typography = redTypography
//    }
//}
