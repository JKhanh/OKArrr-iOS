//
//  OKRDetail.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import SwiftUI

struct OKRDetail: View {
    var okr: OKR
    var body: some View {
        VStack(alignment: .leading) {
            Text(okr.name)
            Text(okr.reason)
            Text(okr.dueDateString)
            Text(okr.type.rawValue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct OKRDetail_Previews: PreviewProvider {
    static var previews: some View {
        OKRDetail(okr: OKR(name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit))
    }
}
