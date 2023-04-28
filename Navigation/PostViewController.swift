import UIKit

class PostviewController: UIViewController {
        
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
//            Передаем объект типа Post из FeedViewController в PostviewController
            let feedTitle = FeedViewController().postTitle.title
            title = feedTitle
            
            view.backgroundColor = .systemCyan
            
            //    Создаем BarButtonItem (Кнопка справа в данном случае)
            let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(self.showInfo))
            navigationItem.rightBarButtonItem = infoButton
        }
    
    //infoButton содержит обработчик нажатия на себя. При нажатии на кнопку сработает метод ButtonPressed и вызовется нижеуказанный код
        
        @objc func  showInfo() {
            
            //При обработке нажатия создается экземпляр класса ProfileViewController()
            let InfoViewController = InfoViewController()
            
            //Далее запускается его модальное отображение (как подпроцесс)
            InfoViewController.modalTransitionStyle = .coverVertical
            InfoViewController.modalPresentationStyle = .formSheet
            
            //Для перехода используется метод present
            present(InfoViewController, animated: true)
            
        }
}
