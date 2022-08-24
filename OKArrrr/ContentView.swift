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
                OKR(name: "OKR 1", dueDate: Date(), reason: "no reason", type: .insprite),
               OKR(name: "OKR 3", dueDate: Date(), reason: "no reason", type: .commit),
               OKR(name: "OKR 4", dueDate: Date(), reason: "no reason", type: .commit),
               OKR(name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(name: "OKR 1", dueDate: Date(), reason: "no reason", type: .insprite),
               OKR(name: "OKR 3", dueDate: Date(), reason: "no reason", type: .commit),
               OKR(name: "OKR 4", dueDate: Date(), reason: "no reason", type: .commit),
               OKR(name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit),
                OKR(name: "OKR 1", dueDate: Date(), reason: "no reason", type: .insprite),
               OKR(name: "OKR 3", dueDate: Date(), reason: "no reason", type: .commit),
               OKR(name: "OKR 4", dueDate: Date(), reason: "no reason", type: .commit),
               OKR(name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit)])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
