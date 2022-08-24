//
//  OKRRow.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import SwiftUI

struct OKRRow: View {
    var okr: OKR
    let dateFormatter = DateFormatter()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(okr.name)
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
        OKRRow(okr: OKR(name: "OKR 1", dueDate: Date(), reason: "no reason", type: .commit))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
