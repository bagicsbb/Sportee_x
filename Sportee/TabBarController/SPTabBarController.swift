//
//  SPTabBarController.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class SPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .label
        viewControllers = [ createTeamsNC(), createPlayersNC(), createEventsVC(), createFavoritesVC()]
        
    }
    
    
    func createTeamsNC() -> UINavigationController {
        let teamVC = SPTeamsVC()

        teamVC.title = "Teams"
        teamVC.tabBarItem = UITabBarItem(title: "Teams", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))
        
        return UINavigationController(rootViewController: teamVC)
    }
    
    
    func createPlayersNC() -> UINavigationController {
        let playersVC = SPSearchPlayerVC()
        playersVC.title = "Search Players"
        playersVC.tabBarItem = UITabBarItem(title: "Search Players", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        
        return UINavigationController(rootViewController: playersVC)
    }
    
    func createEventsVC() -> UINavigationController {
        let eventsVC = SPEventsVC()
        eventsVC.title = "Events"
        eventsVC.tabBarItem = UITabBarItem(title: "Events", image: UIImage(systemName: "sportscourt"), selectedImage: UIImage(systemName: "sportscourt.fill"))
        
        return UINavigationController(rootViewController: eventsVC)
    }
    
    func createFavoritesVC() -> UINavigationController {
        let favoritesVC = SPFavoritesVC()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.circle"), selectedImage: UIImage(systemName: "heart.circle.fill"))

        
        return UINavigationController(rootViewController: favoritesVC)
    }

}
