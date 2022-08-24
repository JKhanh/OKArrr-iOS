//
//  NavigationConfigurator.swift
//  OKArrrr
//
//  Created by Khanh jonas on 24/08/2022.
//

import Foundation
import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = {_ in }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}
