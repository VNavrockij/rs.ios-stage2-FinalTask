//
//  ViewController.swift
//  Universe Says
//
//  Created by Vitaliy
//  Copyright © 2020 Vitaliy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var forShadowsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func sharedButton(_ sender: UIButton) {
         //Кнопка поделиться
         let activityVC = UIActivityViewController(activityItems: [titleLabel.text!], applicationActivities: nil)
         activityVC.popoverPresentationController?.sourceView = self.view
         
         self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func likedButton(_ sender: UIButton) {
        // Запускаем segue на LikeVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let index = UserDefaults.standard.integer(forKey: Constants.stringIndexKey)
        let string = stringArray[index]
        titleLabel.text = string
        
        forShadowsView.makeShadow()
    }
    
    
    
    //MARK: Передача данных на второй VC
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let dvc = segue.destination as? LikeVC else { return }
        dvc.labelText = titleLabel.text
    }
    
}
    // MARK: Тени центральной view
extension UIView {
    func makeShadow() {
        self.layer.backgroundColor = CGColor(srgbRed: 0.8, green: 0.8, blue: 0.9, alpha: 1)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .init(width: 3, height: 3)
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
    }
}
