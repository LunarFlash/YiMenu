//
//  ViewController.swift
//  YIMenu
//
//  Created by Yi Wang on 7/3/18.
//  Copyright © 2018 Yi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bgImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "fb_core_data_bg"))
        return imageView
    }() // () executes the closure

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(bgImageView)
        bgImageView.frame = view.frame
    }

    // hides status bar
    override var prefersStatusBarHidden: Bool { return true }
}

