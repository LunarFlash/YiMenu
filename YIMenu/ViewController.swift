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
        if gesture.state == .began {
            handleGestureBegan(gesture)
        } else if gesture.state == .ended {
            iconsContainerView.removeFromSuperview()
        }
    }

    fileprivate func handleGestureBegan(_ gesture: UILongPressGestureRecognizer) {
        view.addSubview(iconsContainerView)

        let pressedLocation = gesture.location(in: view)

        // transformation of the box
        let centerX = (view.frame.width - iconsContainerView.frame.width) / 2
        iconsContainerView.transform = CGAffineTransform(translationX: centerX, y: pressedLocation.y)

        // alpha
        iconsContainerView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseOut, animations: {
                        self.iconsContainerView.alpha = 1
                        self.iconsContainerView.transform = CGAffineTransform(translationX: centerX, y: pressedLocation.y - self.iconsContainerView.frame.height)
        })
    }

    // hides status bar
    override var prefersStatusBarHidden: Bool { return true }
}

