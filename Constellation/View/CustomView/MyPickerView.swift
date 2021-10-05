//
//  MyPickerView.swift

import UIKit

class MyPickerView: UIView {
    
    //MARK: - IBOulet
    @IBOutlet weak var myPickerView: UIPickerView!
    
    //MARK: - properties
    weak var delegate: MyPickerViewDelegate?
    
    //MARK: - view init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    //MARK: - set up UI
    func setUp() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MyPickerView", bundle: bundle)
        guard let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError()
        }
        addSubview(nibView)
        nibView.translatesAutoresizingMaskIntoConstraints = false
        nibView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nibView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nibView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        nibView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    //MARK: - functions
    func addTo(view: UIView) {
        self.frame = CGRect(x: view.frame.size.width * 0.1 , y: view.frame.size.height, width: view.frame.size.width * 0.8, height: view.frame.size.height * 0.5)
        view.addSubview(self)
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect(x: (view.frame.size.width - self.frame.width) / 2, y: (view.frame.size.height - self.frame.height) / 2 , width: view.frame.size.width * 0.8, height: view.frame.size.height * 0.5)
        }
    }

    //MARK: - IBAction
    @IBAction func checkAction(_ sender: UIButton) {
        delegate?.check()
    }
}

protocol MyPickerViewDelegate: class {
    func check()
}
