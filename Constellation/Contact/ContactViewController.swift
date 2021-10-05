//
//  ContactViewController.swift
//  Constellation

import UIKit
import MessageUI

class ContactViewController: UIViewController {

    //MARK: - IBOulet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emalButton: UIButton!
    @IBOutlet weak var detailLabel: UILabel!
    
    //MARK: - properties
    var present: ContactPresentProtocal?
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactWireFrame.createModule(vc: self)
        present?.viewDidLoad()
    }
    
    @IBAction func emailAction(_ sender: UIButton) {
        sendEmail()
    }
    
}

extension ContactViewController: ContactViewProtocal {
    
    func showLabel(name: String, email: String, detail: String) {
        nameLabel.text = name
        emalButton.setTitle(email, for: .normal)
        emalButton.titleLabel?.minimumScaleFactor = 0.5
        emalButton.titleLabel?.adjustsFontSizeToFitWidth = true
        detailLabel.text = detail
    }
    
}

extension ContactViewController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        let email = "htrwxvbd3322@protonmail.com"
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            present(mail, animated: true)
        } else {
            print("無法開啟")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
