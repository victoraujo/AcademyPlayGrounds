import Foundation

public class Desenho{
    
    public var nome: String
    public var foto: String
    public var artista: Artista
    
    
    
    public init(nome:String, foto: String, artista: Artista){
        self.nome = nome
        self.artista = artista
        self.foto = foto
    }
}
