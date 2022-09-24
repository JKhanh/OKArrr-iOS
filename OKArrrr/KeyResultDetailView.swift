import SwiftUI

struct KeyResultDetailView: View {
    @State private var keyResult: KeyResult
    @State private var isPresentingEditView = false

    var body: some View {
        Form {
            Section(header: Text("Key Result")) {
                TextField("Title", $keyResult.title)
                Text(keyResult.description)
                Spacer()
                DatePicker(selection: $keyResult.startDate, displayedComponents: .date) {
                    Text("Start Date")
                }
                DatePicker(selection: $keyResult.endDate, displayedComponents: .date) {
                    Text("End Date")
                }
                Spacer()
                HStack {
                    Slider("Progress", value: $keyResult.progress, in: 0...100, step: 1)
                    Spacer()
                    Text("\(keyResult.progress)%")
                }
                TextField("Mentor", $keyResult.mentor)

            }
        }
    }
}