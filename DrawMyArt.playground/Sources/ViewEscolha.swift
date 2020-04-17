import Foundation
import UIKit
import PlaygroundSupport



public class ViewEscolha: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return desenhos.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MinhaCellCustomizada", for: indexPath) as? DesenhoCollectionViewCell
        
        //: Como myCell foi explicitamente convertida para CachorroCollectionViewCell, agora podemos acessar as propriedade imageView e labelRaca que definimos lá. Se a conversão na linha acima não fosse feita, isso não seria possível
        myCell?.imageView.image = UIImage(named: desenhos[indexPath.section].foto)
        return myCell!
    }
    
    var myCollectionView: UICollectionView?
    var desenhos: [Desenho] = Model.shared
    var label = UILabel()
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6420162671, green: 0.8424657534, blue: 1, alpha: 1)
        
        
        
        label.frame = CGRect(x: 0, y: 0
            , width: 1366, height: 297)
        label.text = "Choose your art"
        label.textAlignment = .center
//        label.textColor = #colorLiteral(red: 0.09385468811, green: 0.311653018, blue: 0.5091826916, alpha: 1)
        //        label.textColor = .white
        label.font = UIFont(name: "orangejuice", size: 150)
        
        
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
        layout.itemSize = CGSize(width: 600, height: 560)
        
        myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 297, width: 1366, height: 560), collectionViewLayout: layout)
        
        //: Note que agora é diferente. Estamos usando CachorroCollectionViewCell, classe que está definida logo abaixo
        myCollectionView?.register(DesenhoCollectionViewCell.self, forCellWithReuseIdentifier: "MinhaCellCustomizada")
        myCollectionView?.backgroundColor = #colorLiteral(red: 0.6420162671, green: 0.8424657534, blue: 1, alpha: 1)
        myCollectionView?.dataSource = self
        
        //: Agora a collection view também tem um delegate, que é esse view controller que você está lendo o loadView agora :)
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView!)
        view.addSubview(label)
        
        
        
        self.view = view
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*: Aqui estamos usando o detalheVC é uma variável que é criada no final deste arquivo.
         Seguimos a mesma abordagem do playground de exemplo de view controllers.
        */
//        viewPrincipal.modalPresentationStyle = .fullScreen
//        //: IMPORTANTE: aqui estamos "passando um dado" de um view controller para o outro
        viewPrincipal.desenhoEscolhido = desenhos[indexPath.section]
        viewPrincipal.imagemView?.image = UIImage(named: viewPrincipal.desenhoEscolhido?.foto ?? "leg.jpg")
        viewPrincipal.instaLabel.text = desenhos[indexPath.section].artista.instagram
        navigationController?.show(viewPrincipal, sender: nil)
        

//        present(detalheVC, animated: true, completion: nil)
    }
    
    
    
}


class DesenhoCollectionViewCell: UICollectionViewCell {
    //: ambas as propriedades são definidas como let para evitar que sejam alteradas. O nosso ViewController precisa alterar apenas o conteúdo das propriedades imageView.image e labelRaca.text
    public let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y:0, width: 600, height: 560))

    public override init(frame: CGRect){
        super.init(frame:frame)
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
        self.addSubview(imageView)
            }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    

}


let viewPrincipal = ViewPrincipal(screenType: .ipadPro12_9, isPortrait: false)
