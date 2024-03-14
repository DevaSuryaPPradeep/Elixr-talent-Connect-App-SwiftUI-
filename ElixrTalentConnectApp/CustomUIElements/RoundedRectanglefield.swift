//
//  RoundedRectanglefield.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 14/03/24.
//

import Foundation
import SwiftUI
struct RoundedRectangles: View {
    @Binding var detailValue :String
    let viewmodel :SignUpModel
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(style: StrokeStyle())
                .frame(width: 350,height: 80)
            HStack{
                IconImage(imageValue: viewmodel.iconImage)
                VStack(alignment: .leading, content: {
                    Label(textCaptions: viewmodel.title)
                    Textfields(bindingVariable: $detailValue, placeholder:viewmodel.placeHolder)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                })
            }
            .padding()
        }
    }
}
