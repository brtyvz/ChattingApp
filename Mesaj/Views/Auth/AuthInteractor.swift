import FirebaseAuth
import Combine

class AuthInteractor {
    private var cancellables: Set<AnyCancellable> = []
    var presenter: AuthPresenter?
    var email: String = ""
    var password: String = ""
    
    func updateEmail(_ email: String) {
        self.email = email
    }
    
    func updatePassword(_ password: String) {
        self.password = password
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.presenter?.showResult(.failure(error))
            } else if let _ = authResult?.user {
                self?.presenter?.showResult(.success("Registration successful!"))
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.presenter?.showResult(.failure(error))
            } else if let _ = authResult?.user {
                self?.presenter?.showResult(.success("Login successful!"))
            }
        }
    }
}

