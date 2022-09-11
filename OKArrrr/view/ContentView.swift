//
//  ContentView.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        OKRList(
            okrs: [
                OKR(id: 1, name: "OKR 1", dueDate: Date(), reason: "no reason", type: .insprite),
                OKR(id: 2, name: "OKR 3", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 3, name: "OKR 4", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 4, name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 5, name: "OKR 1", dueDate: Date(), reason: "no reason", type: .insprite),
                OKR(id: 6, name: "OKR 3", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 7, name: "OKR 4", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 8, name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 9, name: "OKR 1", dueDate: Date(), reason: "no reason", type: .insprite),
                OKR(id: 10, name: "OKR 3", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 11, name: "OKR 4", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(id: 12, name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit)])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
