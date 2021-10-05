//
//  NotificationBannerView.swift
//  Shoping

import UIKit
import NotificationBannerSwift

class NotificationBannerView {
    
    public static func show(title: String?, subtitle: String?, duration: TimeInterval = 1.0) {
        let banner = GrowingNotificationBanner(title: title, subtitle: subtitle, style: .success)
        banner.duration = duration
        banner.show(queuePosition: .front)
    }
    
    public static func warning(title: String?, subtitle: String?, duration: TimeInterval = 1.5) {
        let banner = GrowingNotificationBanner(title: title, subtitle: subtitle, style: .warning)
        banner.backgroundColor = UIColor.red
        banner.duration = duration
        banner.show(queuePosition: .front)
    }
}
