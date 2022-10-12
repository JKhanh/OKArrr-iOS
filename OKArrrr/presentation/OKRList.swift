//
//  OKRList.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import SwiftUI
import RxSwift

struct OKRList: View {
    var okrs: [OKR]
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .fill(Color.blue)
                    .edgesIgnoringSafeArea(.all)
                List {
                    ForEach(okrs) {okr in
                        NavigationLink {
                            OKRDetail(okr: okr)
                        } label: {
                            OKRRow(okr: okr)
                        }
                    }
                    .onDelete { index in
                        print("Delete item at \(index)")
                    }
                }
            }
            .navigationTitle("OKR")
        }
    }
}

struct OKRList_Previews: PreviewProvider {
    static var previews: some View {
        OKRList(okrs: [OKR(name: "OKR 1", startDate: Date(), dueDate: Date(), reason: "no reason", type: .insprite, mentor: "Eo can ai"),
                       OKR(name: "OKR 3", startDate: Date(), dueDate: Date(), reason: "no reason", type: .insprite, mentor: "Eo can ai"),
                       OKR(name: "OKR 4", startDate: Date(), dueDate: Date(), reason: "no reason", type: .insprite, mentor: "Eo can ai"),
                       OKR(name: "OKR 2", startDate: Date(), dueDate: Date(), reason: "no reason", type: .insprite, mentor: "Eo can ai")])
    }
}
