//
//  TextFieldWithTitle.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import Foundation
import SwiftUI
struct TextFieldWithTitle :View
{
    let title :String
    @Binding var text :String
           
    var body :some View {
        VStack(alignment: .leading,spacing :8) { 
            Text(title)
            Textfields(bindingVariable: $text, placeholder: "hellow")
        }
    }
}
