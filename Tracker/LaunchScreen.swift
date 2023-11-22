//
//  ViewController.swift
//  Tracker
//
//  Created by Артем Чебатуров on 22.11.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    private let launchScreenLogo : UIImageView = {
        let profileImage = UIImageView(image: UIImage(named: "launchScreenLogo"))
        return profileImage }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "YpBlue")

        addViews()

    }

}

extension LaunchScreenViewController {
    
    // метод для добавления и настройки изображения на экран загрузки
    private func  addViews() {
        
        view.addSubview(launchScreenLogo)
        launchScreenLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        launchScreenLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        launchScreenLogo.heightAnchor.constraint(equalToConstant: 94).isActive = true
        launchScreenLogo.widthAnchor.constraint(equalToConstant: 91).isActive = true
        launchScreenLogo.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
