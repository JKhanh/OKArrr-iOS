import SwiftUI

struct KeyResultDetailView: View {
    @State var keyResult: KeyResult
    @State var isPresentingEditView = false

    var body: some View {
        Form {
            Section(header: Text("Key Result")) {
                TextField("Title", text: $keyResult.title)
                Spacer()
                DatePicker(selection: $keyResult.startDate, displayedComponents: .date) {
                    Text("Start Date")
                }
                DatePicker(selection: $keyResult.dueDate, displayedComponents: .date) {
                    Text("End Date")
                }
                Spacer()
                HStack {
                    Slider(value: $keyResult.progress, in: 0...100)
                    Spacer()
                    Text("\(keyResult.progress)%")
                }
                TextField("Mentor", text: $keyResult.mentor)

            }
        }
    }
}
