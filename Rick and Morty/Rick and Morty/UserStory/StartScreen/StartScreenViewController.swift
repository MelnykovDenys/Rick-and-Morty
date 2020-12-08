//
//  StartScreenViewController.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import UIKit

final class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let window = UIApplication.shared.windows.first 
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let rootViewController = UINavigationController(rootViewController: CharactersListViewController())
            window?.rootViewController = rootViewController
        }
    }
    
    private func setupLayout() {
        let imageView = UIImageView()
        view.addSubview(imageView)
        imageView.image = UIImage(named: Constants.launchImage)
        imageView.frame = view.frame
    }
}
