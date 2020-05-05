//
//  AppCooridinator.swift
//  RepoSearcher_Coordinator
//
//  Created by tango on 2020/5/5.
//  Copyright © 2020 tangorios. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let repositoryListCoordinator = RepositoryListCoordinator(window: window)
        return coordinate(to: repositoryListCoordinator)
    }
}
