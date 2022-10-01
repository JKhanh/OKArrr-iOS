
final class DialogPresentation: ObservableObject {
    @Published var isPresented = false
    @Published var dialogContent: DialogContent?

    func show(_ dialogContent: DialogContent) {
        if let presentDialog = dialogContent {
            dialogContent = presentDialog
            isPresented = true
        } else {
            isPresented = false
        }
    }
}