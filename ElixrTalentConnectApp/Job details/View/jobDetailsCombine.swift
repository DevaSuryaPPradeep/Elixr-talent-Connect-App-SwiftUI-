//
//  jobDetailsCombine.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import SwiftUI

struct jobDetailsCombine: View {
    let jobInstance:Jobs
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                jobDetailsHeaderview(jobDetails: jobInstance)
                Spacer()
                Section(header: Text("Description")
                    .foregroundStyle(Color.elixrBlue)
                    .bold()
                    .padding(.trailing,240)) {
                        Text(jobInstance.description)
                            .frame(height: 100)

                    }
                Spacer()
                Section(header: Text("Key Responsibilities")
                    .foregroundStyle(Color.elixrBlue)
                    .bold()
                    .padding(.trailing,180)) {
                        Text(jobInstance.responsibilities)
                            .padding(.trailing,165)
                            .frame(height: 100)
                    }
                Spacer()
                Section(header: Text("Qualifications")
                    .foregroundStyle(Color.elixrBlue)
                    .bold()
                    .padding(.trailing,230))
                {
                    Text(jobInstance.requirements)
                        .padding(.leading,20)
                        .frame(height: 100)

                    
                }
                Spacer()
                UserInteractiveArea(jobIDInfo: jobInstance)
            }
        }
    }
}

#Preview {
    jobDetailsCombine(jobInstance :Jobs(id: "1", title: "VFX Editor", department: "Video Editinbbjkbkjbkjbkkbkjbkjbkjbkjg", postedDate: "22-3-23", deadlineDate: "29-3-23", description: "Video and content crj j j kjhvhvljhvhjvjhvjhvjvhjhvjhvjvjhvvjhvjhveations", responsibilities: "contenmf dam lk fal;k", requirements: "Pdmlkmsflkmdaklmslkmflkdmslfkmdkmflsakmmafldskmdslaorfolio", location: "London", salary: "30000", status: "Limited opportunities.") )
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
