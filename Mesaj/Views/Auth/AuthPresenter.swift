import Combine

class AuthPresenter: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var message: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    var authInteractor: AuthInteractor = AuthInteractor() // AuthInteractor'ü oluştur
    
    init() {
        bind()
    }
    
    func bind() {
        $email
            .sink { [weak self] email in
                self?.authInteractor.updateEmail(email)
            }
            .store(in: &cancellables)
        
        $password
            .sink { [weak self] password in
                self?.authInteractor.updatePassword(password)
            }
            .store(in: &cancellables)
    }
    
    func registerButtonTapped() {
        authInteractor.register()
    }
    
    func loginButtonTapped() {
        authInteractor.login()
    }
    
    func showResult(_ result: Result<String, Error>) {
        switch result {
        case .success(let successMessage):
            message = successMessage
        case .failure(let error):
            message = "Error: \(error.localizedDescription)"
        }
    }
}
