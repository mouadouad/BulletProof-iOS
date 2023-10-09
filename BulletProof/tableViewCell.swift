//
//  tableViewCell.swift
//  BulletProof
//
//  Created by mouad ouad on 24/01/2021.
//  Copyright © 2021 mouad ouad. All rights reserved.
//

import UIKit

var item1 = UIButton()
var item2 = UIButton()
var item3 = UIButton()
var state1 = UIButton()
var state2 = UIButton()
var state3 = UIButton()

var img1 = String()
var img2 = String()
var img3 = String()

var chosen = String()
var owned = [String]()
var coins = Int()

var dict=[UIButton:String]()
var current_image=String()
var view=UIView()


class tableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        backgroundColor = UIColor(named: "background_color")
        
    }

    func get(_ names:[String],_ this:UIView){
        img1 = names[0]
        img2 = names[1]
        img3 = names[2]
        
        view=this
        
        make_buttons()
        
    }
    
    struct keys {
       
        static let amount = "amount"
        static let owned = "owned"
        static let chosen = "chosen"
    }

    
    func save(){
        
             
       let defaults = UserDefaults.standard
       defaults.set(owned, forKey: keys.owned)
       defaults.set(chosen,forKey: keys.chosen)
       defaults.set(String(coins),forKey: keys.amount)
        
       
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
    }
    
    func get_values(){
        let defaults = UserDefaults.standard
          if let amount = defaults.string(forKey: keys.amount){
                  
            coins=Int(amount) ?? 0
                
        }
        chosen=defaults.string(forKey: keys.chosen) ?? "classic"
        owned=defaults.array(forKey: keys.owned) as? [String] ?? ["classic"]
                    
          
    }
     
    func make_buttons(){
        
        get_values()
        
        let height=Int(start.height/4)
        let width=Int(start.width/3)
        
        
        
        item1 = UIButton(frame:CGRect(x:0,y:0,width:width,height:height))
        item1.setImage(UIImage(named: img1), for:.normal)
        addSubview(item1)
        
        item2 = UIButton(frame:CGRect(x:width,y:0,width:width,height:height))
        item2.setImage(UIImage(named: img2), for:.normal)
        addSubview(item2)
        
        item3 = UIButton(frame:CGRect(x:2*width,y:0,width:width,height:height))
        item3.setImage(UIImage(named: img3), for:.normal)
        addSubview(item3)
        
        
        state1 = UIButton(frame:CGRect(x:0,y:0,width:width,height:height))
        state1.addTarget(self,action :#selector(state1F), for:.touchUpInside)
        addSubview(state1)
        
        if chosen == img1
        {state1.setImage(UIImage(named: "selected"), for:.normal)}
        else if owned.contains(img1)
        {state1.backgroundColor=UIColor(named: "transparent")}
        else
        {state1.setImage(UIImage(named: "locked"), for:.normal)}
        
        state2 = UIButton(frame:CGRect(x:width,y:0,width:width,height:height))
        state2.addTarget(self,action :#selector(state1F), for:.touchUpInside)
        addSubview(state2)
        
        if chosen == img2
        {state2.setImage(UIImage(named: "selected"), for:.normal)}
        else if owned.contains(img2)
        {state2.backgroundColor=UIColor(named: "transparent")}
        else
        {state2.setImage(UIImage(named: "locked"), for:.normal)}
        
        state3 = UIButton(frame:CGRect(x:2*width,y:0,width:width,height:height))
        state3.addTarget(self,action :#selector(state1F), for:.touchUpInside)
        addSubview(state3)
        
        if chosen == img3
        {state3.setImage(UIImage(named: "selected"), for:.normal)}
        else if owned.contains(img3)
        {state3.backgroundColor=UIColor(named: "transparent")}
        else
        {state3.setImage(UIImage(named: "locked"), for:.normal)}
        
        dict[state1]=img1
        dict[state2]=img2
        dict[state3]=img3
        
    }
    
   
    
    @objc func state1F(sender: UIButton,_ i:Int){
        
        
        if !owned.contains(dict[sender]!){
            buy_dialog(sender)
        }else{
            chosen=dict[sender]!
            save()
        }
        
    }
    

    var dim = UIView(frame:CGRect(x:0,y:0,width:0,height:0))
    var Msg_box = UIView(frame:CGRect(x:0,y:0,width:0,height:0))
    var price=0

    func buy_dialog(_ sender:UIButton){
         
         
        //MAKE SCREEN DIM
          dim = UIView(frame:CGRect(x:0,y:0,width:start.width,height:start.height))
          dim.backgroundColor = .black
          view.addSubview(dim)
          dim.alpha = 0.66
         
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hide))
        
        dim.addGestureRecognizer(gesture)
        
         let a = setx((1080-100-1080/3)/2)
         let b = sety((1770-1770/4-200)/2)
         
        let height=Int(start.height/4)
        let width=Int(start.width/3)
        
        let msg_box = UIView(frame:CGRect(x:a,y:b,width:setx(1080/3+100),height:sety(1770/4+200)))
         let img = UIImage(named: "coins_container")
         msg_box.layer.contents = img?.cgImage
        //msg_box.backgroundColor=UIColor(named: "red")
         view.addSubview(msg_box)
         Msg_box = msg_box
         
        let okay = UIButton(frame:CGRect(x:width/2-setx(200)/2,y:height+sety(50),width:setx(300),height:sety(100)))
        
        let image = UIImageView(frame:CGRect(x:setx(100)/2,y:sety(50),width:width,height:height))
        image.image = UIImage(named: dict[sender]!) as UIImage?
        msg_box.addSubview(image)
         
        var buy=""
        
        let index=shop.skins.firstIndex(of:dict[sender] ?? "classic")!
        
        if index < 3{
            buy="buy_100"
            price=100
        }else if 3<=index && index<6 {
            buy="buy_150"
            price=150
        }else if 6<=index && index<9{
            buy="buy_200"
            price=200
        }else{
            buy="buy_300"
            price=300
        }
        
         okay.setImage(UIImage(named: buy), for:.normal)
         okay.addTarget(self,action :#selector(buy_button), for:.touchUpInside)
         msg_box.addSubview(okay)
             
        current_image=dict[sender] ?? "nil"
            
         }
         
     @objc func buy_button(_sender: UIButton){
            
        if coins>=price{
          
            Msg_box.isHidden = true
            dim.isHidden = true
            owned.append(current_image)
            chosen=current_image
            coins-=price
            save()
            
            
        }
                 
                   
    }
    
    @objc func hide(){
        
        Msg_box.isHidden = true
        dim.isHidden = true
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

}
