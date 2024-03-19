//
//  HomeView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModelInstance =  HomeViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Text("Home view")
                List(viewModelInstance.jobArray) {value in
                    Text(value.title)
                }
                Button{
                    viewModelInstance.postJobs()
                        
                }label: {
                    Text("Post")
                        .foregroundStyle(Color.white)
                        .clipShape(Rectangle())
                        .frame(width: 80,height: 40)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0)))
                }
                Spacer()
            }
            .onAppear{
                viewModelInstance.fetchData()
            }
            .alert(isPresented: $viewModelInstance.alertValue, content: {
                Alert(title: Text("ALert"),message: Text("Sorry can't connect at the  moment.please try again."))
            })
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
