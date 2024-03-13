//
//  LogoImage.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import Foundation
import SwiftUI

struct LogoImage: View {
    let logoName :String
    let width :CGFloat
    let height :CGFloat
    var body: some View {
        Image("Logo 1")
            .resizable()
            .scaledToFit()
            .frame(width: width,height: height)
    }
}
