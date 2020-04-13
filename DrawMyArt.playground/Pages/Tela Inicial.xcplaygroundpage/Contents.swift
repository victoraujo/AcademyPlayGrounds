//: #                    DrawMyArt

import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "Sweethampton", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

//for family in UIFont.familyNames.sorted(){
//        let names = UIFont.fontNames(forFamilyName: family)
//        print("Family: \(family) Font names:\(names)")
//    }

//: ### Tela Inicial

class ViewInicial : UIViewController {
    
    
    let label = UILabel()
    let fonte = UIFont(name: "BlackBruno", size: 100)
    let playButton = UIButton()
    let fotoPlay = UIImage(named: "play-button")
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3380132914, green: 0.6760947108, blue: 0.8772349954, alpha: 1)
        
        label.frame = CGRect(x: 0, y: -300
            , width: 1366, height: 1000)
        label.text = "DrawMyArt"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
        label.font = UIFont(name: "Sweethampton", size: 150)
        
        
        //let playButton = UIButton()
        playButton.frame = CGRect(x: 550, y: 400, width: 350, height: 350)
        //        button.setTitle("DrawMyArt", for: .normal)
        //        button.setTitleColor(.black, for: .normal)
        playButton.setImage(fotoPlay, for: .normal)
        //        playButton.imageView?.layer.cornerRadius = 200
        
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


//: ### Tela Principal
class ViewPrincipal: UIViewController{
    
    
//    @IBOutlet weak var mainImageView: UIImageView!
//    @IBOutlet weak var tempImageView: UIImageView!
    
    var mainImageView = UIImageView( )//frame: CGRect(x: 0, y: 0, width: 1366, height: 1024))
    var tempImageView = UIImageView()//frame: CGRect(x: 0, y: 0, width: 1366, height: 1024))
    
    
    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 50.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    let backButton = UIButton()
    let label = UILabel()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }
      swiped = false
      lastPoint = touch.location(in: view)
        //print(lastPoint)
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
      // 1
      UIGraphicsBeginImageContext(view.frame.size)
      guard let context = UIGraphicsGetCurrentContext() else {
        return
      }
        //print(fromPoint,"   ", toPoint)
        tempImageView.image?.draw(in: view.bounds)
        //print(view.bounds)
      // 2
      context.move(to: fromPoint)
      context.addLine(to: toPoint)
      
      // 3
      context.setLineCap(.round)
      context.setBlendMode(.normal)
      context.setLineWidth(brushWidth)
      context.setStrokeColor(color.cgColor)
      
      // 4
      context.strokePath()
      
      // 5
      tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
      tempImageView.alpha = opacity
      UIGraphicsEndImageContext()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }

      // 6
      swiped = true
      let currentPoint = touch.location(in: view)
      drawLine(from: lastPoint, to: currentPoint)
        
      // 7
      lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      if !swiped {
        // draw a single point
        drawLine(from: lastPoint, to: lastPoint)
      }
        
      // Merge tempImageView into mainImageView
      UIGraphicsBeginImageContext(mainImageView.frame.size)
      mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
      tempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
      mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
        
      tempImageView.image = nil
    }
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        let viewPaint = UIView()
        viewPaint.backgroundColor = nil
//        view.addSubview(mainImageView)
//        view.addSubview(tempImageView)
        mainImageView.backgroundColor = .blue
        tempImageView.backgroundColor = nil
        tempImageView.image = nil
        view.addSubview(mainImageView)
        view.addSubview(tempImageView)
        self.view = view
        
    }
    @IBAction func voltar() {
        navigationController?.popViewController(animated: true)
    }
}


// Present the view controller in the Live View window
let viewPrincipal = ViewPrincipal(screenType: .ipadPro12_9, isPortrait: false)
let viewInicial = ViewInicial(screenType: .ipadPro12_9, isPortrait: false)
let navigation = UINavigationController(screenType: .ipadPro12_9, isPortrait: false)
navigation.navigationBar.isHidden = false
navigation.pushViewController(viewInicial, animated: true)
//let vc = MyViewController(screenType: .ipadPro12_9, isPortrait: false)
PlaygroundPage.current.liveView = navigation.scale(to: 0.3)
