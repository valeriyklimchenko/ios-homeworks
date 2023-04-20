//
//  InfoViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 20.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        title = "Info"
        
        //Код из документации apple. Не понимаю как вывести сообщение с алертом.
//        Судя по коду и описанию сообщение выведется модально, но как его связать с кнопкой не могу сообразить
//        Еще не понимаю почему заголовок "Info" не отображается
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
        
            
        
    }
}
