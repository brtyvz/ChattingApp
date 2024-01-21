import SwiftUI

struct RegisterView: View {
    @ObservedObject var presenter: AuthPresenter
    
    var body: some View {
        VStack {
            TextField("Email", text: $presenter.email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $presenter.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Register") {
                presenter.registerButtonTapped()
            }
            .padding()
        }
        .padding()
    }
}
