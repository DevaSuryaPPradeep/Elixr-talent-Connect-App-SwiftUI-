//
//  HomeView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import SwiftUI

/// View for homeView.
struct HomeView: View {
    /// Declarationof state property and State object instance.
    @StateObject var viewModelInstance =  HomeViewModel()
    @State var textToSearch: String = ""
    @State var selectedTab = 0
    /// Array for the list.- swiftches between the original array and filetered array.
    var filteredArray :[Jobs] {
        if textToSearch.isEmpty {
            return viewModelInstance.jobArray
        } else {
            return viewModelInstance.jobArray.filter { jobDetails in
                textToSearch.split(separator: " ").allSatisfy { Substring in
                    jobDetails.title.lowercased().contains(textToSearch.lowercased())
                }
            }
        }
    }
    
    var body: some View {
            NavigationStack {
                List(filteredArray) { value in
                    JobRow(job: value)
                }
                .searchable(text: $textToSearch, prompt: "Enter the job title here.")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            print("DashBoard is opened.")
                        }label: {
                            Image(systemName: "list.dash")
                                .foregroundStyle(Color.black)
                                .bold()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        LogoImage(logoName: "logo 1", width: 70, height: 70)
                            .padding(.trailing,143)
                    }
                }
                .navigationBarBackButtonHidden()
              //  .navigationDestination(for: <#T##Hashable.Protocol#>, destination: <#T##(Hashable) -> View#>)
            .onAppear {
                viewModelInstance.fetchData()
            }
            .alert(isPresented: $viewModelInstance.alertValue) {
                Alert(title: Text("Alert"), message: Text("Sorry, can't connect at the moment. Please try again.")
                    .bold())
            }
        }
        
    }
        
}

/// Each individual job Details Structure , this is being reused in the list.
struct JobRow: View {
    
    /// Constants and State property decalarations.
    let job: Jobs
    @State  var isFavourite = false
    @StateObject var vmInstance = HomeViewModel()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(style: StrokeStyle())
                .frame(width: 310,height: 200)
                .overlay {
                    VStack(alignment: .center) {
                        Spacer()
                        HStack{
                            Spacer()
                            Text(job.title)
                                .font(.callout)
                                .bold()
                                .foregroundStyle(Color.elixrBlue)
                                .padding(.leading,2)
                            Spacer()
                            Button {
                                vmInstance.isFavouriteButtonTapped(jobID: job.id)
                                vmInstance.fetchData()
                            } label: {
                                if UserDefaults.standard.bool(forKey: job.id){
                                    Image("heartButton")
                                }
                                else
                                {
                                    Image("heart")
                                }}
                            .buttonStyle(.plain)
                            Spacer()
                            VStack{
                                Text("Application Deadline")
                                    .font(.system(size: 10.0))
                                    .bold()
                                    .padding(.leading,-8)
                                if let formattedDate  = vmInstance.dateFormatter(dateString: job.deadlineDate)  {
                                    Text(formattedDate)
                                        .font(.system(size: 10.0))
                                }
                            }
                            .padding(.all)
                            .foregroundStyle(Color.gray)
                            .background(Color("lightTheme"))
                            .clipShape(RoundedRectangle(cornerRadius: 30.0))
                            Spacer()
                        }
                        Spacer()
                        Text(job.location)
                            .padding(.leading,-120)
                            .font(.system(size: 15.0))
                            .bold()
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text(job.description)
                            .foregroundStyle(Color.elixrBlue)
                            .font(.system(size: 15.0))
                            .padding(.leading,10)
                        Spacer()
                    }
                }
                .background(Color.elixrlightGray)
        }
    }
}
#Preview {
    HomeView()
}

