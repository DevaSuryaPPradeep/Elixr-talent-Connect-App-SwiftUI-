//
//  TextField.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 07/03/24.
//

import Foundation
import SwiftUI

struct Textfields: View {
    @Binding var bindingVariable:String 
    @State var placeholder:String?
    var body: some View {
        TextField (placeholder ?? "placeHolder", text: $bindingVariable)
    }
}
