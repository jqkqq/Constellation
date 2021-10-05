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
            title = "今日"
            case .tomorrow:
                title = "明日"
            case .week:
                title = "本周"
            case .month:
                title = "本月"
            case .year:
                title = "今年"
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
            titleLabel1.text = "星座："
            detailLabel1.text = horoscope.name
            titleLabel2.text = "日期："
            detailLabel2.text = horoscope.datetime
            titleLabel3.text = "综合指数："
            detailLabel3.text = "\(horoscope.all) %"
            titleLabel4.text = "幸运色："
            detailLabel4.text = horoscope.color
            titleLabel5.text = "健康指数："
            detailLabel5.text = "\(horoscope.health) %"
            titleLabel6.text = "爱情指数："
            detailLabel6.text = "\(horoscope.love) %"
            titleLabel7.text = "财运指数："
            detailLabel7.text = "\(horoscope.money) %"
            titleLabel8.text = "幸运数字："
            detailLabel8.text = "\(horoscope.number)"
            titleLabel9.text = "速配星座："
            detailLabel9.text = horoscope.qFriend
            titleLabel10.text = "工作指数："
            detailLabel10.text = "\(horoscope.work) %"
            titleLabel11.text = "今日概述："
            detailLabel11.text = horoscope.summary
        case .tomorrow:
            titleLabel1.text = "星座："
            detailLabel1.text = horoscope.name
            titleLabel2.text = "日期："
            detailLabel2.text = horoscope.datetime
            titleLabel3.text = "综合指数："
            detailLabel3.text = "\(horoscope.all) %"
            titleLabel4.text = "幸运色："
            detailLabel4.text = horoscope.color
            titleLabel5.text = "健康指数："
            detailLabel5.text = "\(horoscope.health) %"
            titleLabel6.text = "爱情指数："
            detailLabel6.text = "\(horoscope.love) %"
            titleLabel7.text = "财运指数："
            detailLabel7.text = "\(horoscope.money) %"
            titleLabel8.text = "幸运数字："
            detailLabel8.text = "\(horoscope.number)"
            titleLabel9.text = "速配星座："
            detailLabel9.text = horoscope.qFriend
            titleLabel10.text = "工作指数："
            detailLabel10.text = "\(horoscope.work) %"
            titleLabel11.text = "明日概述："
            detailLabel11.text = horoscope.summary
        case .week:
            titleLabel1.text = "星座："
            detailLabel1.text = horoscope.name
            titleLabel2.text = "日期："
            detailLabel2.text = horoscope.date
            titleLabel3.text = "周数："
            detailLabel3.text = "\(horoscope.weekth)"
            titleLabel4.text = "工作："
            detailLabel4.text = horoscope.work
            titleLabel5.text = "求职："
            detailLabel5.text = "\(horoscope.job)"
            titleLabel6.text = "爱情："
            detailLabel6.text = "\(horoscope.love)"
            titleLabel7.text = "财运："
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
            titleLabel1.text = "星座："
            detailLabel1.text = horoscope.name
            titleLabel2.text = "日期："
            detailLabel2.text = horoscope.date
            titleLabel3.text = "月数："
            detailLabel3.text = "\(horoscope.month)月"
            titleLabel4.text = "健康："
            detailLabel4.text = horoscope.health
            titleLabel5.text = "财运："
            detailLabel5.text = "\(horoscope.money)"
            titleLabel6.text = "爱情："
            detailLabel6.text = "\(horoscope.love)"
            titleLabel7.text = "工作："
            detailLabel7.text = "\(horoscope.work)"
            titleLabel8.text = "总运势："
            detailLabel8.text = "\(horoscope.all)"
            titleLabel9.text = ""
            detailLabel9.text = ""
            titleLabel10.text = ""
            detailLabel10.text = ""
            titleLabel11.text = ""
            detailLabel11.text = ""
        case .year:
            titleLabel1.text = "星座："
            detailLabel1.text = horoscope.name
            titleLabel2.text = "年份："
            detailLabel2.text = horoscope.date
            titleLabel3.text = "事业："
            detailLabel3.text = "\(horoscope.career)"
            titleLabel4.text = "爱情："
            detailLabel4.text = horoscope.love
            titleLabel5.text = "健康："
            detailLabel5.text = "\(horoscope.health)"
            titleLabel6.text = "财务："
            detailLabel6.text = "\(horoscope.finance)"
            titleLabel7.text = "年度概述："
            detailLabel7.text = "\(horoscope.mima?.info ?? "")"
            titleLabel8.text = "年度重点详述："
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
