//
//  jobDetailsview.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//

import SwiftUI

struct jobDetailsview: View {
    let  jobDetails:Jobs?
    var body: some View {
        Text(jobDetails?.title ?? "hellow")
    }
}

#Preview {
    jobDetailsview(jobDetails :Jobs(id: "1", title: "VFX", department: "Video Editing", postedDate: "22-3-23", deadlineDate: "29-3-23", description: "video and content creations", responsibilities: "content creations & video editing", requirements: "Porfolio", location: "London", salary: "30000", status: "Limited opportunities.") )
}
