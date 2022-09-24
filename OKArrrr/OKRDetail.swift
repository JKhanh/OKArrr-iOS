//
//  OKRDetail.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import SwiftUI

struct OKRDetail: View {
    @State private var okr: OKR
    @State private var isPresentingEditView = false
    @State private var DialogPresentation = DialogPresentation()

    var body: some View {
        Form {
            Section(header: Text("Objective")) {
                TextField("Title", $okr.objective)
                Text(okr.description)
                Spacer()
                DatePicker(selection: $okr.startDate, displayedComponents: .date) {
                    Text("Start Date")
                }
                DatePicker(selection: $okr.endDate, displayedComponents: .date) {
                    Text("End Date")
                }
                Spacer()
                HStack {
                    Slider("Progress", value: $okr.progress, in: 0...100, step: 1)
                    Spacer()
                    Text("\(okr.progress)%")
                }
                TextField("Mentor", $okr.mentor)

            }
            Section(header: Text("Key Results")) {
                ForEach(okr.keyResults, id: \.self) { keyResult in
                    GeometryReader { geometry in
                        Text(keyResult)
                    }
                    .onTapGesture {
                        DialogPresentation.show(.keyResultDetail(
                            isPresented: $DialogPresentation.isPresented,
                            keyResult: keyResult
                        ))
                    }
                }
                .onDelete{ indices in 
                    //TODO: Delete key result
                }
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

struct OKRDetail_Previews: PreviewProvider {
    static var previews: some View {
        OKRDetail(okr: OKR(name: "OKR 2", dueDate: Date(), reason: "no reason", type: .commit))
    }
}
