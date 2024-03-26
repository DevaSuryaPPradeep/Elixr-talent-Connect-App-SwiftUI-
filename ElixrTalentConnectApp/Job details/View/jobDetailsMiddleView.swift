//
//  jobDetailsMiddleView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import SwiftUI

struct jobDetailsMiddleView: View {
    let jobInfo :Jobs
    // let mainheading :String
    let textDescription :String
    var body: some View {
        VStack{
            Text(textDescription)
                .foregroundStyle(Color.elixrBlue)
                .font(.system(size: 15.0))
                .padding(.trailing,50)
                .frame(width: 350,height: 100)
        }
        .foregroundStyle(Color.elixrBlue)
    }
}
//
//#Preview {
//    jobDetailsMiddleView(jobInfo: Jobs(id: "1", title: "title", department: "tilte", postedDate: "String", deadlineDate: "String", description: "String", responsibilities: "String,go to gym ,go to work,kdjsafbkjbfdksajbklnfldnasklnfjfbdkasjbfkjdskfjbdajklf", requirements: "String", location: "String", salary: "string", status: "String"), mainheading: "Key Responsibilities")
//}
