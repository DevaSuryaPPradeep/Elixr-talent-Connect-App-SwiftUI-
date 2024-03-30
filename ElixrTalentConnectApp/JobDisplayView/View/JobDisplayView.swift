//
//  JobDisplayView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import SwiftUI
import SideMenu


/// View for homeView.
struct JobDisplayView: View {
    
    /// Declarationof state property and State object instance.
    @StateObject var viewModelInstance =  JobDisplayViewModel()
    @State var textToSearch: String = ""
    @State var isPresented :Bool = false
    @State private var isMenuOpen = false
    @State  private var selectedJob :Jobs = Jobs(id: "", title: "", department: "", postedDate: "", deadlineDate: "", description: "", responsibilities: "", requirements: "", location: "", salary: "", status: "" )
    
    var body: some View {
        NavigationStack {
            VStack {
                viewHeading
                jobRow
                    .searchable(text: $textToSearch, placement: .navigationBarDrawer(displayMode: .always), prompt: "Enter the job title here.")
                    .navigationDestination(isPresented: $isPresented) {
                        jobDetailsCombine(jobInstance: $selectedJob)
                    }
            }
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
            .onAppear {
                viewModelInstance.fetchData()
            }
            .alert(isPresented: $viewModelInstance.alertValue) {
                Alert(title: Text("Alert"), message: Text("Sorry, can't connect at the moment. Please try again.")
                    .bold())
            }
        }
    }
    
    /// Heading view for the jobList view.
    private var viewHeading :some View {
        Text("Recomented Jobs")
            .font(.title)
            .bold()
            .padding(.trailing, 60)
            .padding(.top, 5)
    }
    
    /// List inside job list view.
    private var jobRow :some View {
        List(viewModelInstance.fetchData(textToSearch)) { value in
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(style: StrokeStyle())
                    .frame(width: 340,height: 200)
                    .overlay {
                        VStack(alignment: .center) {
                            Spacer()
                            HStack{
                                Spacer()
                                Text(value.title)
                                    .lineLimit(1)
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(Color.elixrBlue)
                                    .padding(.leading,2)
                                Spacer()
                                Button {
                                    viewModelInstance.isFavouriteButtonTapped(jobID: value.id)
                                    viewModelInstance.fetchData()
                                } label: {
                                    value.isFavouriteBool ? Image (systemName: "heart.fill")
                                        .foregroundStyle(Color.red)
                                    : Image(systemName: "heart")
                                        .foregroundStyle(Color.black)
                                }
                                .buttonStyle(.plain)
                                Spacer()
                                VStack{
                                    Text("Application Deadline")
                                        .font(.system(size: 10.0))
                                        .bold()
                                        .padding(.leading,-8)
                                    if let formattedDate  = viewModelInstance.dateFormatter(dateString: value.deadlineDate)  {
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
                            Text(value.location)
                                .padding(.leading,-120)
                                .font(.system(size: 15.0))
                                .bold()
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text(value.description)
                                .foregroundStyle(Color.elixrBlue)
                                .font(.system(size: 13.0))
                                .padding(.leading,10)
                            Spacer()
                        }
                    }
                    .background(Color.elixrlightGray)
            }
            .onTapGesture {
                isPresented.toggle()
                selectedJob = value
            }
        }
    }
}



#Preview {
    JobDisplayView()
}

