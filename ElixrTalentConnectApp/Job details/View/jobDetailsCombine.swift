//
//  jobDetailsCombine.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import SwiftUI

/// View whoch gives a detailed description  to a details for the job.
struct jobDetailsCombine: View {
    
    /// StateObject  &  constant decalrations.
    @Binding var jobInstance :Jobs
    @StateObject var jobDisplayViewModel :JobDisplayViewModel = JobDisplayViewModel()
    @StateObject var jbDetailsVm :jobDetailsVm = jobDetailsVm()
    @State var duplicateEntry :Bool = false
    var body: some View {
        ScrollView{
                jobDetailsHeaderview(jobDetails: jobInstance)
                    .padding()
            VStack(alignment: .leading, content: {
                Section(header: Text("Description")
                    .foregroundStyle(Color.elixrBlue)
                    .padding([.leading,.top], 28)
                    .bold())
                {
                    Text(jobInstance.description)
                        .font(.system(size: 14.0))
                        .padding([.leading,.trailing],30)
                }
                Section(header: Text("Key Responsibilities")
                    .foregroundStyle(Color.elixrBlue)
                    .padding([.leading,.top], 28)
                    .bold()
                ) {
                    Text(jobInstance.responsibilities)
                        .font(.system(size: 14.0))
                        .padding([.leading,.trailing],30)
                }
                Group{
                Section(header: Text("Qualifications")
                    .foregroundStyle(Color.elixrBlue)
                    .padding([.leading,.top], 28)
                    .bold()
                )
                {
                    Text(jobInstance.requirements)
                        .font(.system(size: 14.0))
                        .padding([.leading,.trailing],30)
                }
            }
                })
                VStack(alignment: .center, content: {
                    Button{
                        jbDetailsVm.applyButtonPressed(jobInstance)
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
                    .alert(isPresented: Binding<Bool>(
                        get: { jbDetailsVm.alertOnDuplicateEntry },
                        set: { jbDetailsVm.alertOnDuplicateEntry = $0 }
                    )) {
                        Alert(title: Text("Alert"), message: Text("You have already applied for this same job."), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: Binding<Bool>(
                        get: { jbDetailsVm.alertOnSuccessfulEntry },
                        set: { jbDetailsVm.alertOnSuccessfulEntry = $0 }
                    )) {
                        Alert(title: Text("Alert"), message: Text("Job application Successful."), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
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
                .padding(.top,80)
            Spacer()
        }
//        .navigationBarBackButtonHidden()
////        .toolbar(content: {
////            ToolbarItem (placement: .topBarLeading, content: {
////                Button {
////                    print("dash button pressed.")
////                } label: {
////                     Image(systemName: "list.dash")
////                        .foregroundStyle(Color.black)
////                        .bold()
////                }
////            })
////            ToolbarItem {
////              LogoImage(logoName: "logo 1", width: 65, height: 65)
////                    .padding(.trailing,143)
////            }
////        })
    }
}

/// Struct used inside jobHeaderview - reused to create two fields .
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
//    .toolbar {
//        ToolbarItem(placement: .navigationBarLeading) {
//            Button{
//                print("DashBoard is opened.")
//            }label: {
//                Image(systemName: "list.dash")
//                    .foregroundStyle(Color.black)
//                    .bold()
//            }
//        }
//        ToolbarItem(placement: .navigationBarTrailing) {
//            LogoImage(logoName: "logo 1", width: 70, height: 70)
//                .padding(.trailing,143)
//        }
//    }
