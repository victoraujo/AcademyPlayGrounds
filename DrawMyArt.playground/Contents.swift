//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    
    let label = UILabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Miss You, World!"
        label.textColor = .black

        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        button.setTitle("DrawMyArt", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        
        button.addTarget(self, action: #selector(clicou), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(button)
        self.view = view
    }
    
    @IBAction func clicou() {
        print("oi")
        label.text="Opa"
    }
}
// Present the view controller in the Live View window
let vc = MyViewController(screenType: .ipadPro12_9, isPortrait: false)
PlaygroundPage.current.liveView = vc.scale(to: 0.4)
