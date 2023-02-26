//
//  ContentView.swift
//  Wordey
//
//  Created by Jimmy Lynch on 2/26/23.
//

import SwiftUI

struct ContentView: View {
    @State var bold: Bool = false
    @State var italic: Bool = false
    @State var strike: Bool = false
    @State var size: Double = 10.0
    @State var color = Color(.sRGB, red: 0.98, green: 0.3, blue: 0.2)
    @State var text: String = ""
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.blue
                    .ignoresSafeArea()
                HStack {
                    Spacer()
                    NavigationLink {
                        SettingsView(bold: $bold, italic: $italic, strike: $strike, size: $size, color: $color)
                    } label: {
                        Image(systemName: "gear")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                }
                .padding(.horizontal, 30)

                VStack(alignment: .center) {
                    TextField(text: $text, prompt: Text("Type text here")) {
                    }
                    .frame(width: 300, height: 60, alignment: .center)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(6)
                    .padding(.top, 60)
                    
                    TextDisplayView(bold: $bold, italic: $italic, strike: $strike, size: $size, color: $color, text: $text)
                        .frame(width: 300, height: 400, alignment: .center)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.top, 60)
                    
                    Text("WORDEY!")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .bold(true)
                        .italic(true)
                        .padding(.top, 60)
                        
                }
               

                
            }
        }
    }
}

struct SettingsView: View {
    @Binding var bold: Bool
    @Binding var italic: Bool
    @Binding var strike: Bool
    @Binding var size: Double
    @Binding var color: Color
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Form {
                    Section {
                        ColorPicker("Font Color", selection: $color)
                    } header: {
                        Text("Font Color")
                    }

                    Section {
                        Toggle(isOn: $bold) {
                            Text("Bold")
                        }
                        
                        Toggle(isOn: $italic) {
                            Text("Italic")
                        }
                        Toggle(isOn: $strike) {
                            Text("Strike")
                        }
                        
                    } header: {
                        Text("Text Decorations")
                    }
                    
                    Section {
                        Slider(value: $size, in: 1...100, step: 1) {
                        } minimumValueLabel: {
                            Text("1")
                        } maximumValueLabel: {
                            Text("100")
                        }
                    } header: {
                        let temp = String(format: "%g", size)
                        Text("Font Size: \(temp)")
                    }
                    
                    Section() {
                        Text("word")
                            .frame(width: 310, height: 260, alignment: .center)
                            .bold(bold)
                            .italic(italic)
                            .strikethrough(strike)
                            .foregroundColor(color)
                            .font(.system(size: size))
                    } header: {
                        Text("Visual")
                    }
                    
                }
            }
        }
        
    }
}

struct TextDisplayView: View {
    @Binding var bold: Bool
    @Binding var italic: Bool
    @Binding var strike: Bool
    @Binding var size: Double
    @Binding var color: Color
    @Binding var text: String
    var body: some View {
        Text("\(text)")
            .bold(bold)
            .italic(italic)
            .strikethrough(strike)
            .foregroundColor(color)
            .font(.system(size: size))

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
