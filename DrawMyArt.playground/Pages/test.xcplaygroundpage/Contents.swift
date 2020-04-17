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
    
    public override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 32, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 160, height: 150)
        
        
        myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 30, width: 400, height: 150), collectionViewLayout: layout)
        
        //: Note que agora é diferente. Estamos usando CachorroCollectionViewCell, classe que está definida logo abaixo
        myCollectionView?.register(DesenhoCollectionViewCell.self, forCellWithReuseIdentifier: "MinhaCellCustomizada")
        myCollectionView?.backgroundColor = UIColor.white
        myCollectionView?.dataSource = self
        
        //: Agora a collection view também tem um delegate, que é esse view controller que você está lendo o loadView agora :)
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView!)
        
        
        
        self.view = view
    }
}


class DesenhoCollectionViewCell: UICollectionViewCell {
    //: ambas as propriedades são definidas como let para evitar que sejam alteradas. O nosso ViewController precisa alterar apenas o conteúdo das propriedades imageView.image e labelRaca.text
    public let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y:0, width: 160, height: 150))
    
    public override init(frame: CGRect){
        super.init(frame:frame)
        self.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

PlaygroundPage.current.liveView = ViewEscolha()
