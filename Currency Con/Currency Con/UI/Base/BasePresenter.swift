//
//  BasePresenter.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 30/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import RxSwift

protocol BasePresenter: class {
    var disposeBag: DisposeBag { get }
}
