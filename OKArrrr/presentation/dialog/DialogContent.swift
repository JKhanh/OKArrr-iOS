import SwiftUI

enum DialogContent: View {
    case keyResultDialog(isPresented: Binding<Bool>, keyResult: KeyResult)

    var body : some View {
        switch self {
        case .keyResultDialog(let isPresented, let keyResult):
            return AnyView(
                KeyResultDetailView(keyResult: keyResult, isPresentingEditView: isPresented.wrappedValue)
            )
        }
    }
}
