import Foundation
import UIKit
import PlaygroundSupport

public class ViewInicial : UIViewController {
    
    
    let label = UILabel()
    let fonte = UIFont(name: "BlackBruno", size: 100)
    let playButton = UIButton()
    let fotoPlay = UIImage(named: "play-button")
    let teste = UIImageView(image: UIImage(named: "frame-2"))
    
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3380132914, green: 0.6760947108, blue: 0.8772349954, alpha: 1)
        
        label.frame = CGRect(x: 0, y: -300
            , width: 1366, height: 1000)
        label.text = "DrawMyArt"
        label.textAlignment = .center
//        label.textColor = #colorLiteral(red: 0.09385468811, green: 0.311653018, blue: 0.5091826916, alpha: 1)
//        label.textColor = .white
        label.font = UIFont(name: "orangejuice", size: 200)
        
        
        //let playButton = UIButton()
        playButton.frame = CGRect(x: 550, y: 400, width: 350, height: 350)
        teste.frame = CGRect(x: 550, y: 400, width: 350, height: 350)
        //        button.setTitle("DrawMyArt", for: .normal)
        //        button.setTitleColor(.black, for: .normal)
        playButton.setImage(fotoPlay, for: .normal)
        //        playButton.imageView?.layer.cornerRadius = 200
        
        playButton.addTarget(self, action: #selector(clicou), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(playButton)
//        view.addSubview(teste)
        self.view = view
    }
    
    @IBAction func clicou() {
        //        print("clicou")
        navigationController?.show(viewEscolha, sender: nil)
        
    }
}





let viewEscolha = ViewEscolha(screenType: .ipadPro12_9, isPortrait: false)
