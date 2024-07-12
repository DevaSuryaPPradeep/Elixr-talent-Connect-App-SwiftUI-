//
//  MainTabbarView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//
import SSSwiftUISideMenu
import SwiftUI

/// View representing the Tab barview.
struct MainTabbarView: View {
    
    /// State varaible that decides whether the sidemenu should be visible or not .
    @State var openSideMenu :Bool = false
    
    /// State varible indicating the selected index from the sidemenu.
    @State var selectedIndex :Int = 0
    
    /// State variable to configure side menu.
    @State var menuConfig :SSMenuConfig = SSMenuConfig()
    
    /// Variable to store an array of options in the sidemenu.
    var menuItems = [MenuItem(title: "AboutUs", icon: ""),MenuItem(title: "Settings", icon:  " "),MenuItem(title: "Change Password", icon: ""),MenuItem(title: "Privacy Policy", icon: ""),MenuItem(title: "Terms & Conditions", icon:  " ")]
    
    var body: some View {
        ZStack {
            TabView  {
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
                    .tag(2)
                ProfileView (openSidemenu: $openSideMenu)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("My Profile")
                    }
                    .tag(3)
            }
            .accentColor(Color.elixrOrange)
            SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, menuConfig: menuConfig)
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    MainTabbarView()
}




