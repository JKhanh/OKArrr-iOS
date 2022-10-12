//
//  OKRDetail.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import SwiftUI

struct OKRDetail: View {
    @State var okr: OKR
    @State private var isPresentingEditView = false
    @State private var dialogPresentation = DialogPresentation()

    var body: some View {
        Form {
            Section(header: Text("Objective")) {
                TextField("Title", text: $okr.objective)
                DatePicker(selection: $okr.startDate, displayedComponents: .date) {
                    Text("Start Date")
                }
                DatePicker(selection: $okr.dueDate, displayedComponents: .date) {
                    Text("End Date")
                }
                Spacer()
                HStack {
                    Slider(value: $okr.progress, in: 0...100) { editting in
                        
                    }
                    Spacer()
                    Text(String(format: "%.0f", okr.progress) + "%")
                }
                TextField("Mentor", text: $okr.mentor)

            }
            Section(header: Text("Key Results")) {
//                ForEach(okr.keyResults, id: \.self) { keyResult in
//                    GeometryReader { geometry in
//                        Text(keyResult.title)
//                    }
//                    .onTapGesture {
//                        DialogPresentation.show(.keyResultDetail(
//                            isPresented: $dialogPresentation.isPresented,
//                            keyResult: keyResult
//                        ))
//                    }
//                }
//                .onDelete{ indices in
//                    //TODO: Delete key result
//                }
                HStack {
                    Spacer()
                    Button(action: {
                        //TODO: Add key result
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}

struct OKRDetail_Previews: PreviewProvider {
    static var previews: some View {
        OKRDetail(okr: OKR(name: "OKR 2", startDate: Date(), dueDate: Date(), reason: "no reason", type: .commit, mentor: "abcdef"))
    }
}
