//
//  ViewController.swift
//  GoogleAds
//
//  Created by pranav gupta on 28/04/17.
//  Copyright © 2017 Pranav gupta. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController , GADBannerViewDelegate ,GADInterstitialDelegate {
    
    
    @IBOutlet weak var adBannerView: GADBannerView!
    
    var interstitial: GADInterstitial!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adBannerView.adUnitID = "ca-app-pub-9389698076492273/3624184947"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        adBannerView.load(GADRequest())
        interstitial = createAndLoadInterstitial()
    }
    
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adviewdid receive ad")
        
        // comment below code if you dont want to animate your ad.Below code produces slide down effect.
        
        let translateTransform = CGAffineTransform(translationX: 0, y: -bannerView.bounds.size.height)
        bannerView.transform = translateTransform
        
        UIView.animate(withDuration: 0.5){
            bannerView.transform = CGAffineTransform.identity
        }
    }
    
    // BannerView optional delegate methods.
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("fail to receive ads")
        print(error)
    }
    
    
    // Function to Create and Load Interstitial Ad.
    
    private func createAndLoadInterstitial()-> GADInterstitial? {
    
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-9389698076492273/5166466948")
        guard let interstitial = interstitial else{
            return nil
        }
        
        let request = GADRequest()
        
        // sets our device to simulator. we need to remove it if we want to test it on a device.
        
        request.testDevices = [kGADSimulatorID]
        interstitial.load(request)
        interstitial.delegate = self
        return interstitial
        
    }
    
    //Interstitial Optional Delegate methods.
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitial received ad")
        ad.present(fromRootViewController: self)
    }
    
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstial failed")
        print(error)
    }
    

    
}

