//
//  MesajApp.swift
//  Mesaj
//
//  Created by Berat Yavuz on 20.01.2024.
//

import SwiftUI

@main
struct MesajApp: App {
    var body: some Scene {
        WindowGroup {
            let authPresenter = AuthPresenter()
            let authRouter = AuthRouter(authPresenter: authPresenter)
            authRouter.loginView
        }
    }
}

