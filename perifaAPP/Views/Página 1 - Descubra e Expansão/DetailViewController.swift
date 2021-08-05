//
//  DetailViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var imagemDoLocal: UIImageView!
    @IBOutlet weak var nomeDoEstabelecimento: UILabel!
    @IBOutlet weak var tSobre: UILabel!
    @IBOutlet weak var descricaoDoLocal: UITextView!
    @IBOutlet weak var tLocalizacao: UILabel!
    @IBOutlet weak var comoChegar: UILabel!
    @IBOutlet weak var bGoToMap: UIButton!
    
    
    var detail = 0
    
    //MARK: aqui, defino as variáveis com Arrays que conterão as características dos estabelecimentos ligados no storyboard, sendo elas o Título, endereço e Imagem dos estabelecimentos. A descrição, por sua vez, ficará nesta página, pois não foi possível conectar na página anterior de DiscoverViewController.
    var imagemDosEstabelecimentos = [""]
    var titles = [""]
    var endereco = [""]
    let descricao = [
        
        //8. Galeria de Arte Urbana
        "A Favela Galeria é um projeto desenvolvido pelo Grupo OPNI desde 2009 e está localizada no bairro da Vila Flávia, no distrito de São Mateus, região periférica da zona leste de São Paulo. A ideia central do projeto é grafitar todos os muros, cantos, vielas e casas, transformando, assim, o bairro em uma grande galeria de arte urbana. Atualmente, conta com aproximadamente 200 intervenções. O processo curatorial é desenvolvido pelo próprio Grupo OPNI, que já trouxe para as ruas e vielas referências nacionais e internacionais. Em 2014, a Favela Galeria venceu na categoria “Territórios Culturais” o Prêmio Governador do Estado de São Paulo para a Cultura. Em 2016, foi uma das iniciativas contempladas pelo Prêmio Almerinda Farias Gama, da Secretaria Municipal de Promoção da Igualdade Racial.\n\nA arte na comunidade é também uma forma de elevar a autoestima dos moradores da região. Para tanto, são retratados personagens locais pelas paredes do bairro. As pessoas geralmente reconhecem a favela como um lugar para buscar drogas, a Favela Galeria se instalou no bairro para as pessoas buscarem arte. A ideia é que possa ser reconhecida oficialmente como um dos roteiros culturais da nossa cidade e, com isso, auxiliar a desenvolver a economia local. A partir de 2016, os artistas que colaboram com a construção do percurso de arte urbana também têm espaço para apresentar seus trabalhos em outros formatos, a Favela Galeria conta com um espaço físico onde acontecem exposições e os artistas podem comercializar obras.\n\nInstagram: @favelagaleria\n\nEmail: contato.favelagaleria@gmail.com\n\nSite: grupoopni.com.br",
        //2. cooperifa
        "Uma das principais iniciativas do movimento cultural e literário das periferias nos últimos anos, com a participação de diversos artistas e escritores do extremo sul de São Paulo.",
        //3. danca narrativa
        "Com participação do grupo de Londres Esprit Concrete, a Coletiva Oyasis - Mulheres bufálo está ministrando oficinas e workshops online e gratuitos sobre movimentação corporal enquanto ferramenta de liberdade de expressão e autoconhecimento. Mais informações: Comunicacao@bienal.org.br",
        //4. Bike-a-Thon
        "O Instituto AROMEIAZERO, junto com o Itaú Unibanco, vai apoiar iniciativas que utilizem a bicicleta para melhorar a qualidade de vida e/ou fortalecer a economia local de Cidade Tiradentes. As inscrições podem ser feitas até 15 de agosto. Serão pré-selecionadas 6 propostas que participarão de imersão com mentorias. Dentre elas, 4 serão premiadas com R$4 mil reais para serem desenvolvidas. Todo o processo de seleção e imersão será online. Link para inscrição: https://bit.ly/bikeathontiradentes",
        //5. fabrica de cultura
        "A Fábrica de Cultura Cidade Tiradentes, localizada na Zona Leste de São Paulo, está instalada em um edifício novo com 6.000 m² e conta com um teatro de 300 lugares, totalmente equipado para apresentações, além de estúdio de gravação de som.",
        //6. Casa de Cultura Municipal Hip Hop Leste
        "A Casa de Cultura Municipal de Cidade Tiradentes – HIP HOP Leste, equipamento público da Secretaria Municipal de Cultura, realiza atividades culturais voltados à formação, produção e fruição cultural em Cidade Tiradentes.",
        //7. Casa de cultura são mateus
        "A casa de cultura São Mateus existe desde 2007, desde então procura promover um trabalho de integração entre artistas populares de todas as linguagens.",
        
        //1. sarau suburbanos
        "O Sarau Suburbano acontece desde 04 de Maio de 2010, é realizado pela Suburbano Convicto Produções, com a apresentação do escritor Alessandro Buzo. Um sarau com DNA periférico, que já revelou vários talentos, local onde nasceu várias parcerias culturais, entre os frequentadores. Conta com uma média de 20 à 40 participações por edição (entre poetas e mcs), o recorde foi a edição de lançamento do CD “Contra Nós Ninguém Será” do Edi Rock, com 58 participações e a segunda maior participação numa edição foi 56 no lançamento do CD “Nó na Orelha” do CRIOLO, pelo Sarau Suburbano já passou grandes nomes da LITERATURA e do HIP HOP, como EDUARDO (ex-Facção), GOG, EMICIDA, RASHID, Marcelino Freire, Ferréz, entre outros e ainda de outros seguimentos, como a jornalista Eliane Brum e a sambista Leci Brandão. \n\nQuando: 05 de Setembro às 19h.",
        //9.  Atelie Azu
        "Criado por Élcio Torres em Ermelino Matarazzo, na zona leste, o Ateliê Azu é um empreendimento de azulejaria e cerâmica que busca entregar um trabalho artístico que ressignifica o espaço público. Realiza oficinas de cerâmicas artesanais na região.",
        //10.Horta Comunitária do Grupo Damata
        "Grupo de Sustentabilidade e Articulação Cultural da Cohab 2. Visa a valorização socioambiental do bairro com projetos socioculturais e construção da Horta Comunitária Da Mata. Integrante da rede de cultura popular Cordão Folclórico de Itaquera. ",
        //11. Okupação Cultural Coragem
        "Galeria de Arte e Cultura localizada na Cohab 2, em Itaquera. A galeria promove vários eventos com foco na periferia de SP. ",
        //12. Casa Cultural Raul Seixas
        "Oferece atividades gratuitas visando a difusão da produção cultural periférica e ofertar conteúdo artístico de qualidade para o público frequentador.",
        //13. Slam da Guilhermina
        "Slam da Guilhermina é uma batalha de poesias que acontece toda última sexta feira de cada mês ao lado do Metrô Guilhermina-Esperança, do lado esquerdo ao sair da catraca.",
        //14.Obra Social Dom Bosco
        "Iniciativa de desenvolvimento e formação profissional para jovens da periferia da zona leste de São Paulo.",
        //15. Casa Ecoativa
        "Centro eco-cultural na Ilha do Bororé, no Grajaú, zona sul de São Paulo. O espaço possui atividades culturais com artistas locais, workshops, iniciativas de aprendizagem ecológica e fomento da cultura ambiental na região.",
        //16. Centro Cultural Arte em Construção
        "Em 2004, o Instituto Pombas Urbanas, através de contato com a COHAB – Companhia Metropolitana de Habitação instaura sua sede em um galpão de 1.600m² abandonado situado na principal avenida do bairro Cidade Tiradentes, extremo leste da capital de São Paulo. O espaço é chamado de Centro Cultural Arte em Construção simbolizando a estruturação física do galpão para tornar-se um espaço cultural comunitário.",
        
        //0.SPCine
        "O Circuito SPCine é uma iniciativa que busca levar o acesso ao Cinema a diversas regiões de São Paulo. O cinema tem como proposta o acesso a obras audiovisuais independentes ou de grande bilheteria à preço popular. Os ingressos custam R$ 4,00 (inteira) e R$ 2,00 (meia entrada para estudantes e beneficiários)."
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bGoToMap)
        
        descricaoDoLocal.text = descricao[detail]
        
        imagemDoLocal.image = UIImage(named: imagemDosEstabelecimentos[detail])
        
        nomeDoEstabelecimento.text = titles[detail]
        
        comoChegar.text = endereco[detail]
        
        
        
    }
    
    
    
}
