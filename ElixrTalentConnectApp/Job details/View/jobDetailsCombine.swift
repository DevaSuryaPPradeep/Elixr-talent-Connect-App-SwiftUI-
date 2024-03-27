//
//  jobDetailsCombine.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import SwiftUI

struct jobDetailsCombine: View {
    
    /// StateObject  &  constant decalrations.
    @Binding var jobInstance :Jobs
    @StateObject var jobDisplayViewModel :JobDisplayViewModel = JobDisplayViewModel()
  //  @StateObject var jbDetailsVm :jobDetailsVm = jobDetailsVm()
    
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                jobDetailsHeaderview(jobDetails: jobInstance)
                    .padding()
                Spacer()
                VStack(alignment: .leading, content: {
                    Section(header: Text("Description")
                        .foregroundStyle(Color.elixrBlue)
                        .bold()
                    )
                    {
                        Text(jobInstance.description)
                            .frame(width: 350)
                    }
                    Spacer()
                    Section(header: Text("Key Responsibilities")
                        .foregroundStyle(Color.elixrBlue)
                        .bold()
                    ) {
                        Text(jobInstance.responsibilities)
                    }
                    Spacer()
                    Section(header: Text("Qualifications")
                        .foregroundStyle(Color.elixrBlue)
                        .bold()
                    )
                    {
                        Text(jobInstance.requirements)
                    }
                    Spacer()
                    
                })
                
                VStack(alignment: .center, content: {
                    Button{
                      //  jbDetailsVm.applyButtonPressed(jobInstance)
                        print("jobApplied")
                    } label: {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.elixrOrange)
                            .frame(width: 120,height: 30)
                            .overlay {
                                Text("Apply for Job")
                                    .foregroundStyle(Color.white)
                                    .bold()
                                    .font(.system(size: 15.0))
                            }
                    }
                    HStack{
                        Text("Save for later")
                            .font(.system(size: 13.0))
                        Button {
                            jobInstance.isFavouriteBool = true
                            print("jobinstance --> \(jobInstance.isFavouriteBool)")
                            jobDisplayViewModel.fetchData()
                        } label: {
                            jobInstance.isFavouriteBool ? 
                            Image( "heartButton") : Image(systemName: "heart")
                        }
                    }
                })
            }
        }
    }
}

struct DetailsRow: View {
    
    let jobInfo :String
    let textValue :String
    var body: some View {
        VStack(alignment: .leading
               , content: {
            Text(textValue)
                .bold()
            Text(jobInfo)
                .font(.subheadline)
        })
    }
}
