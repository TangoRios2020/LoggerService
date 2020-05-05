//
//  RepositoryViewModel.swift
//  RepoSearcher_Coordinator
//
//  Created by tango on 2020/5/5.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

class RepositoryViewModel {
    let name: String
    let description: String
    let starsCountText: String
    let url: URL

    init(repository: Repository) {
        self.name = repository.fullName
        self.description = repository.description
        self.starsCountText = "⭐️ \(repository.starsCount)"
        self.url = URL(string: repository.url)!
    }
}
