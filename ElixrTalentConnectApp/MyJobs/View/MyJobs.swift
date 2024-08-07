//
//  MyJobs.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//

import SwiftUI

/// View for MyJobs .
struct MyJobs: View {
    
    /// Declaration of stateobject instance.
    @StateObject var myJobViewModelInstance: MyjobsVM = MyjobsVM()
        
    /// Binding property to trigger th side menu.
    @Binding var isOpen :Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Applied jobs")
                    .font(.title)
                    .bold()
                    .padding(.leading,-130)
                listView
            }
            .onAppear(perform: {
                AnalyticsManager.shared.aboutScreenEvent(ScreenName: .viewIdentifier, params: [.viewInfoName: "MyJobs"])
            })
            .searchable(text:$myJobViewModelInstance.textToSearch,prompt: Text("Type in the job title here"))
            .toolbar (content: {
                ToolbarItem (placement: .topBarLeading, content: {
                    Button{
                        isOpen.toggle()
                        AnalyticsManager.shared.aboutScreenEvent(ScreenName: .viewIdentifier, params: [.viewInfoName : "Hamburgermenu"])
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
       
    }
    
    /// Decides the background color  status view.
    /// - Parameter varaible: Contains data from the response which is of type string.
    /// - Returns: Returns a specific color based on the response.
    func colorSwitcher(_ responseString :String)->Color {
        if responseString ==  "Scheduled" {
            return Color.green
        } else if responseString == "Rejected"  {
            return Color.red
        } else {
            return Color.gray
        }
    }
    
    /// View containg list of applied jobs.
    private var listView: some View {
        List( myJobViewModelInstance.switchDataWithSearch(myJobViewModelInstance.textToSearch)) { value  in
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(style: StrokeStyle())
                .frame(width: 340,height: 200)
                .overlay {
                    VStack(alignment: .center) {
                        Spacer()
                        HStack{
                            Text(value.title)
                                .lineLimit(1)
                                .font(.callout)
                                .bold()
                                .foregroundStyle(Color.elixrBlue)
                                .padding(.leading,2)
                            VStack  {
                                Text(value.status)
                                    .foregroundStyle(Color.white)
                                    .font(.system(size: 12.0))
                                    .bold()
                            }
                            .padding(.all)
                            .background(Color(colorSwitcher(value.status)))
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .frame(width :150, height: 40)
                            .padding(.top,10)
                        }
                        .padding(.top,-10)
                        Spacer()
                        Text(value.location)
                            .font(.system(size: 13.0))
                            .foregroundStyle(Color.gray)
                            .bold()
                            .padding(.horizontal,-100)
                        Spacer()
                        Text(value.description)
                            .lineLimit(10)
                            .foregroundStyle(Color.elixrBlue)
                            .font(.system(size: 10.0))
                            .padding()
                        Spacer()
                    }
                }
        }
    }
}

#Preview {
    MyJobs(isOpen: .constant(false))
}
