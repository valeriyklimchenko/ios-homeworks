////
////  ProfileTableHederView.swift
////  Navigation
////
////  Created by Валерий Климченко on 09.06.2023.
////
//
//import UIKit
//
//final class ProfileTableHederView: UIViewController {
//    
//    //MARK: private
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = .cyan
//        
//        tableView.delegate = self
//        
//        return tableView
//    }()
//    
//    //MARK: life cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    private func layout() {
//        view.addSubview(tableView)
//        let safeArea = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
//            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
//            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
//        ])
//        
//    }
//    
//}
//
////MARK: extentios
//extension ProfileTableHederView: UITableViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    }
//}
