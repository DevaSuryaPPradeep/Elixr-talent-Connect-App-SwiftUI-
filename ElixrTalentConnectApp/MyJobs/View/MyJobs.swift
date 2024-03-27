//
//  MyJobs.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//

import SwiftUI

struct MyJobs: View {
    @StateObject var myJobViewModelInstance = MyjobsVM()
    var body: some View {
        
        List(myJobViewModelInstance.dataSource,id: \.self) { value  in
            Text(value.title)
        }
        .onAppear{
            myJobViewModelInstance.getDataFromSafe()
        }
        
    }
}

#Preview {
    MyJobs()
}
