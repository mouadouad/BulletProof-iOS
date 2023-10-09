//
//  main_game.swift
//  BulletProof
//
//  Created by mouad ouad on 21/01/2021.
//  Copyright © 2021 mouad ouad. All rights reserved.
//

import UIKit

class main_game: UIViewController {
    
    var perso1=UIButton()
    var perso2=UIButton()
    var b1=UIImageView()
    var b2=UIImageView()
    var b3=UIImageView()
    var b4=UIImageView()
    var b5=UIImageView()
    var b6=UIImageView()
    
    var tv=UILabel()
    
    var skin="",g_skin=""
    var pers1=0,pers2=0
    var sound=true
    
    var  a=Int(),b=Int(),c=Int(),d=Int(),e=Int(),f=Int(),x=Int(),y=Int(),y2=Int()
    var score = -1,travel=1000
    
    var still_playing=true
    
    var current1=0,current2=0
    
    
    override func loadView() {
           super.loadView()
          
        //SET THE BACKGROUND
        let img = UIImage(named: "background")
        view.layer.contents = img?.cgImage

        //BACK BUTTON
        back()
        
        let defaults = UserDefaults.standard
        skin=defaults.string(forKey: keys.chosen) ?? "classic"
        g_skin=skin+"_g"
        
     
       y=sety(1100)
       y2=sety(210)
       x=setx(90)
       
       let p=Int(start.width/6)
       let m=Int(p/2)
       
       a=m-x;b=m+p-x;c=2*p+m-x;d=3*p+m-x;e=4*p+m-x;f=5*p+m-x
        
        make_bullets()
             
        make_buttons()
             
        make_label()
             
        
        let nb1 = Int.random(in: 0...1)
        if nb1==0{
            pers1=1
            perso1.setImage(UIImage(named: g_skin), for:.normal)
        }else{
            pers2=1
            perso2.setImage(UIImage(named: g_skin), for:.normal)
        }
        
        if let sound = defaults.string(forKey: keys.key){
                  
          if sound=="true" {
              self.sound=true
          }else{
              self.sound=false
          }
              
        }
        
        Rand()
    }
    

    
    func Rand(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){ // handler
            self.rand()
            
        }
        
    }
    
    func rand(){
       
        
        
        if score == -1{
           
            switch Int.random(in: 0...2) {
            case 0:
                perso1_at_(a)
            case 1:
                perso1_at_(b)

            case 2:
                perso1_at_(c)
                
            default:
                break
            }
            
            
            switch Int.random(in: 0...2) {
            case 0:
                perso2_at_(d)
                
            case 1:
                perso2_at_(e)
                
            case 2:
                perso2_at_(f)

            default:
                break
            }
   
            
        }
        
        score+=1
        tv.text=String(score)
        
        
        switch Int.random(in: 1...36) {
        case 1:
            p_sec1()
        case 2:
            p_sec2()
        case 3:
            p_sec3()
        case 4:
            p_sec4()
        case 5:
            p_sec5()
        case 6:
            p_sec6()
        case 7:
            p_sec7()
        case 8:
            p_sec8()
        case 9:
            p_sec9()
        case 10:
            p_sec10()
        case 11:
            p_sec11()
        case 12:
            p_sec12()
        case 13:
            p_sec13()
        case 14:
            p_sec14()
        case 15:
            p_sec15()
        case 16:
            p_sec16()
        case 17:
            p_sec17()
        case 18:
            p_sec18()
        case 19:
            p_sec19()
        case 20:
            p_sec20()
        case 21:
            p_sec21()
        case 22:
            p_sec22()
        case 23:
            p_sec23()
        case 24:
            p_sec24()
        case 25:
            p_sec25()
        case 26:
            p_sec26()
        case 27:
            p_sec27()
        case 28:
            p_sec28()
        case 29:
            p_sec29()
        case 30:
            p_sec30()
        case 31:
            p_sec31()
        case 32:
            p_sec32()
        case 33:
            p_sec33()
        case 34:
            p_sec34()
        case 35:
            p_sec35()
        case 36:
            p_sec36()
            
            
        default:
            break
        }
    }
    
    func dead1(){
        
        perso1.setImage(UIImage(named: "dead"), for:.normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.perso1.setImage(UIImage(named: self.skin), for:.normal)
        }
                
    }
    
    func dead2(){
        
        perso2.setImage(UIImage(named: "dead"), for:.normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.perso2.setImage(UIImage(named: self.skin), for:.normal)
        }
                
    }
    
    
    func p_sec1(){
        
        b1_1();b2_1();b3_d_1();b4_1();b5_d_1();b6_1()
        
        perso1_(c);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.e)
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec2(){
        
        b1_1();b2_1();b3_d_1();b4_d_1();b5_1();b6_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
    }
    
    func p_sec3(){
        
        b1_1();b2_1();b3_d_1();b4_1();b5_1();b6_d_1()
        
        perso1_(b);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec4(){
        
        b1_d_1();b2_1();b3_1();b4_d_1();b5_1();b6_1()
        
        perso1_(c);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec5(){
        
        b1_d_1();b2_1();b3_1();b4_1();b5_d_1();b6_1()
        
        perso1_(a);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
                
                self.Rand()
              
            
                        
        }
                    
        
    }
    
    func p_sec6(){
        
        b1_d_1();b2_1();b3_1();b4_1();b5_1();b6_d_1()
        
        perso1_(c);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec7(){
        
        b1_1();b2_d_1();b3_1();b4_d_1();b5_1();b6_1()
        
        perso1_(c);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec8(){
        
        b1_1();b2_d_1();b3_1();b4_1();b5_d_1();b6_1()
        
        perso1_(c);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec9(){
        
        b1_1();b2_d_1();b3_1();b4_1();b5_1();b6_d_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec10(){
        
        b1_d_1();b2_1();b3_1();b4_d_1();b5_d_1();b6_1()
        
        perso1_(c);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec11(){
        
        b1_d_1();b2_1();b3_1();b4_d_1();b5_1();b6_d_1()
        
        perso1_(a);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec12(){
        
        b1_d_1();b2_1();b3_1();b4_1();b5_d_1();b6_d_1()
        
        perso1_(a);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
        
                self.Rand()
              
            
                        
        }
                    
        
    }
    
    func p_sec13(){
        
        b1_1();b2_d_1();b3_1();b4_d_1();b5_d_1();b6_1()
        
        perso1_(b);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
        
    }
    
    func p_sec14(){
        
        b1_1();b2_d_1();b3_1();b4_d_1();b5_1();b6_d_1()
        
        perso1_(a);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec15(){
        
        b1_1();b2_d_1();b3_1();b4_1();b5_d_1();b6_d_1()
        
        perso1_(c);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec16(){
        
        b1_1();b2_1();b3_d_1();b4_d_1();b5_d_1();b6_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec17(){
        
        b1_1();b2_1();b3_d_1();b4_d_1();b5_1();b6_d_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec18(){
        
        b1_1();b2_1();b3_d_1();b4_1();b5_d_1();b6_d_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec19(){
        
        b1_d_1();b2_d_1();b3_1();b4_d_1();b5_1();b6_1()
        
        perso1_(c);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                 self.lost()
            }else{
                 self.dead2()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec20(){
        
        b1_d_1();b2_d_1();b3_1();b4_1();b5_d_1();b6_1()
        
        perso1_(c);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec21(){
        
        b1_d_1();b2_d_1();b3_1();b4_1();b5_1();b6_d_1()
        
        perso1_(b);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                 self.lost()
            }else{
                 self.dead1()
                
                self.Rand()
              
            }
                        
        }
                    
        
    }
    
    func p_sec22(){
           
           b1_d_1();b2_1();b3_d_1();b4_d_1();b5_1();b6_1()
           
           perso1_(a);perso2_(f);
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
               self.perso1_(self.b);self.perso2_(self.d);
               }
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
               
               if  self.pers2 == 1{
                    self.lost()
               }else{
                    self.dead2()
                   
                   self.Rand()
                 
               }
                           
           }
                       
           
       }
       
    func p_sec23(){
        
        b1_d_1();b2_1();b3_d_1();b4_1();b5_1();b6_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                self.lost()
            }else{
                self.dead1()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec24(){
           
           b1_d_1();b2_1();b3_d_1();b4_1();b5_1();b6_d_1()
           
           perso1_(c);perso2_(d);
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
               self.perso1_(self.b);self.perso2_(self.f);
               }
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
               
               if  self.pers2 == 1{
                    self.lost()
               }else{
                    self.dead2()
                   
                   self.Rand()
                 
               }
                           
           }
                       
           
       }
       
    func p_sec25(){
        
        b1_1();b2_d_1();b3_d_1();b4_d_1();b5_1();b6_1()
        
        perso1_(b);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                self.lost()
            }else{
                self.dead1()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec26(){
           
           b1_1();b2_d_1();b3_d_1();b4_1();b5_d_1();b6_1()
           
           perso1_(c);perso2_(d);
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
               self.perso1_(self.a);self.perso2_(self.f);
               }
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
               
                   
                   self.Rand()
                 
               
                           
           }
                       
           
       }
       
    func p_sec27(){
        
        b1_1();b2_d_1();b3_d_1();b4_1();b5_1();b6_d_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                self.lost()
            }else{
                self.dead1()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec28(){
        
        b1_d_1();b2_d_1();b3_1();b4_d_1();b5_d_1();b6_1()
        
        perso1_(b);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                self.lost()
            }else{
                self.dead1()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec29(){
           
           b1_d_1();b2_d_1();b3_1();b4_d_1();b5_1();b6_d_1()
           
           perso1_(a);perso2_(d);
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
               self.perso1_(self.b);self.perso2_(self.e);
               }
           
           DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
               
               if  self.pers1 == 1{
                    self.lost()
               }else{
                    self.dead1()
                   
                   self.Rand()
                 
               }
                           
           }
                       
           
       }
       
    func p_sec30(){
        
        b1_d_1();b2_d_1();b3_1();b4_1();b5_d_1();b6_d_1()
        
        perso1_(a);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                self.lost()
            }else{
                self.dead2()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec31(){
        
        b1_d_1();b2_1();b3_d_1();b4_d_1();b5_d_1();b6_1()
        
        perso1_(b);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.b);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                self.lost()
            }else{
                self.dead2()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec32(){
        
        b1_d_1();b2_1();b3_d_1();b4_d_1();b5_1();b6_d_1()
        
        perso1_(b);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.e);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                self.lost()
            }else{
                self.dead1()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec33(){
        
        b1_d_1();b2_1();b3_d_1();b4_1();b5_d_1();b6_d_1()
        
        perso1_(b);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                self.lost()
            }else{
                self.dead1()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec34(){
        
        b1_1();b2_d_1();b3_d_1();b4_d_1();b5_d_1();b6_1()
        
        perso1_(a);perso2_(e);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                self.lost()
            }else{
                self.dead2()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec35(){
        
        b1_1();b2_d_1();b3_d_1();b4_d_1();b5_1();b6_d_1()
        
        perso1_(c);perso2_(d);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.a);self.perso2_(self.f);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers2 == 1{
                self.lost()
            }else{
                self.dead2()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    
    func p_sec36(){
        
        b1_1();b2_d_1();b3_d_1();b4_1();b5_d_1();b6_d_1()
        
        perso1_(a);perso2_(f);
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/1000)){
            self.perso1_(self.c);self.perso2_(self.d);
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(travel/500)){
            
            if  self.pers1 == 1{
                self.lost()
            }else{
                self.dead1()
                
                self.Rand()
                
            }
                        
        }
                    
        
    }
    

    
    
    func make_buttons(){
        
        perso1 = UIButton(frame:CGRect(x:setx(0),y:sety(1100),width:setx(180),height:sety(420)))
        perso1.setImage(UIImage(named: skin), for:.normal)
        perso1.addTarget(self,action :#selector(perso1_func), for:.touchUpInside)
        self.view.addSubview(perso1)
        
        
        perso2 = UIButton(frame:CGRect(x:setx(0),y:sety(1100),width:setx(180),height:sety(420)))
        perso2.setImage(UIImage(named: skin), for:.normal)
        perso2.addTarget(self,action :#selector(perso2_func), for:.touchUpInside)
        self.view.addSubview(perso2)
        
    }
    
    func make_bullets(){
        
        let image = UIImage(named: "bullet_icon") as UIImage?
        
        b1 = UIImageView(frame:CGRect(x:a,y:0,width:setx(175),height:sety(262)))
        b1.image = image
        self.view.addSubview(b1)
        
        b2 = UIImageView(frame:CGRect(x:b,y:0,width:setx(175),height:sety(262)))
        b2.image = image
        self.view.addSubview(b2)
        
        b3 = UIImageView(frame:CGRect(x:c,y:0,width:setx(175),height:sety(262)))
        b3.image = image
        self.view.addSubview(b3)
        
        b4 = UIImageView(frame:CGRect(x:d,y:0,width:setx(175),height:sety(262)))
        b4.image = image
        self.view.addSubview(b4)
        
        b5 = UIImageView(frame:CGRect(x:e,y:0,width:setx(175),height:sety(262)))
        b5.image = image
        self.view.addSubview(b5)
        
        b6 = UIImageView(frame:CGRect(x:f,y:0,width:setx(175),height:sety(262)))
        b6.image = image
        self.view.addSubview(b6)
        
    }
    
    func make_label(){
        
        view.addSubview(tv)
        tv.translatesAutoresizingMaskIntoConstraints=false
        
        let constants = [
            tv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tv.centerYAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(sety(300)))
       
           
        ]
        NSLayoutConstraint.activate(constants)
        
        tv.textColor = UIColor.black
        tv.font = UIFont.boldSystemFont(ofSize: 14.0)
        tv.font = tv.font.withSize(CGFloat(setx(90)))
        
        
    }
       
    @objc func perso1_func(sender: UIButton){
              
        if pers1==0{
        perso1.setImage(UIImage(named: g_skin), for:.normal)
        perso2.setImage(UIImage(named: skin), for:.normal)
        pers1=1
        pers2=0
        }
    }
    
    @objc func perso2_func(sender: UIButton){
                
        if pers2==0{
        perso2.setImage(UIImage(named: g_skin), for:.normal)
        perso1.setImage(UIImage(named: skin), for:.normal)
        pers2=1
        pers1=0
        }
    }
    
    func perso1_at_(_ x:Int){
        
        self.current1=x
        var thisrect:CGRect = perso1.frame
        thisrect.origin.x = CGFloat(x)
        perso1.frame = thisrect
        
     
    }
    
  
    
    func perso2_at_(_ x:Int){
        
        self.current2=x
        var thisrect:CGRect = perso2.frame
        thisrect.origin.x = CGFloat(x)
        perso2.frame = thisrect
         
    }
    
    
    func perso1_(_ x:Int){
        UIView.animate(withDuration: TimeInterval(travel/1000)){
             
            self.perso1.transform = CGAffineTransform(translationX: CGFloat(x-self.current1), y: 0)
            self.current1=x
         }
    }
    
    func perso2_(_ x:Int){
        UIView.animate(withDuration: TimeInterval(travel/1000)){
             
            self.perso2.transform = CGAffineTransform(translationX: CGFloat(x-self.current2), y: 0)
            self.current2=x
        
         }
    }
    
    
    
    func b_2(_ bullet:UIImageView){
        
        
           UIView.animate(withDuration: TimeInterval(travel/500)){
                        
            bullet.transform = CGAffineTransform(translationX: 0, y: CGFloat(self.y-self.y2))
            
                       
            }
                
        
    }
    
    func b_d_2(_ bullet:UIImageView){
           
            UIView.animate(withDuration: TimeInterval(travel/500)){
                       
                bullet.transform = CGAffineTransform(translationX: 0, y: CGFloat(self.y))
                      
           }
           
       }
    
    
    func b1_d_1(){
        
        var thisrect:CGRect = b1.frame
        
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b1.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        
        thisrect.origin.y = CGFloat(sety(20))
        b1.frame = thisrect
        
        
         b_d_2(b1)
    }
    

    func b1_1(){
        
        var thisrect:CGRect = b1.frame
        
        
          UIView.animate(withDuration: TimeInterval(0)){
                            
            self.b1.transform = CGAffineTransform(translationX: 0, y: 0)
                           
        }
        
        thisrect.origin.y = 0
        b1.frame = thisrect
        
         b_2(b1)
    }
    
    func b2_d_1(){
        
        var thisrect:CGRect = b2.frame
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b2.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        thisrect.origin.y = CGFloat(sety(20))
        b2.frame = thisrect
        
         b_d_2(b2)
    }
    
    func b2_1(){
           
           var thisrect:CGRect = b2.frame
           
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b2.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
           thisrect.origin.y = 0
           b2.frame = thisrect
           
         b_2(b2)
       }
    
    func b3_d_1(){
        
       var thisrect:CGRect = b3.frame
        
        
          UIView.animate(withDuration: TimeInterval(0)){
                            
            self.b3.transform = CGAffineTransform(translationX: 0, y: 0)
                           
        }
        
        
        thisrect.origin.y = CGFloat(sety(20))
        b3.frame = thisrect
        
         b_d_2(b3)
    }
    
    func b3_1(){
        
        var thisrect:CGRect = b3.frame
        
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b3.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        thisrect.origin.y = 0
        b3.frame = thisrect
        
         b_2(b3)
    }
    
    func b4_d_1(){
        
        var thisrect:CGRect = b4.frame
        
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b4.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        thisrect.origin.y = CGFloat(sety(20))
        b4.frame = thisrect
        
         b_d_2(b4)
    }
    
    func b4_1(){
        
        var thisrect:CGRect = b4.frame
        
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b4.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        thisrect.origin.y = 0
        b4.frame = thisrect
     
         b_2(b4)
    }
    
    
    func b5_d_1(){
        
        var thisrect:CGRect = b5.frame
        
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b5.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        thisrect.origin.y = CGFloat(sety(20))
        b5.frame = thisrect
        
         b_d_2(b5)
    }
    
    func b5_1(){
        
        var thisrect:CGRect = b5.frame
        
        UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b5.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        
        thisrect.origin.y = 0
        b5.frame = thisrect
        
         b_2(b5)
    }
    
    func b6_d_1(){
        
        var thisrect:CGRect = b6.frame
        
         UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b6.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        
        thisrect.origin.y = CGFloat(sety(20))
        b6.frame = thisrect
        
         b_d_2(b6)
    }
    
    func b6_1(){
        
        var thisrect:CGRect = b6.frame
         UIView.animate(withDuration: TimeInterval(0)){
                                   
                   self.b6.transform = CGAffineTransform(translationX: 0, y: 0)
                                  
               }
        thisrect.origin.y = 0
        b6.frame = thisrect
        
         b_2(b6)
    }
    
    struct keys {
       
       static let key = "true"
       static let chosen = "chosen"
    }
    
    func lost(){
        if still_playing{
            
            let vc = finish()
            vc.get_score(score)
            vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(vc, animated: true, completion: nil)
        }
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

