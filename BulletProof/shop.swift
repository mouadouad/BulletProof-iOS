//
//  shop.swift
//  BulletProof
//
//  Created by mouad ouad on 21/01/2021.
//  Copyright © 2021 mouad ouad. All rights reserved.
//

import UIKit

class shop: UIViewController {
    
    var tableView = UITableView()
    public static let skins = ["classic","red","blue","black","white","grey","gold","diamond","jade","black_rifle","white_rifle","grey_rifle","gold_rifle","diamond_rifle","jade_rifle"]
    var owned = ["classic"]
    var chosen = String()
    
    
    override func loadView() {
        super.loadView()
        
        //SET THE BACKGROUND
        view.backgroundColor = UIColor(named: "background_color")
        
        //BACK BUTTON
        back()
        
        
        tableview_set()
        
        coinbar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reload), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        
        
        
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
    
    @objc func reload(){
        
        tableView.reloadData()
        coinbar()
        
    }
    
    struct keys {
       
        static let amount = "amount"
        static let owned = "owned"
        static let chosen = "chosen"
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
    
    func tableview_set(){
        view.addSubview(tableView)
        
        tableView.frame = CGRect(x:0,y:sety(250),width:Int(start.width),height:sety(1770-250))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight=start.height/4
        tableView.register(tableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
   
    
}


extension shop: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index=indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tableViewCell
      
        cell.get(Array(shop.skins[index*3...index*3+2]),view)
        
        return cell
        
    }
    
    
}

