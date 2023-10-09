//
//  ViewController.swift
//  BulletProof
//
//  Created by mouad ouad on 19/01/2021.
//  Copyright © 2021 mouad ouad. All rights reserved.
//

import UIKit
import GoogleMobileAds


class start: UIViewController {

    public static var height: CGFloat = 0
    public static var width: CGFloat = 0
    var play_button: UIButton = UIButton(frame:CGRect(x:0,y:0,width:0,height:0))
    var shop_button: UIButton = UIButton(frame:CGRect(x:0,y:0,width:0,height:0))
    var sound_button: UIButton = UIButton(frame:CGRect(x:0,y:0,width:0,height:0))
    var sound : Bool=true
    var coinsbar : UIView?
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
        //ANIMATE
        UIView.animate(withDuration: 1){
            
            self.shop_button.transform = CGAffineTransform(translationX: 0, y: CGFloat(self.sety(1000)))
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8){ // handler
                   UIView.animate(withDuration: 1){
                              UIView.animate(withDuration: 1.0) {
                                self.coinsbar!.alpha = 1.0
                            
                         
                          }
               }
        
          
        }
    }
    
    override func loadView() {
    
        super.loadView()
       
        //GET SCREEN SIZE
        let screenSize = UIScreen.main.bounds
        start.width = screenSize.width
        start.height = screenSize.height
        
        //SET THE BACKGROUND
        let img = UIImage(named: "background")
        view.layer.contents = img?.cgImage
        
        //MAKING THE BUTTONS
        play_button = UIButton(frame:CGRect(x:setx((1080-300)/2),y:-sety(200),width:setx(300),height:sety(150)))
        let image = UIImage(named: "start") as UIImage?
        play_button.setImage(image, for:.normal)
        play_button.addTarget(self,action :#selector(playF), for:.touchUpInside)
        self.view.addSubview(play_button)
        
        shop_button = UIButton(frame:CGRect(x:setx((1080-300)/2),y:0,width:setx(300),height:sety(150)))
        let image1 = UIImage(named: "shop") as UIImage?
        shop_button.setImage(image1, for:.normal)
        shop_button.addTarget(self,action :#selector(shopF), for:.touchUpInside)
        self.view.addSubview(shop_button)
        
       //GET SOUND BOOLEAN
        var image_name="sound"
        let defaults = UserDefaults.standard
        if let sound = defaults.string(forKey: keys.key){
            
            if sound=="true" {
                
                image_name="sound"
                self.sound=true
                
            }else{
                
                image_name="no_sound"
                self.sound=false
                
            }
        
        }
        
        sound_button = UIButton(frame:CGRect(x:setx(100),y:sety(50),width:setx(150),height:sety(150)))
        let image2 = UIImage(named: image_name) as UIImage?
        sound_button.setImage(image2, for:.normal)
        sound_button.addTarget(self,action :#selector(soundF), for:.touchUpInside)
        self.view.addSubview(sound_button)
        

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){ // handler
            UIView.animate(withDuration: 1){
                       self.play_button.transform = CGAffineTransform(translationX: 0, y: CGFloat(self.sety(1000)))
                     
                  
                   }
        }
        
        coinbar()
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        
        
    }
    
    struct keys {
        static let key = "true"
        static let amount = "amount"
    }
    func save(sound:String){
             
           let defaults = UserDefaults.standard
           defaults.set(sound, forKey: keys.key)
          
             
    }
    
    func coinbar(){
        
        var coins=0
        let defaults = UserDefaults.standard
        if let amount = defaults.string(forKey: keys.amount){
            
            coins=Int(amount) ?? 0
                
        
        }
        coinsbar = UIView(frame:CGRect(x:setx(700),y:sety(50),width:setx(300),height:sety(150)))
        let img = UIImage(named: "coins_container")
        coinsbar!.layer.contents = img?.cgImage
        
        
        let coinsIV = UIImageView(frame:CGRect(x:setx(200),y:0,width:setx(80),height:sety(150)))
        let image3 = UIImage(named: "coins") as UIImage?
        coinsIV.image = image3
        
        let coinsTv = UILabel(frame:CGRect(x:0,y:0,width:setx(200),height:sety(150)))
        coinsTv.text=String(coins)
        coinsTv.textColor = UIColor(named: "white")
        coinsTv.textAlignment = .center
        coinsTv.font = coinsTv.font.withSize(CGFloat(setx(40)))
        
        coinsbar!.addSubview(coinsIV)
        coinsbar!.addSubview(coinsTv)
        
        self.view.addSubview(coinsbar!)
        self.coinsbar!.alpha = 0.0
    }
    
    
    
     @objc func playF(sender: UIButton){
         
  
         let vc = main_game()
         vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
         self.present(vc, animated: true, completion: nil)
         
         
     
     }
     @objc func shopF(sender: UIButton){
        
        let vc = shop()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
 
     }
    
    @objc func soundF(sender: UIButton){
       var image="sound"
        
        if sound{
            image="no_sound"
            sound=false

        }else{
            sound=true
        }
        
        let image2 = UIImage(named: image) as UIImage?
        sound_button.setImage(image2, for:.normal)
        save(sound: String(self.sound))
       
    }
    
    
    func setx(_ size:Int)->Int{
        
        var x:Int
        x=(size*Int(start.width))/1080
        return x
        
            
        }
        
    func sety(_ size:Int)->Int{
           
           var x:Int
        x=(size*Int(start.height))/1770
           return x
           
    }
    
    var bannerView: GADBannerView!
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(bannerView)
     view.addConstraints(
       [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
         bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }




}

