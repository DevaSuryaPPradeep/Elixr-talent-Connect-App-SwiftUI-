//
//  MainTabbarView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//

import SwiftUI

struct MainTabbarView: View {
    @State var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("home")
                }
                .tag(0)
            MyJobs()
                .tabItem {
                    Image(systemName: "clipboard.fill")
                    Text("My Jobs")
                }
                .tag(1)
            MyProfile()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("My Profile")
                }
            
        })
        .accentColor(Color.elixrOrange)
    }
}
#Preview {
    MainTabbarView()
}




