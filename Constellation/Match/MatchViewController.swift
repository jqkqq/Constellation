//
//  MatchViewController.swift
//  Constellation

import UIKit
import NVActivityIndicatorView

import SCLAlertView

class MatchViewController: UIViewController {
    
    //MARK: - IBOulet
    @IBOutlet weak var detailStackView: UIStackView!
    @IBOutlet weak var boyButton: UIButton!
    @IBOutlet weak var wonmenButton: UIButton!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var matchNumberLabel: UILabel!
    @IBOutlet weak var matchProportionLabel: UILabel!
    @IBOutlet weak var loveNumberLabel: UILabel!
    @IBOutlet weak var foreverNumberLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    //MARK: - properties
    var present: MatchPresentProtocal?
    var selectData: [Constellation] = []
    var myPickerView = MyPickerView()
    var men = ""
    var wonmen = ""

    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        MatchWireFrame.createModule(viewController: self)
        present?.viewDidLoad()        
    }
    
    //MARK: - set up UI
    private func setPickerView() {
        myPickerView.removeFromSuperview()
        myPickerView.delegate = self
        myPickerView.myPickerView.dataSource = self
        myPickerView.myPickerView.delegate = self
        myPickerView.addTo(view: view)
    }
    
    
    //MARK: - IBAction
    @IBAction func selectManAction(_ sender: UIButton) {
        present?.selectMan()
        setPickerView()
    }
    
    @IBAction func selectWonmen(_ sender: UIButton) {
        present?.selectWonmen()
        setPickerView()
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
        detailStackView.isHidden = true
        present?.sendData()
    }
}

extension MatchViewController: MatchViewProtocal {
    
    func alert() {
        SCLAlertView().showError("错误", subTitle: "请选择男生或女生星座")
    }
    
    func showDetail(_ data: Match) {
        detailStackView.isHidden = false
        matchNumberLabel.text = data.result.zhishu
        matchProportionLabel.text = data.result.bizhong
        loveNumberLabel.text = data.result.xiangyue
        foreverNumberLabel.text = data.result.tcdj
        infoLabel.text = data.result.jieguo
        detailLabel.text = data.result.zhuyi
    }
    
    func setBoyButtonTitle(title: String) {
        boyButton.setTitle(title, for: .normal)
    }
    
    func setGirlButtonTitle(title: String) {
        wonmenButton.setTitle(title, for: .normal)
    }
    
    
    func setData(_ data: [Constellation]) {
        selectData = data
        detailStackView.isHidden = true
    }
    
    func activityStart() {
        activityIndicatorView.startAnimating()
    }
    
    func activityStop() {
        activityIndicatorView.stopAnimating()
    }
}

extension MatchViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectData[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        present?.selectConstellation(selectData[row].changeTwoWord())
    }
    
}

extension MatchViewController: MyPickerViewDelegate {
    func check() {
        present?.checkConstellation()
        myPickerView.removeFromSuperview()
    }
}
