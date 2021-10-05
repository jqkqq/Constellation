//
//  SetViewController.swift
//  Constellation

import UIKit
import SCLAlertView

class SetViewController: UIViewController {

    //MARK: - IBOulet
    @IBOutlet weak var setTableView: UITableView!
    
    //MARK: - properties
    var present: SetPresentProtocal?
    var data: [UserSet] = []
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        SetWireFrame.createModule(vc: self)
        setupTableView()
        present?.viewDidLoad()
    }

    //MARK: - set up UI
    private func setupTableView() {
        setTableView.dataSource = self
        setTableView.delegate = self
        setTableView.register(UINib(nibName: "SetTableViewCell", bundle: nil), forCellReuseIdentifier: "SetCell")
        setTableView.tableFooterView = UIView()
    }
    
}

extension SetViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SetCell") as? SetTableViewCell else {
            fatalError()
        }
        let userData = data[indexPath.row]
        cell.update(userData)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present?.selectUserSet(userSet: data[indexPath.row], vc: self)
    }
}

extension SetViewController: SetViewProtocal {
    
    func showAlert() {
        SCLAlertView().showInfo("关于我们", subTitle: "2020 Ashton Constellation")
    }
    
    func showVersion() {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return }
        NotificationBannerView.show(title: "版本号：", subtitle: appVersion)
    }
        
    func getUserSet(data: [UserSet]) {
        self.data = data
    }

    func tableReload() {
        setTableView.reloadData()
    }

}
