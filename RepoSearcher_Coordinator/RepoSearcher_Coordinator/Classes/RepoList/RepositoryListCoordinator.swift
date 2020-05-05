//
//  RepositoryListCoordinator.swift
//  RepoSearcher_Coordinator
//
//  Created by tango on 2020/5/5.
//  Copyright © 2020 tangorios. All rights reserved.
//

import UIKit
import RxSwift
import SafariServices

class RepositoryListCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let viewModel = RepositoryListViewModel(initialLanguage: "Swift")
        let viewController = RepositoryListViewController.initFromStoryboard(name: "Main")
        let navigationController = UINavigationController(rootViewController: viewController)

        viewController.viewModel = viewModel

        viewModel.showRepository
            .subscribe(onNext: { [weak self] in self?.showRepository(by: $0, in: navigationController) })
            .disposed(by: disposeBag)

        viewModel.showLanguageList
            .flatMap { [weak self] _ -> Observable<String?> in
                guard let `self` = self else { return .empty() }
                return self.showLanguageList(on: viewController)
            }
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: viewModel.setCurrentLanguage)
            .disposed(by: disposeBag)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return Observable.never()
    }

    private func showRepository(by url: URL, in navigationController: UINavigationController) {
        let safariViewController = SFSafariViewController(url: url)
        navigationController.pushViewController(safariViewController, animated: true)
    }

    private func showLanguageList(on rootViewController: UIViewController) -> Observable<String?> {
        // TODO:
        return Observable.never()
    }
}

