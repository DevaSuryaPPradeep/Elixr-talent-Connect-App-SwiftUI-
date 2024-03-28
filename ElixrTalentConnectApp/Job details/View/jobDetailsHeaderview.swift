//
//  jobDetailsview.swift
//  ElixrTalentConnectApp

//  Created by Devasurya on 25/03/24.
//

import SwiftUI

/// Header view extracted for the jobdetailsCombineView,
struct jobDetailsHeaderview: View {
    let  jobDetails:Jobs
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .frame(width: 390,height: 260)
                
                Image("BackgroundImage")
                    .resizable()
                    .opacity(0.5)
                    .frame(width: 390,height: 260)
                Spacer()
                VStack{
                    Image("candidateImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100)
                        .clipShape(Circle())
                    Text(jobDetails.title)
                        .font(.headline)
                        .fontDesign(.rounded)
                        .padding(.top,-5)
                        .foregroundStyle(Color.elixrBlue)
                    HStack{
                        Spacer()
                        DetailsRow(jobInfo: jobDetails.title, textValue: "Type")
                        Divider().frame(width: 5,height: 50)
                        DetailsRow(jobInfo: "Associate", textValue: "Level")
                            .padding(.horizontal,40)
                        Divider().frame(width: 5,height: 50)
                        DetailsRow(jobInfo: jobDetails.location, textValue: "Location")
                        Spacer()
                    }
                    .padding(.horizontal,-160)
                }
            }
        }
        .foregroundStyle(Color.elixrBlue)
        
    }
}

//
//#Preview {
//    jobDetailsHeaderview(jobDetails :Jobs(id: "1", title: "VFX Editor", department: "Video Editing", postedDate: "22-3-23", deadlineDate: "29-3-23", description: "Videoandndsfkndlasknflkndslkfndfdl;mf;ldsam;dflma;slaflm;asdmf;lamsd;flmads;knfdklknfdlknasd conlkfnlkdtent creations", responsibilities: "content creations & video editing", requirements: "Porfolio", location: "London", salary: "30000", status: "Limited opportunities.") )
//}


