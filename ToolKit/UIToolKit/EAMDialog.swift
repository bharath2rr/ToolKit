//
//  EAMDialog.swift
//  SwiftUIDesign
//
//  Created by PASUPULETI Ramakrishna S (Kiran) on 22/05/24.
//

import SwiftUI

class EAMDialog {
   
    static func showDialog(title: String, message: String) {
        presentDialog(title: title, message: message)
    }
    
    static func showConfirmationDialog(title: String, message: String, confirmButtonTitle: String? = "Confirm" ,confirmAction: @escaping () -> Void?, cancelAction: (() -> Void)? = nil) {
        let confirm = UIAlertAction(title: confirmButtonTitle, style: .default) { _ in
            confirmAction()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            cancelAction?()
        }
        presentDialog(title: title, message: message, actions: [confirm, cancel])
    }
    
    static func showErrorDialog(message: String) {
        presentDialog(title: "Error", message: message)
    }
    
    static func showAlertMessage(message: String, duration: TimeInterval? = 4) {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let window = windowScene.windows.first else { return }
        
        let alertView = UIView()
        alertView.backgroundColor = EAMTheme.eamColors.onSurface.toUIColor()
        alertView.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = message
        label.textColor = EAMTheme.eamColors.surface.toUIColor()
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        label.numberOfLines = 0 // Allow multiple lines
        label.lineBreakMode = .byWordWrapping // Word wrapping
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - ( isPhone ? 50 : 80) // Adjust for margins
        
        alertView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: alertView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -15)
        ])
        
        window.addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            alertView.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: -100) // Adjust this constant to position the alert
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration!) {
            alertView.removeFromSuperview()
        }
    }
    
    static func presentDialog(title: String, message: String, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default, handler: nil)]) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let window = windowScene.windows.first(where: \.isKeyWindow) else { return }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { action in
            action.setValue(EAMTheme.eamColors.primary.toUIColor(), forKey: "titleTextColor")
            alert.addAction(action)
        }
        
        // Find the top-most view controller
        if let rootViewController = window.rootViewController {
            var topController = rootViewController
            while let presented = topController.presentedViewController {
                topController = presented
            }
            topController.present(alert, animated: true, completion: nil)
        }
    }
    
    // Function to create and present an action sheet with specified actions
    static func createAndPresentActionSheet(navigationItem: UINavigationItem, viewController: UIViewController,  withActions actions: [(title: String, handler: () -> Void)]) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        // Add each action to the alert controller
        for action in actions {
            let alertAction = UIAlertAction(title: action.title, style: .default) { _ in
                action.handler() // Call the handler passed in
            }
            alertAction.setValue(EAMTheme.eamColors.primary.toUIColor(), forKey: "titleTextColor")
            alertController.addAction(alertAction)
        }

        // Add cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        // For iPad, configure popover presentation
        if let popoverController = alertController.popoverPresentationController {
            popoverController.barButtonItem = navigationItem.rightBarButtonItem
            popoverController.permittedArrowDirections = .up
        }

        // Present the alert controller
        viewController.present(alertController, animated: true, completion: nil)
    }

    
}
