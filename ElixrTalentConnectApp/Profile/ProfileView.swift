//
//  ProfileView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 04/04/24.
//

import SwiftUI

/// View representing the profile of the user.
struct ProfileView: View {
    
    /// State varible to track user selection.
    @State var isSelected: Bool = false
    
    /// Binding property to trigger a sidemenu.
    @Binding var openSidemenu: Bool
    
    var body: some View {
        ScrollView {
            headerView
                .padding()
            Section{
                resumeUploader
            } header: {
                Text("Resume")
                    .padding(.trailing,280)
                    .font(.callout)
                    .bold()
                    .foregroundStyle(Color.elixrBlue)
                Button{
                    
                }label: {
                    Image(systemName: "pencil")
                        .foregroundStyle(Color.black)
                        .bold()
                        .padding(.leading,300)
                }
            }
            Section{
                personalDetails
            } header: {
                Text("Personal Details")
                    .lineLimit(1)
                    .padding(.trailing,205)
                    .font(.callout)
                    .bold()
                    .foregroundStyle(Color.elixrBlue)
            }
            Section{
                keySkillsView
            } header: {
                Text("Key Skills Area")
                    .padding(.trailing,220)
                    .font(.callout)
                    .bold()
                    .foregroundStyle(Color.elixrBlue)
            }
        }
        .onAppear(perform: {
            AnalyticsManager.shared.aboutScreenEvent(ScreenName: .viewIdentifier,params: [.viewInfoName : "ProfileView"])
        })
        .toolbar(content: {
            ToolbarItem (placement: .topBarLeading, content: {
                Button{
                    openSidemenu.toggle()
                } label: {
                    Image(systemName: "list.dash")
                        .foregroundStyle(Color.black)
                        .bold()
                }
            })
            ToolbarItem(placement: .navigationBarTrailing) {
                LogoImage(logoName: "logo 1", width: 70, height: 70)
                    .padding(.trailing,240)
            }
        })
        
    }
    
    /// HeaderView for the profile View.
    private var headerView:some View {
        ZStack{
            Image("BackgroundImage")
                .resizable()
                .frame(width: 340,height: 220)
                .opacity(0.8)
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: 340,height: 220)
                .foregroundColor(Color.gray)
                .opacity(0.3)
            VStack{
                Image("candidateImage")
                    .resizable()
                    .frame(width: 90,height: 90)
                    .clipShape(Circle())
                    .overlay {
                        Image(systemName: "camera.circle.fill")
                            .resizable()
                            .foregroundStyle(Color.black)
                            .opacity(0.6)
                            .frame(width: 20,height: 20)
                            .padding([.bottom,.leading],60)
                    }
                Group{
                    Text("Bobby Bradeley")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text("Data Analyst")
                        .font(.caption2)
                    Text("680-683")
                        .font(.caption2)
                }
                .foregroundStyle(Color.elixrBlue)
                Button {
                    print("Button Pressed")
                }label: {
                    Text("Edit Profile")
                        .foregroundStyle(Color.white)
                        .font(.caption)
                        .bold()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .frame(width: 90,height: 20)
                        .background(Color.elixrOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                }
            }
        }
    }
    
    /// Resume UploaderView for the profile view
    private var resumeUploader:some View {
        Group {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.gray)
                .opacity(0.3)
                .frame(width: 340,height: 100)
                .padding()
                .overlay {
                    HStack{
                        Image(systemName: "folder.fill")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .padding(.leading,50)
                        VStack{
                            Text("Bobby Bradeley")
                                .font(.caption)
                                .fontWeight(.bold)
                            Text("5th January 2024")
                                .font(.caption2)
                                .padding(.leading,3)
                        }
                        Spacer()
                        Button{
                            
                        } label: {
                            Group {
                                Image(systemName: "pencil")
                                    .foregroundStyle(Color.white)
                                Text("Update")
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .bold()
                            }
                        }
                        .frame(width: 90,height: 25)
                        .background(Color.elixrOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        Spacer()
                    }
                }
        }
    }
    
    /// Personal details view of the user.
    private var personalDetails :some View {
        Group {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: 340,height: 140)
                .foregroundStyle(Color.gray)
                .opacity(0.3)
                .overlay {
                    VStack{
                        Spacer()
                        Group{
                            Label(textCaptions: "Date of Birth")
                                .font(.caption)
                                .foregroundStyle(Color.gray)
                            Label(textCaptions: "10-04-1985")
                                .font(.caption2)
                                .foregroundStyle(Color.elixrBlue)
                        }
                        .padding(.leading,-150)
                        .bold()
                        Spacer()
                        Group{
                            Label(textCaptions:"Address")
                                .font(.caption)
                                .foregroundStyle(Color.gray)
                                .bold()
                                .padding(.trailing,250)
                            Label(textCaptions: "1234,Sample street,City name,State Name")
                                .lineLimit(1)
                                .font(.caption2)
                                .foregroundStyle(Color.elixrBlue)
                                .padding(.trailing,75)
                            Spacer()
                            Label(textCaptions: "Pin Code:123456,India")
                                .font(.caption)
                                .padding(.trailing,170)
                        }
                        .bold()
                        Spacer()
                    }
                }
        }
    }
    
    /// Keyskills View fotr the users
    private var keySkillsView:some View {
        Group {
            Buttonview(isSelected: $isSelected, buttonText: "Statistical Analytics", frameWidth: 160, frameHeight: 20)
            Spacer()
        }
    }
}
#Preview {
    ProfileView( openSidemenu: .constant(false))
}

/// Custom buttons to mark keyskills for the users
struct Buttonview: View {
    @Binding var isSelected: Bool
    let buttonText :String
    let frameWidth :CGFloat
    let frameHeight :CGFloat
    var body: some View {
        HStack {
            Button {
                isSelected.toggle()
            } label: {
                Text(buttonText)
                    .font(.caption)
                    .bold()
                    .padding()
            }
            .foregroundStyle(isSelected ? Color.white : Color.elixrBlue)
            .frame(width: frameWidth,height: frameHeight)
            .background(isSelected ? Color.elixrBlue :Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
        }
    }
}
