//
//  LikeVC.swift
//  Universe Says
//
//  Created by Vitaliy 
//  Copyright © 2020 Vitaliy. All rights reserved.
//

import UIKit

class LikeVC: UIViewController {
    
    @IBOutlet weak var staticHeadLabelLikeVC: UILabel!
    @IBOutlet weak var secondStaticHeadLeabelLikeVC: UILabel!
    
    // labelText для изменения label на LikeVC
    var labelText: String?
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = labelText
    }
}
