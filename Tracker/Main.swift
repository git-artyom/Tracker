//
//  ViewController.swift
//  Tracker
//
//  Created by Артем Чебатуров on 22.11.2023.
//

import UIKit

class MainScreen: UITabBarController, UISearchBarDelegate { // UIViewController
    
    private let labelOnCenter = UILabel()
    private let dateLabel = UILabel()
    private let trackersLabel = UILabel()
    private let searchBar = UISearchBar()
    
    private let imageOnCenter : UIImageView = {
        let profileImage = UIImageView(image: UIImage(named: "star"))
        return profileImage }()
    
    private let addButton: UIButton = {
        let image = UIImage(named: "plus")
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.accessibilityIdentifier = "plus"
        return button
    }()
    
    let trackerViewController = UIViewController()
    let statisticViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        addViews()
        addTabbar()
        updateDateLabel()
        addSearch()
    }
    
}

extension MainScreen {
    
    private func addViews() {
        
        view.addSubview(addButton)
        addButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dateLabel)
        dateLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 77).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchBar)
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 136).isActive = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(trackersLabel)
        trackersLabel.text = "Трекеры"
        trackersLabel.font = .systemFont(ofSize: 34, weight: .bold)
//        trackersLabel.heightAnchor.constraint(equalToConstant: 41).isActive = true
//        trackersLabel.widthAnchor.constraint(equalToConstant: 254).isActive = true
        trackersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 88).isActive = true
        trackersLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        trackersLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageOnCenter)
        imageOnCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageOnCenter.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageOnCenter.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageOnCenter.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageOnCenter.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelOnCenter)
        labelOnCenter.text = "Что будем отслеживать?"
        labelOnCenter.font = .systemFont(ofSize: 18)
        labelOnCenter.topAnchor.constraint(equalTo: imageOnCenter.bottomAnchor, constant:  8).isActive = true
        labelOnCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelOnCenter.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}

extension MainScreen {
    
    private func updateDateLabel() {
        
        // Настройка отображения даты
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        
        // Получаем текущую дату
        let currentDate = Date()
        
        // Форматируем дату и устанавливаем ее в текст лейбла
        dateLabel.text = dateFormatter.string(from: currentDate)
        
        dateLabel.backgroundColor = UIColor(named: "backgroundGray")
        dateLabel.layer.cornerRadius = 10  // Радиус закругления в пикселях
        dateLabel.clipsToBounds = true     // Обрезать контент, выходящий за пределы радиуса закругления
        
        dateLabel.font = .systemFont(ofSize: 17)
        dateLabel.textAlignment = .center // расположение текста по центру фоновой рамки
        
    }
    
}

extension MainScreen {
    
    private func addTabbar() {
        // создаем два вью контроллера для добавления в таббар
        trackerViewController.view.backgroundColor = .white
        trackerViewController.tabBarItem = UITabBarItem(title: "Трекер", image: UIImage(named: "record.circle.fill"), tag: 0)
        
        statisticViewController.view.backgroundColor = .white
        statisticViewController.tabBarItem = UITabBarItem(title: "Статистика", image: UIImage(named:"hare.fill"), tag: 1)
        
        // Устанавливаем дочерние ViewController'ы в массив viewController'ов
        viewControllers = [trackerViewController, statisticViewController]
        
        // добавляем серую полоску разделителя над таббаром
        let separatorLine = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1))
        separatorLine.backgroundColor = UIColor(named: "YpGray")
        tabBar.addSubview(separatorLine)
        tabBar.clipsToBounds = true
    }
    
}

extension MainScreen {
    
    // Настройка поисковой строки
    private func addSearch() {
        
        // Устанавливаем делегата для управления действиями поисковой строки
        searchBar.delegate = self
        // Текст-плейсхолдер, отображаемый внутри строки поиска
        searchBar.placeholder = "Поиск"  // Текст-плейсхолдер, отображаемый внутри строки поиска
        // Добавление поисковой строки на экран
        self.navigationItem.titleView = searchBar
        // Отключение настраиваемой полосы для строки поиска
        searchBar.barTintColor = .clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)

    }
    
}
