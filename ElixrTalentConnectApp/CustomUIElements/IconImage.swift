//
//  IconImage.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 07/03/24.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @State var imageValue :String?
    var body: some View {
        Image(systemName: imageValue ?? "envelope")
            .foregroundStyle(Color.orange)
    }
}
