//
//  MainTabbarView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//
import SSSwiftUISideMenu
import SwiftUI

struct MainTabbarView: View {
    
    /// State varaible  & variable declarations.
    @State var selectedTab = 0
    @State var openSideMenu :Bool = false
    @State var selectedIndex :Int = 0
    var menuItems = [MenuItem(title: "AboutUs", icon: ""),MenuItem(title: "Settings", icon:  " "),MenuItem(title: "Change Password", icon: ""),MenuItem(title: "Privacy Policy", icon: ""),MenuItem(title: "Terms & Conditions", icon:  " ")]
    @State var menuConfig :SSMenuConfig = SSMenuConfig()
    
    var body: some View {
            ZStack {
                TabView(selection: $selectedTab,
                        content:  {
                    JobDisplayView (openSideMenu: $openSideMenu)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("home")
                        }
                        .tag(1)
                    MyJobs(isOpen: $openSideMenu)
                        .tabItem {
                            Image(systemName: "clipboard.fill")
                            Text("My Jobs")
                        }
                        .tag(1)
                    ProfileView (openSidemenu: $openSideMenu)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("My Profile")
                        }
                })
                .accentColor(Color.elixrOrange)
                
                SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, menuConfig: menuConfig)
                    .navigationBarBackButtonHidden()
            }
    }
}

#Preview {
    MainTabbarView()
}




