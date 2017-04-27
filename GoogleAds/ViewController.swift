//
//  ViewController.swift
//  GoogleAds
//
//  Created by pranav gupta on 28/04/17.
//  Copyright © 2017 Pranav gupta. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController , GADBannerViewDelegate {
    
    @IBOutlet weak var adView: UIView!
    
    lazy var adBannerView : GADBannerView = {
        
        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView.adUnitID = "ca-app-pub-9389698076492273/3624184947"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        
        return adBannerView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        adBannerView.load(GADRequest())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adviewdid receive ad")
        adView = adBannerView

    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("fail to receive ads")
        print(error)
    }

    
}

