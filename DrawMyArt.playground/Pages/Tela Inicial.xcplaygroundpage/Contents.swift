//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "Sweethampton", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

//for family in UIFont.familyNames.sorted(){
//        let names = UIFont.fontNames(forFamilyName: family)
//        print("Family: \(family) Font names:\(names)")
//    }

class MyViewController : UIViewController {
    
    
    let label = UILabel()
    let fonte = UIFont(name: "BlackBruno", size: 100)
    let playButton = UIButton()
    let fotoPlay = UIImage(named: "play-button")
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3380132914, green: 0.6760947108, blue: 0.8772349954, alpha: 1)
        
        label.frame = CGRect(x: 400, y: -300
            , width: 1000, height: 1000)
        label.text = "DrawMyArt"
        label.textColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
        
        label.font = UIFont(name: "Sweethampton", size: 150)
        
        
        //let playButton = UIButton()
        playButton.frame = CGRect(x: 550, y: 400, width: 350, height: 350)
        //        button.setTitle("DrawMyArt", for: .normal)
        //        button.setTitleColor(.black, for: .normal)
        playButton.setImage(fotoPlay, for: .normal)
        
        
        playButton.addTarget(self, action: #selector(clicou), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(playButton)
        self.view = view
    }
    
    @IBAction func clicou() {
//        print("clicou")
        navigationController?.show(viewPrincipal, sender: nil)
        
    }
}



class ViewPrincipal: UIViewController{
    let backButton = UIButton()
    let label = UILabel()
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .red
        
        backButton.frame = CGRect(x: 550, y: 400, width: 350, height: 350)
        backButton.setImage(UIImage(named:"play-button"), for: .normal)
//        backButton.setTitle("oi", for: .normal)
//        backButton.setTitleColor(.black, for: .normal)
        backButton.backgroundColor = .blue
        
        label.frame = CGRect(x: 400, y: -300
            , width: 1000, height: 1000)
        label.text = "DrawMyArt"
        label.textColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
        
        label.font = UIFont(name: "Sweethampton", size: 150)
        
        
        backButton.addTarget(self, action: #selector(voltar), for: .touchUpInside)
        
        
        
        view.addSubview(backButton)
        view.addSubview(label)
        self.view = view
        
    }
    @IBAction func voltar() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
// Present the view controller in the Live View window
let viewPrincipal = ViewPrincipal()
let myViewController = MyViewController()
let navigation = UINavigationController(screenType: .ipadPro12_9, isPortrait: false)
navigation.navigationBar.isHidden = true
navigation.pushViewController(myViewController, animated: true)
//let vc = MyViewController(screenType: .ipadPro12_9, isPortrait: false)
PlaygroundPage.current.liveView = navigation.scale(to: 0.3)
