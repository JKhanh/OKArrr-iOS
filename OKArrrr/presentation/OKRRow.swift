//
//  OKRRow.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import SwiftUI

struct OKRRow: View {
    var okr: OKR
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(okr.objective)
                .bold()
                .font(.system(size:25))
            Text(okr.reason)
            HStack {
                Text(okr.dueDateString)
                Spacer()
                Text(okr.type.rawValue)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct OKRRow_Previews: PreviewProvider {
    static var previews: some View {
        OKRRow(okr: OKR(name: "OKR 1", startDate: Date(), dueDate: Date(), reason: "no reason", type: .insprite, mentor: "Eo can ai"))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
