//
//  ViewController.swift
//  YIMenu
//
//  Created by Yi Wang on 7/3/18.
//  Copyright © 2018 Yi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "fb_core_data_bg"))
        return imageView
    }() // () executes the closure

    let iconsContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .red
        containerView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return containerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(bgImageView)
        bgImageView.frame = view.frame

        setupLongPressGuesture()
    }

    /// setup long press gesture
    fileprivate func setupLongPressGuesture() {
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress)))
    }

    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        print("long press detected:", Date())
        if gesture.state == .began {
            view.addSubview(iconsContainerView)
        } else if gesture.state == .ended {
            iconsContainerView.removeFromSuperview()
        }
    }

    // hides status bar
    override var prefersStatusBarHidden: Bool { return true }
}

