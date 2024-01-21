import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: AuthPresenter
    
    var body: some View {
        VStack {
            TextField("Email", text: $presenter.email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $presenter.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Login") {
                presenter.loginButtonTapped()
            }
            .padding()
        }
        .padding()
    }
}
