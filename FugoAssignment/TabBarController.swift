//
//  TabBarController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/24.
//

import UIKit

private enum Tab {

    case type
    case follow

    var title: String {
        switch self {
        case .type: return "產業別"
        case .follow: return "追蹤"
        }
    }

    var controller: UIViewController {
        switch self {
        case .type: return TypeListViewController(viewModel: TypeListViewModel())
        case .follow: return FollowListViewConntroller()
        }
    }

    var image: UIImage {
        switch self {
        case .type: return UIImage(systemName: "building.2") ?? UIImage()
        case .follow: return UIImage(systemName: "star") ?? UIImage()
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .type: return UIImage(systemName: "building.2.fill") ?? UIImage()
        case .follow: return UIImage(systemName: "star.fill") ?? UIImage()
        }
    }
}

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .flipHorizontal
        setupTab()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupTab() {
        let tabs: [Tab] = [.type, .follow]
        var controllers = [UIViewController]()
        tabs.forEach { (tab) in
            let controller = tab.controller
            controller.title = tab.title
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.navigationBar.prefersLargeTitles = true
            let item = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            controller.tabBarItem = item
            controllers.append(navigationController)
        }
        setViewControllers(controllers, animated: false)
    }
}

