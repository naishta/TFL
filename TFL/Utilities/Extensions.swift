import SwiftUI

extension View {
    func errorAlert(error: Binding<Error?>) -> some View {
        return alert(isPresented: .constant(error.wrappedValue != nil)) {
            Alert(title: Text("Error"),
                  message:  Text((error.wrappedValue as? LocalizedError)?.errorDescription ?? ""))
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
