//
//  IconImage.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 07/03/24.
//

import Foundation
import SwiftUI

struct IconImage: View {
     var imageValue :String?
    var body: some View {
        Image(systemName: imageValue ?? "envelope")
            .foregroundStyle(Color.orange)
    }
}
