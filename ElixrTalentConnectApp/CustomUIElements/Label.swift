//
//  Label.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 07/03/24.
//

import Foundation
import SwiftUI

struct Label: View {
    let textCaptions :String?
    var body: some View {
        Text (textCaptions ??  "textCaptions")
    }
}
