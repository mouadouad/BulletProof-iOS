//
//  finish.swift
//  BulletProof
//
//  Created by mouad ouad on 21/01/2021.
//  Copyright © 2021 mouad ouad. All rights reserved.
//

import UIKit

class finish: UIViewController {
    
    var scoretv = UILabel()
    var Bscoretv = UILabel()
    var play_again = UIButton()
    var score=0
    
    override func viewDidLoad() {
           super.viewDidLoad()
          
        //SET THE BACKGROUND
        let img = UIImage(named: "background")
        view.layer.contents = img?.cgImage

       //BACK BUTTON
       back()
        
       let coins_gained=score/10
        
        var coins=0
        let defaults = UserDefaults.standard
        if let amount = defaults.string(forKey: keys.amount){
            
            coins=Int(amount) ?? 0
            coins+=coins_gained
        
        }
        
        var Bscore=0
       if let amount = defaults.string(forKey: keys.score_key){
           
           Bscore=Int(amount) ?? 0
       }
        
        if score>Bscore{
            Bscore=score
        }
        
        save(String(coins),String(Bscore))
        
        coinbar()
        
        make_layout(score,Bscore)
               
    }
    
    func get_score(_ result:Int){
        score=result
    }
    
    func make_layout(_ score:Int , _ Bscore:Int){

        
       // Bscoretv = UILabel(frame: CGRect(x: 0, y: sety(800), width: setx(1000), height: 100))
        play_again = UIButton(frame: CGRect(x: setx(350), y: sety(450), width: setx(300), height: sety(200)))
        
        let container = UIView(frame:CGRect(x:setx(40),y:sety(250),width:setx(1000),height:sety(1080)))
        let img = UIImage(named: "coins_container")
        container.layer.contents = img?.cgImage
        
        scoretv.numberOfLines=0
        scoretv.text="YOUR SCORE IS :\n\(String(score))"
        scoretv.textColor = UIColor(named: "white")
        scoretv.textAlignment = .center
        scoretv.font = scoretv.font.withSize(CGFloat(setx(50)))
        
        Bscoretv.text="BEST :"+String(Bscore)
        Bscoretv.textColor = UIColor(named: "white")
        Bscoretv.textAlignment = .center
        Bscoretv.font = Bscoretv.font.withSize(CGFloat(setx(50)))
        
        play_again.setImage(UIImage(named: "play_again"), for:.normal)
        play_again.addTarget(self,action :#selector(play_againB), for:.touchUpInside)
        
        container.addSubview(scoretv)
        container.addSubview(Bscoretv)
        container.addSubview(play_again)
        
        self.view.addSubview(container)
        
        scoretv.translatesAutoresizingMaskIntoConstraints=false
         
         let constants = [
             scoretv.leftAnchor.constraint(equalTo: container.leftAnchor),
             scoretv.rightAnchor.constraint(equalTo: container.rightAnchor),
             scoretv.topAnchor.constraint(equalTo: container.topAnchor, constant: CGFloat(sety(80))),
            
         ]
         NSLayoutConstraint.activate(constants)
        
        Bscoretv.translatesAutoresizingMaskIntoConstraints=false
        
        let constraints = [
            Bscoretv.leftAnchor.constraint(equalTo: container.leftAnchor),
            Bscoretv.rightAnchor.constraint(equalTo: container.rightAnchor),
            Bscoretv.topAnchor.constraint(equalTo: container.topAnchor, constant: CGFloat(sety(800))),
           
        ]
        NSLayoutConstraint.activate(constraints)
    }
        
    @objc func play_againB(sender: UIButton){
        
        let vc = main_game()
      vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
      self.present(vc, animated: true, completion: nil)
    }
    
    struct keys {
        static let amount = "amount"
        static let score_key = "score"
    }
    
    func save(_ coins:String, _ score:String){
             
           let defaults = UserDefaults.standard
           defaults.set(coins, forKey: keys.amount)
           defaults.set(score, forKey: keys.score_key)
          
             
    }
    
    func coinbar(){
        
        var coins=0
        let defaults = UserDefaults.standard
        if let amount = defaults.string(forKey: keys.amount){
            
            coins=Int(amount) ?? 0
                
        
        }
        let coinsbar = UIView(frame:CGRect(x:setx(700),y:sety(50),width:setx(300),height:sety(150)))
        let img = UIImage(named: "coins_container")
        coinsbar.layer.contents = img?.cgImage
        
        
        let coinsIV = UIImageView(frame:CGRect(x:setx(200),y:0,width:setx(80),height:sety(150)))
        let image3 = UIImage(named: "coins") as UIImage?
        coinsIV.image = image3
        
        let coinsTv = UILabel(frame:CGRect(x:0,y:0,width:setx(200),height:sety(150)))
        coinsTv.text=String(coins)
        coinsTv.textColor = UIColor(named: "white")
        coinsTv.textAlignment = .center
        coinsTv.font = coinsTv.font.withSize(CGFloat(setx(40)))
        
        coinsbar.addSubview(coinsIV)
        coinsbar.addSubview(coinsTv)
        
        self.view.addSubview(coinsbar)
        
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
       
       func back(){
           
           let back = UIButton(frame:CGRect(x:setx(50),y:sety(50),width:setx(100),height:sety(100)))
           back.setImage(UIImage(named: "back_button"), for:.normal)
           back.addTarget(self,action :#selector(back_button), for:.touchUpInside)
           self.view.addSubview(back)
           
       }
       
       @objc func back_button(sender: UIButton){
           
           let vc = start()
           vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
           self.present(vc, animated: true, completion: nil)
           
       }
   
    
}
