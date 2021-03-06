//
//  SelectDetailViewController.swift
//  Constellation

import UIKit
import FSPagerView
import NVActivityIndicatorView

class SelectDetailViewController: UIViewController {

    //MARK: - IBOulet
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var constellationImage: UIImageView!
    @IBOutlet weak var fsPagerView: FSPagerView!
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var detailLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var detailLabel2: UILabel!
    @IBOutlet weak var titleLabel3: UILabel!
    @IBOutlet weak var detailLabel3: UILabel!
    @IBOutlet weak var titleLabel4: UILabel!
    @IBOutlet weak var detailLabel4: UILabel!
    @IBOutlet weak var titleLabel5: UILabel!
    @IBOutlet weak var detailLabel5: UILabel!
    @IBOutlet weak var titleLabel6: UILabel!
    @IBOutlet weak var detailLabel6: UILabel!
    @IBOutlet weak var titleLabel7: UILabel!
    @IBOutlet weak var detailLabel7: UILabel!
    @IBOutlet weak var titleLabel8: UILabel!
    @IBOutlet weak var detailLabel8: UILabel!
    @IBOutlet weak var titleLabel9: UILabel!
    @IBOutlet weak var detailLabel9: UILabel!
    @IBOutlet weak var titleLabel10: UILabel!
    @IBOutlet weak var detailLabel10: UILabel!
    @IBOutlet weak var titleLabel11: UILabel!
    @IBOutlet weak var detailLabel11: UILabel!
    
    //MARK: - properties
    var present: SelectDetailPresentProtocal?
    var dayType: [DayType] = [.today, .tomorrow, .week, .month, .year]
    
    //MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPagerView()
        present?.viewDidLoad()
    }
    
    //MARK: - set up UI
    private func setPagerView() {        
        fsPagerView.register(UINib(nibName: "DayTypePagerViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        fsPagerView.dataSource = self
        fsPagerView.delegate = self
        fsPagerView.isInfinite = true
        fsPagerView.isScrollEnabled = true
        fsPagerView.transformer = FSPagerViewTransformer(type: .linear)
        let width = UIScreen.main.bounds.width / 3.5
        fsPagerView.itemSize = CGSize(width: width, height: fsPagerView.frame.height)
    }
    
}

extension SelectDetailViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return dayType.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index) as? DayTypePagerViewCell else {
            fatalError()
        }
        var title = ""
        switch dayType[index] {
        case .today:
            title = "??????"
            case .tomorrow:
                title = "??????"
            case .week:
                title = "??????"
            case .month:
                title = "??????"
            case .year:
                title = "??????"
        }
        cell.titleLabel.text = title
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        fsPagerView.scrollToItem(at: index, animated: true)
        present?.selectDayType(dayType[index])
    }
    
}

extension SelectDetailViewController: SelectDetailViewProtocal {
    
    func showChartData(_ horoscope: Horoscope) {
        switch horoscope.dayType {
        case .today:
            titleLabel1.text = "?????????"
            detailLabel1.text = horoscope.name
            titleLabel2.text = "?????????"
            detailLabel2.text = horoscope.datetime
            titleLabel3.text = "???????????????"
            detailLabel3.text = "\(horoscope.all) %"
            titleLabel4.text = "????????????"
            detailLabel4.text = horoscope.color
            titleLabel5.text = "???????????????"
            detailLabel5.text = "\(horoscope.health) %"
            titleLabel6.text = "???????????????"
            detailLabel6.text = "\(horoscope.love) %"
            titleLabel7.text = "???????????????"
            detailLabel7.text = "\(horoscope.money) %"
            titleLabel8.text = "???????????????"
            detailLabel8.text = "\(horoscope.number)"
            titleLabel9.text = "???????????????"
            detailLabel9.text = horoscope.qFriend
            titleLabel10.text = "???????????????"
            detailLabel10.text = "\(horoscope.work) %"
            titleLabel11.text = "???????????????"
            detailLabel11.text = horoscope.summary
        case .tomorrow:
            titleLabel1.text = "?????????"
            detailLabel1.text = horoscope.name
            titleLabel2.text = "?????????"
            detailLabel2.text = horoscope.datetime
            titleLabel3.text = "???????????????"
            detailLabel3.text = "\(horoscope.all) %"
            titleLabel4.text = "????????????"
            detailLabel4.text = horoscope.color
            titleLabel5.text = "???????????????"
            detailLabel5.text = "\(horoscope.health) %"
            titleLabel6.text = "???????????????"
            detailLabel6.text = "\(horoscope.love) %"
            titleLabel7.text = "???????????????"
            detailLabel7.text = "\(horoscope.money) %"
            titleLabel8.text = "???????????????"
            detailLabel8.text = "\(horoscope.number)"
            titleLabel9.text = "???????????????"
            detailLabel9.text = horoscope.qFriend
            titleLabel10.text = "???????????????"
            detailLabel10.text = "\(horoscope.work) %"
            titleLabel11.text = "???????????????"
            detailLabel11.text = horoscope.summary
        case .week:
            titleLabel1.text = "?????????"
            detailLabel1.text = horoscope.name
            titleLabel2.text = "?????????"
            detailLabel2.text = horoscope.date
            titleLabel3.text = "?????????"
            detailLabel3.text = "\(horoscope.weekth)"
            titleLabel4.text = "?????????"
            detailLabel4.text = horoscope.work
            titleLabel5.text = "?????????"
            detailLabel5.text = "\(horoscope.job)"
            titleLabel6.text = "?????????"
            detailLabel6.text = "\(horoscope.love)"
            titleLabel7.text = "?????????"
            detailLabel7.text = "\(horoscope.money)"
            titleLabel8.text = ""
            detailLabel8.text = ""
            titleLabel9.text = ""
            detailLabel9.text = ""
            titleLabel10.text = ""
            detailLabel10.text = ""
            titleLabel11.text = ""
            detailLabel11.text = ""
        case .month:
            titleLabel1.text = "?????????"
            detailLabel1.text = horoscope.name
            titleLabel2.text = "?????????"
            detailLabel2.text = horoscope.date
            titleLabel3.text = "?????????"
            detailLabel3.text = "\(horoscope.month)???"
            titleLabel4.text = "?????????"
            detailLabel4.text = horoscope.health
            titleLabel5.text = "?????????"
            detailLabel5.text = "\(horoscope.money)"
            titleLabel6.text = "?????????"
            detailLabel6.text = "\(horoscope.love)"
            titleLabel7.text = "?????????"
            detailLabel7.text = "\(horoscope.work)"
            titleLabel8.text = "????????????"
            detailLabel8.text = "\(horoscope.all)"
            titleLabel9.text = ""
            detailLabel9.text = ""
            titleLabel10.text = ""
            detailLabel10.text = ""
            titleLabel11.text = ""
            detailLabel11.text = ""
        case .year:
            titleLabel1.text = "?????????"
            detailLabel1.text = horoscope.name
            titleLabel2.text = "?????????"
            detailLabel2.text = horoscope.date
            titleLabel3.text = "?????????"
            detailLabel3.text = "\(horoscope.career)"
            titleLabel4.text = "?????????"
            detailLabel4.text = horoscope.love
            titleLabel5.text = "?????????"
            detailLabel5.text = "\(horoscope.health)"
            titleLabel6.text = "?????????"
            detailLabel6.text = "\(horoscope.finance)"
            titleLabel7.text = "???????????????"
            detailLabel7.text = "\(horoscope.mima?.info ?? "")"
            titleLabel8.text = "?????????????????????"
            detailLabel8.text = "\(horoscope.mima?.text.first ?? "")"
            titleLabel9.text = ""
            detailLabel9.text = ""
            titleLabel10.text = ""
            detailLabel10.text = ""
            titleLabel11.text = ""
            detailLabel11.text = ""
        }
    }

    func activityStart() {
        activityIndicatorView.startAnimating()
    }
    
    func activityStop() {
        activityIndicatorView.stopAnimating()
    }
 
}
