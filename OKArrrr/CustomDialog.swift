
struct CustomDialog: ViewModifier {
    @ObservedObject var presentationManager: DialogPresentation

    
    func body(content: Content) -> some View {
        ZStack {
            content

            if presentationManager.isPresented {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.3))
                    .edgesIgnoringSafeArea(.all)

                presentationManager.dialogContent
                    .padding(32)
            }
        }
    }
}


extension View {
    func customDialog(
        presentationManager: DialogPresentation
    ) -> some View {
        self.modifier(CustomDialog(presentationManager: presentationManager))
    }    
}
