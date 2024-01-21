import SwiftUI

class AuthRouter {
    var registerView: some View {
        RegisterView(presenter: authPresenter)
    }
    
    var loginView: some View {
        LoginView(presenter: authPresenter)
    }
    
    private var authPresenter: AuthPresenter
    
    init(authPresenter: AuthPresenter) {
        self.authPresenter = authPresenter
    }
}
