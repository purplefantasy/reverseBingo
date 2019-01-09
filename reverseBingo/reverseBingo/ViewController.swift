//
//  ViewController.swift
//  reverseBingo
//
//  Created by User11 on 2018/12/19.
//  Copyright © 2018 pur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var s: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var w = 0
    var w2 = 0
    var turn = 2
    var r = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func put1(_ sender: UIButton) {
        if w==0 {
            if s[5] == 0 {
                for i in 0...5 {
                    if s[i] == 0 {
                        s[i] = turn
                        changeimg(a: i)
                        changeturn()
                        win()
                        if w > 0 {
                            win2()
                        }
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func put2(_ sender: UIButton) {
        if w==0 {
            if s[11] == 0 {
                for i in 0...5 {
                    if s[i+6] == 0 {
                        s[i+6] = turn
                        changeimg(a: i+6)
                        changeturn()
                        win()
                        if w > 0 {
                            win2()
                        }
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func put3(_ sender: UIButton) {
        if w==0 {
            if s[17] == 0 {
                for i in 0...5 {
                    if s[i+12] == 0 {
                        s[i+12] = turn
                        changeimg(a: i+12)
                        changeturn()
                        win()
                        if w > 0 {
                            win2()
                        }
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func put4(_ sender: UIButton) {
        if w==0 {
            if s[23] == 0 {
                for i in 0...5 {
                    if s[i+18] == 0 {
                        s[i+18] = turn
                        changeimg(a: i+18)
                        changeturn()
                        win()
                        if w > 0 {
                            win2()
                        }
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func put5(_ sender: UIButton) {
        if w==0 {
            if s[29] == 0 {
                for i in 0...5 {
                    if s[i+24] == 0 {
                        s[i+24] = turn
                        changeimg(a: i+24)
                        changeturn()
                        win()
                        if w > 0 {
                            win2()
                        }
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func put6(_ sender: UIButton) {
        if w==0 {
            if s[35] == 0 {
                for i in 0...5 {
                    if s[i+30] == 0 {
                        s[i+30] = turn
                        changeimg(a: i+30)
                        changeturn()
                        win()
                        if w > 0 {
                            win2()
                        }
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func put7(_ sender: UIButton) {
        if w==0 {
            if s[41] == 0 {
                for i in 0...5 {
                    if s[i+36] == 0 {
                        s[i+36] = turn
                        changeimg(a: i+36)
                        changeturn()
                        win()
                        if w > 0 {
                            win2()
                        }
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func reversebutton(_ sender: UIButton) {
        if w==0 {
            if r == 0 {
                reverse()
            }
        }
        else {
            resetboard()
        }
    }
    
    func reverse() {
        for i in 0...6 {
            for j in 0...2 {
                swap2(a: i*6+j, b: (i+1)*6-j-1)
            }
        }
        g()
        win()
        if w > 0 && w != turn && w2 == 0{
            for i in 0...6 {
                for j in 0...2 {
                    swap2(a: i*6+j, b: (i+1)*6-j-1)
                }
            }
            g()
            w = 0
        }
        r = 1
        changeimg(a: -2)
        changeturn()
        if w > 0 {
            win2()
        }
    }
    
    func g() {
        for i in 0...6 {
            for j in 1...5 {
                for k in 1...5 {
                    if s[i*6+k-1]==0 && s[i*6+k] > 0 {
                        s[i*6+k-1] = s[i*6+k]
                        s[i*6+k]=0
                    }
                }
            }
        }
    }
    
    func swap2(a:Int,b:Int) {
        var sw: Int
        sw = s[a]
        s[a] = s[b]
        s[b] = sw
    }
    
    func changeturn() {
        if r == 0 {
            reverse_button.isEnabled=true
            reverse_button.setTitle("Reverse!", for: .normal)
        }
        if r == 2 {
            r = 0
            reverse_button.setTitle("Reverse!", for: .normal)
            reverse_button.isEnabled=true
        }
        if r == 1 {
            r = 2
            reverse_button.setTitle("", for: .normal)
            reverse_button.isEnabled=false
        }
        if turn==2 {
            turn=3
            turnlabel.text = "red                   turn"
            turnlabel.textColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        else {
            turn=2
            turnlabel.text = "green                   turn"
            turnlabel.textColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }
        if w == 0 {
            for i in 0...6 {
                for j in 0...2 {
                    swap2(a: i*6+j, b: (i+1)*6-j-1)
                }
            }
            g()
            win()
            for i in 0...6 {
                for j in 0...2 {
                    swap2(a: i*6+j, b: (i+1)*6-j-1)
                }
            }
            g()
            if w > 0 && w != turn && w2 == 0 {
                reverse_button.setTitle("", for: .normal)
                reverse_button.isEnabled=false
            }
            w = 0
            w2 = 0
        }
        if s[5] > 0 && s[11] > 0 && s[17] > 0 && s[23] > 0 && s[29] > 0 && s[35] > 0 && s[41] > 0 && w == 0 {
            tie()
        }
    }
    
    func changeimg(a: Int) {
        for i in 0...41 {
            img[i].image = UIImage(named: "board\(s[i])")
        }
        if a >= 0 {
            let b = img[a].center.y
            img[a].center.y = img[5].center.y
            UIView.animate(withDuration:0.5) {
                self.img[a].center.y = b
            }
        }
        if a == -2 {
            let c: [CGFloat] = [img[0].center.y,img[1].center.y,img[2].center.y,img[3].center.y,img[4].center.y,img[5].center.y]
            for i in 1...7 {
                var k = 0
                for j in 1...6 {
                    if s[i*6-j] > 0 {
                        let b = img[i*6-j].center.y
                        img[i*6-j].center.y = c[5-k]
                        k += 1
                        UIView.animate(withDuration:0.5) {
                            self.img[i*6-j].center.y = b
                        }
                    }
                }
            }
        }
    }
    
    func win2() {
        if turn==2 {
            turnlabel.text = "red                   win"
            turnlabel.textColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
        else {
            turnlabel.text = "green                   win"
            turnlabel.textColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }
        reverse_button.isEnabled=true
        reverse_button.setTitle("Restart", for: .normal)
    }
    
    func tie() {
        turnlabel.text = "Tie"
        turnlabel.textColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        reverse_button.isEnabled=true
        reverse_button.setTitle("Restart", for: .normal)
    }
    
    func resetboard() {
        turn = 2
        r = 0
        w = 0
        w2 = 0
        for i in 0...41 {
            s[i]=0
        }
        turnlabel.text = "green                   turn"
        turnlabel.textColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        reverse_button.setTitle("Reverse!", for: .normal)
        changeimg(a: -1)
    }
    
    func win() {
        var c = 0
        var c2 = 0
        for i in 0...6 {
            c = s[i*6]
            if c > 0 {
                for j in 1...5 {
                    if s[i*6+j] == c && c > 0 {
                        c2 = c2 + 1
                        if c2 == 3 {
                            if w > 0 && w != c {
                                w2 = 1
                            }
                            else {
                                w = c
                            }
                        }
                    }
                    else {
                        if s[i*6+j] > 0 {
                            c = s[i*6+j]
                        }
                        else {
                            c = 0
                        }
                        c2=0
                    }
                }
            }
            c2 = 0
        }
        for i in 0...5 {
            c = s[i]
            for j in 1...6 {
                if s[j*6+i] == c && c > 0 {
                    c2 = c2 + 1
                    if c2 == 3 {
                        if w > 0 && w != c {
                            w2 = 1
                        }
                        else {
                            w = c
                        }
                    }
                }
                else {
                    if s[j*6+i] > 0 {
                        c=s[j*6+i]
                    }
                    else {
                        c=0
                    }
                    c2=0
                }
            }
            c2=0
        }
        for i in 0...2 {
            c = s[i]
            for j in 1...5 {
                if s[j*7+i] == c && c > 0  && (j * 7 + i) % 6 < 7 {
                    c2 = c2 + 1
                    if c2 == 3 {
                        if w > 0 && w != c {
                            w2 = 1
                        }
                        else {
                            w = c
                        }
                    }
                }
                else {
                    if s[j*7+i] > 0  && (j * 7 + i) % 6 < 7 {
                        c=s[j*7+i]
                    }
                    else {
                        c=0
                    }
                    c2=0
                }
            }
            c2=0
        }
        for i in 1...3 {
            c = s[i*6]
            for j in 1...5 {
                if (j * 7 + i*6) / 6 < 6 {
                    if s[j*7+i*6] == c && c > 0 {
                        c2 = c2 + 1
                        if c2 == 3 {
                            if w > 0 && w != c {
                                w2 = 1
                            }
                            else {
                                w = c
                            }
                        }
                    }
                    else {
                        if s[j*7+i*6] > 0 {
                            c=s[j*7+i*6]
                        }
                        else {
                            c=0
                        }
                        c2=0
                    }
                }
            }
            c2=0
        }
        for i in 3...5 {
            c = s[i*6]
            for j in 1...5 {
                if (i*6-j*5)>0 {
                    if s[i*6-j*5] == c && c > 0 {
                        c2 = c2 + 1
                        if c2 == 3 {
                            if w > 0 && w != c {
                                w2 = 1
                            }
                            else {
                                w = c
                            }
                        }
                    }
                    else {
                        if s[i*6-j*5] > 0 {
                            c=s[i*6-j*5]
                        }
                        else {
                            c=0
                        }
                        c2=0
                    }
                }
            }
            c2=0
        }
        for i in 0...2 {
            c = s[i+36]
            for j in 1...5-i {
                if s[i+36-j*5] == c && c > 0 {
                    c2 = c2 + 1
                    if c2 == 3 {
                        if w > 0 && w != c {
                            w2 = 1
                        }
                        else {
                            w = c
                        }
                    }
                }
                else {
                    if s[i+36-j*5] > 0 {
                        c=s[i+36-j*5]
                    }
                    else {
                        c=0
                    }
                    c2=0
                }
            }
            c2=0
        }
    }

    @IBAction func exit_button(_ sender: UIButton) {
        exit1.text="要回到主畫面了嗎?"
        exit2.backgroundColor = UIColor(displayP3Red: 0.89411765, green: 0.8627451, blue: 0.53333333, alpha: 1.0)
        exit3.setTitle("   是！", for: .normal)
        exit3.backgroundColor = UIColor(displayP3Red: 0.98431373, green: 1.0, blue: 0.87843137, alpha: 1.0)
        exit3.isEnabled = true
        exit4.setTitle("   否！", for: .normal)
        exit4.backgroundColor = UIColor(displayP3Red: 0.98431373, green: 1.0, blue: 0.87843137, alpha: 1.0)
        exit4.isEnabled = true
    }
    @IBAction func exit_button2(_ sender: UIButton) {
        exit1.text=""
        exit2.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        exit3.setTitle("", for: .normal)
        exit3.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        exit3.isEnabled = false
        exit4.setTitle("", for: .normal)
        exit4.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        exit4.isEnabled = false
    }
    
    @IBOutlet weak var turnlabel: UILabel!
    @IBOutlet weak var reverse_button: UIButton!
    @IBOutlet var img: [UIImageView]!
    @IBOutlet weak var p1: UIButton!
    @IBOutlet weak var p2: UIButton!
    @IBOutlet weak var p3: UIButton!
    @IBOutlet weak var p4: UIButton!
    @IBOutlet weak var p5: UIButton!
    @IBOutlet weak var p6: UIButton!
    @IBOutlet weak var p7: UIButton!
    @IBOutlet weak var exit1: UILabel!
    @IBOutlet weak var exit2: UILabel!
    @IBOutlet weak var exit3: UIButton!
    @IBOutlet weak var exit4: UIButton!
    
}

