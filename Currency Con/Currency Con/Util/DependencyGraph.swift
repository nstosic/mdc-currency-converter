//
//  DependencyGraph.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        // Top level dependencies
        register { NetworkingClientImpl() as NetworkingClient }
        register { APIClientImpl() as APIClient }
        register { CurrencyStorageImpl() as CurrencyStorage }
        
        // Usecases
        register { CurrencyUsecaseImpl() as CurrencyUsecase }
        
        // Presenters
        register { HomePresenterImpl() as HomePresenter }
    }
}
