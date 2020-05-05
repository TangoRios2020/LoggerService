//
//  StoryboardInitializable.swift
//  RepoSearcher_Coordinator
//
//  Created by tango on 2020/5/5.
//  Copyright © 2020 tangorios. All rights reserved.
//

import RxSwift
import Foundation

protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInitializable where Self: UIViewController {

    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }

    static func initFromStoryboard(name: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}

