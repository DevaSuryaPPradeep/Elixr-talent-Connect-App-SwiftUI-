//
//  HamburgerMenu.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 30/03/24.
//
import SSSwiftUISideMenu
import SwiftUI


struct HamburgerMenu: View {
    @Binding  var openSideMenu: Bool
    @Binding  var selectedIndex: Int
    var menuItems:[MenuItem]
    
    var body: some View {
        VStack(alignment: .leading, content: {
            ForEach(0 ..< menuItems.count,id: \.self) { item in
                Button{
                    selectedIndex = item
                    openSideMenu.toggle()
                } label: {
                    HStack{
                        Image(systemName: menuItems[item].icon)
                        Text(menuItems[item].title)
                    }
                }
            }
        })
        
    }
}
