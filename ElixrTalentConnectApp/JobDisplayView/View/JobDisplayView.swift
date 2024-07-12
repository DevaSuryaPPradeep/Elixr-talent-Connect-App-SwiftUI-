//
//  JobDisplayView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//
//import SSSwiftUISideMenu
import SwiftUI

/// View for JobDisplayView.
struct JobDisplayView: View {
    
    /// Declaration of state property and State object instance.
    @StateObject var viewModelInstance =  JobDisplayViewModel()
    
    /// State variable to hold the word in the search bar.
    @State var textToSearch: String = ""
    
    /// State variable to hold a bool value that determines the navigation to adjacent view.
    @State var isPresented :Bool = false
    
    /// State variable to hold the value of type job that is passed along with navigaion to each job details view..
    @State  private var selectedJob :Jobs = Jobs(id: "", title: "", department: "", postedDate: "", deadlineDate: "", description: "", responsibilities: "", requirements: "", location: "", salary: "", status: "" )
    
    /// State variable to show an alert when the view is appeared.
    @State var showAlert: Bool = true
    
    /// Binding varible that decides the functioning of the sidemenu.
    @Binding var openSideMenu :Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                viewHeading
                jobRow
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                viewModelInstance.fetchData()
            }
            .toolbar(content: {
                ToolbarItem (placement: .topBarLeading, content: {
                    Button{
                        openSideMenu.toggle()
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
            .alert(isPresented: $viewModelInstance.alertValue) {
                Alert(title: Text("Alert"), message: Text("Sorry, can't connect at the moment. Please try again.")
                    .bold())
            }
            .confirmationDialog("Choose your experience level", isPresented: $showAlert,titleVisibility: .visible) {
                Button("Fresher") {
                    AnalyticsManager.shared.userExperienceLevelProperty(experienceLevel: "Fresher")
                    showAlert.toggle()
                }
                Button("Intermediate") {
                    AnalyticsManager.shared.userExperienceLevelProperty(experienceLevel: "Intermediate")
                    showAlert.toggle()
                }
                Button("Experienced") {
                    AnalyticsManager.shared.userExperienceLevelProperty(experienceLevel: "Experienced")
                    showAlert.toggle()
                }
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
        List(viewModelInstance.searchFunctionality(textToSearch)) { value in
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
                                AnalyticsManager.shared.addFavouriteJobEvent(favouriteJobId: .favouriteJobInfo, params: [.favouriteJob_key : value.title])
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
                .onTapGesture {
                    isPresented.toggle()
                    selectedJob = value
                    AnalyticsManager.shared.userJobInteresetEvent(jobInterest: "selected_kob", params: ["job_viewed" : "\(selectedJob.title)"])
                }
        }
        .searchable(text: $textToSearch, placement: .navigationBarDrawer(displayMode: .always), prompt: "Enter the job title here.")
        .navigationDestination(isPresented: $isPresented) {
            JobDetailsView(jobInstance: $selectedJob, jobDisplayViewModel:  viewModelInstance)
        }
    }
    
    /// View representing searchBar
    private var searchBar: some View {
        Textfields(bindingVariable: $viewModelInstance.searchValue,placeholder: "Search your job here...")
    }
}

#Preview {
    JobDisplayView( openSideMenu: .constant(false))
}

