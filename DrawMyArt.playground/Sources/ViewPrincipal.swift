import Foundation
import UIKit
import PlaygroundSupport

 public class ViewPrincipal: UIViewController{
    
    
//    @IBOutlet weak var mainImageView: UIImageView!
//    @IBOutlet weak var tempImageView: UIImageView!
    
    var mainImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 1366, height: 1024))
    var tempImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 1366, height: 1024))
    var previewImageView = UIImageView (frame: CGRect(x: 775, y: 565, width: 150, height: 150))
    var widthSlide = UISlider()
    var widthLabel = UILabel()
    var widthChosen: CGFloat = 20.0
    var opacitySlide = UISlider()
    var opacityLabel = UILabel()
    var opacityChosen: CGFloat = 1
    var redSlide = UISlider()
    var redLabel = UILabel()
    var redChosen: CGFloat = 0.0
    var greenSlide = UISlider()
    var greenLabel = UILabel()
    var greenChosen: CGFloat = 0.0
    var blueSlide = UISlider()
    var blueLabel = UILabel()
    var blueChosen: CGFloat = 0.0
    var colorChosen = UIColor()
    var label = UILabel()
    public var instaLabel = UILabel()
    
    
    public var imagemView: UIImageView?
    var myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 683, height: 1024))
    var pinterestView = UIImageView()
    
    
    
    let pencilButton = UIButton()
    let fotoPencil = UIImage(named: "pencil")
    let clearButton = UIButton()
    let fotoClear = UIImage(named: "garbage")
    let eraserButton = UIButton()
    let fotoEraser = UIImage(named: "eraser")
    let colorButton = UIButton()
    let fotoColor = UIImage(named: "pintura")
//    let frame = UIImageView(image: UIImage(named: "frame-2"))
    var frame = UIButton()
    
    
    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 20.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    let backButton = UIButton()
    var labels = UILabel()
    
    public var desenhoEscolhido: Desenho?
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        if lastPoint.x >= 683, toPoint.x >= 683 {
            
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
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        pencilButton.setImage(fotoPencil, for: .normal)
        pencilButton.frame = CGRect(x: 713, y: 30, width: 50, height: 50)
        clearButton.setImage(fotoClear, for: .normal)
        clearButton.frame = CGRect(x: 1253, y: 30, width: 50, height: 50) // x:1286
        eraserButton.setImage(fotoEraser, for: .normal)
        eraserButton.frame = CGRect(x: 893, y: 30, width: 55, height: 55)
        colorButton.setImage(fotoColor, for: .normal)
        colorButton.frame = CGRect(x: 1073, y: 30, width: 50, height: 50)
        tempImageView.backgroundColor = nil
        tempImageView.image = nil
        
//        frame.frame = CGRect(x: 283 , y: 112, width: 800, height: 800)
        frame.frame = CGRect(x: 383 , y: 482, width: 600, height: 310)
        frame.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.909380351, alpha: 1)
        frame.backgroundColor = .white
        frame.layer.cornerRadius = 30
        frame.layer.borderWidth = 10
        frame.layer.borderColor = #colorLiteral(red: 0.09385468811, green: 0.311653018, blue: 0.5091826916, alpha: 1)
        frame.isHidden = true
        
        
        instaLabel.text = "@none"
        instaLabel.frame = CGRect(x: 85, y: 900, width: 300, height: 35)
        instaLabel.font = UIFont(name: "arial",size: 25)
        
        imagemView = UIImageView(frame: CGRect(x: 0, y: 167, width: 683, height: 650))
        imagemView?.image = UIImage(named: desenhoEscolhido?.foto ?? "leg.jpg")
        
        pinterestView = UIImageView(frame: CGRect(x: 45, y: 900, width: 35, height: 35))
        pinterestView.image = UIImage(named: "instagram")
        
        myImageView.backgroundColor = #colorLiteral(red: 0.9520815496, green: 1, blue: 1, alpha: 1)
        
        
        
        labels.frame = CGRect(x: 0, y: 0
            , width: 683, height: 200)
        labels.text = "DrawMyArt"
        labels.textAlignment = .center
//        labels.textColor = #colorLiteral(red: 0.09385468811, green: 0.311653018, blue: 0.5091826916, alpha: 1)
//        labels.textColor = .white
        labels.font = UIFont(name: "orangejuice", size: 100)
        
        
        
        
        widthChosen = brushWidth
        widthSlide.value = Float(widthChosen/100)
        widthLabel.text = String(Int(widthChosen))
        widthSlide.frame = CGRect(x: 450, y: 525, width: 200, height: 20)
        widthLabel.frame = CGRect(x: 700, y: 525, width: 200, height: 20)
        
        opacityChosen = opacity
        opacitySlide.value = Float(opacityChosen)
        opacityLabel.text = String(Int(opacityChosen*100)) + "%"
        opacitySlide.frame = CGRect(x: 450, y: 575, width: 200, height: 20)
        opacityLabel.frame = CGRect(x: 700, y: 575, width: 200, height: 20)
        
        colorChosen = color
        redSlide.value = 0
        greenSlide.value = 0
        blueSlide.value = 0
        redChosen = 0
        greenChosen = 0
        blueChosen = 0
        
        redLabel.text = String(Int(redChosen))
        greenLabel.text = String(Int(greenChosen))
        blueLabel.text = String(Int(blueChosen))
        redLabel.textColor = .red
        greenLabel.textColor = .green
        blueLabel.textColor = .blue

        widthLabel.isHidden = true
        widthSlide.isHidden = true
        opacityLabel.isHidden = true
        opacitySlide.isHidden = true
        redLabel.isHidden = true
        redSlide.isHidden = true
        greenLabel.isHidden = true
        greenSlide.isHidden = true
        blueLabel.isHidden = true
        blueSlide.isHidden = true
        previewImageView.isHidden = true

        redSlide.frame = CGRect(x: 450, y: 625, width: 200, height: 20)
        redLabel.frame = CGRect(x: 700, y: 625, width: 200, height: 20)
        greenSlide.frame = CGRect(x: 450, y: 675, width: 200, height: 20)
        greenLabel.frame = CGRect(x: 700, y: 675, width: 200, height: 20)
        blueSlide.frame = CGRect(x: 450, y: 725, width: 200, height: 20)
        blueLabel.frame = CGRect(x: 700, y: 725, width: 200, height: 20)
        
        
        
        
        clearButton.addTarget(self, action: #selector(clearDesenho), for: .touchUpInside)
        pencilButton.addTarget(self, action: #selector(pencil), for: .touchUpInside)
        eraserButton.addTarget(self, action: #selector(erase), for: .touchUpInside)
        widthSlide.addTarget(self, action: #selector(mudouWidth), for: .allTouchEvents)
        redSlide.addTarget(self, action: #selector(mudouColor), for: .allTouchEvents)
        greenSlide.addTarget(self, action: #selector(mudouColor), for: .allTouchEvents)
        blueSlide.addTarget(self, action: #selector(mudouColor), for: .allTouchEvents)
        opacitySlide.addTarget(self, action: #selector(mudouOpacity), for: .allTouchEvents)
        colorButton.addTarget(self, action: #selector(clicouConfig), for: .touchUpInside)

        
        view.addSubview(mainImageView)
        view.addSubview(tempImageView)
        view.addSubview(pencilButton)
        view.addSubview(clearButton)
        view.addSubview(eraserButton)
        view.addSubview(colorButton)
        view.addSubview(myImageView)
        view.addSubview(labels)
        view.addSubview(imagemView!)
        view.addSubview(pinterestView)
        view.addSubview(instaLabel)
        view.addSubview(frame)
        view.addSubview(widthSlide)
        view.addSubview(widthLabel)
        view.addSubview(redSlide)
        view.addSubview(redLabel)
        view.addSubview(greenSlide)
        view.addSubview(greenLabel)
        view.addSubview(blueSlide)
        view.addSubview(blueLabel)
        view.addSubview(opacitySlide)
        view.addSubview(opacityLabel)
        view.addSubview(previewImageView)
        


        self.view = view
        
    }
    @IBAction func voltar() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearDesenho() {
        mainImageView.image = nil
//        print(desenhoEscolhido?.nome as Any)

    }
    @IBAction func erase(){
        opacity = 1
        color = UIColor(red: 1, green: 1, blue: 1, alpha: opacity)
    }
    @IBAction func pencil(){
        opacity = opacityChosen
        color = colorChosen

    }
    
    @IBAction func mudouWidth(){
        widthChosen = CGFloat(widthSlide.value * 100)
        widthLabel.text = String(Int(widthChosen))
        brushWidth = widthChosen
        drawPreview()
    }
    @IBAction func mudouColor(){
        redChosen = CGFloat(redSlide.value * 250)
        redLabel.text = String(Int(redChosen))
    
        
        greenChosen = CGFloat(greenSlide.value * 250)
        greenLabel.text = String(Int(greenChosen))
    
        
        blueChosen = CGFloat(blueSlide.value * 250)
        blueLabel.text = String(Int(blueChosen))
    
        
        
        
        colorChosen = UIColor(red: redChosen/250,
        green: greenChosen/250,
        blue: blueChosen/250,
        alpha: opacity)
        
        color = colorChosen
        
        drawPreview()
    }
    
    @IBAction func mudouOpacity() {
        opacityChosen = CGFloat(opacitySlide.value)
        opacityLabel.text = String(Int(opacityChosen*100)) + "%"
        opacity = opacityChosen
        color.withAlphaComponent(opacity)
        colorChosen = UIColor(red: redChosen/250,
        green: greenChosen/250,
        blue: blueChosen/250,
        alpha: opacity)
        
        color = colorChosen
        drawPreview()
    }
    
    @IBAction func clicouConfig() {
//        show(viewDentro, sender: nil)
//        present(viewDentro,animated: true)
        if frame.isHidden == true {
            frame.isHidden = false
            widthLabel.isHidden = false
            widthSlide.isHidden = false
            opacityLabel.isHidden = false
            opacitySlide.isHidden = false
            redLabel.isHidden = false
            redSlide.isHidden = false
            greenLabel.isHidden = false
            greenSlide.isHidden = false
            blueLabel.isHidden = false
            blueSlide.isHidden = false
            previewImageView.isHidden = false

            
        }
        else {
            frame.isHidden = true
            widthLabel.isHidden = true
            widthSlide.isHidden = true
            opacityLabel.isHidden = true
            opacitySlide.isHidden = true
            redLabel.isHidden = true
            redSlide.isHidden = true
            greenLabel.isHidden = true
            greenSlide.isHidden = true
            blueLabel.isHidden = true
            blueSlide.isHidden = true
            previewImageView.isHidden = true

        }
        drawPreview()
    }
    
    
    
    public func drawPreview() {
        UIGraphicsBeginImageContext(previewImageView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setLineCap(.round)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.move(to: CGPoint(x: 75, y: 75))
        context.addLine(to: CGPoint(x: 75, y: 75))
        context.strokePath()
        previewImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    
    
    
    
    
    public class Dentro: UIViewController{
        
        public override func loadView() {
            let view2 = UIView()
            view2.frame = CGRect(x: 683, y: 500, width: 200, height: 200)
            view2.backgroundColor = .blue
            self.view = view2
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    let viewDentro = Dentro()
    
    
}


