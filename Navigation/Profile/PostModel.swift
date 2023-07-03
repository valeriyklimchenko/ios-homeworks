//
//  PostModel.swift
//  Navigation
//
//  Created by Валерий Климченко on 07.06.2023.
//

import UIKit

struct PostModel {
    let author: String
    let  description: String
    let image: String
    var likes: Int
    let views: Int
    
    static func makePostModel() -> [PostModel] {
        var  model = [PostModel]()
        model.append(PostModel(author: "Анкилозавры",  description: "Анкилозавров можно назвать бронированными танками своего времени. Их тела были покрыты твердыми пластинами, костными наростами и шипами. Эти динозавры передвигались на четырех крепких, но коротких лапах. Самый известный представитель инфраотряда так и называется — анкилозавр", image: "Aнкилозавры", likes: 111, views: 111))
        model.append(PostModel(author: "Пахицефалозавры",  description: "Характерная особенность пахицефалозавров — крепкий череп с костяными наростами в области темени. У самых крупных динозавров он был толщиной 20—25 см. Весь инфраотряд назван в честь самого хорошо изученного представителя — пахицефалозавра.", image: "Пахицефалозавры", likes: 222, views: 222))
        model.append(PostModel(author: "Цератопсы",  description: "Инфраотряд цератопсов легко узнать по массивным головам, короткой шее, рогам и изогнутой морде, похожей на клюв. В переводе с латинского языка их название означает «рогатое лицо». Цератопсы были разных размеров, но большинство — ростом с быка или даже со слона. Они могли весить несколько тонн, так что далеко не каждый хищник рисковал сражаться с таким грозным противником. Самый яркий представитель этого инфраотряда—трицератопс.", image: "Цератопсы", likes: 333, views: 333))
        model.append(PostModel(author: "Стегозавры",  description: "Стегозавров легко узнать по шипам на хвосте и пластинкам на спине. Ученые выдвигают разные предположения, зачем они были нужны динозаврам, но однозначно ответить на этот вопрос пока не смогли. Весь инфраотряд назван в честь самого известного представителя—стегозавра.", image: "Стегозавры", likes: 444, views: 444))
        model.append(PostModel(author: "Орнитоподы",  description: "Первые птицетазовые динозавры были растительноядными. Они передвигались в основном на двух ногах, которые по строению очень напоминали птичьи. Поэтому их так и назвали - птиценогими, или орнитоподами. Со временем они развивались и становились крупнее. В результате появились все остальные группы птицетазовых динозавров.", image: "Орнитоподы", likes: 333, views: 333))
        
        return  model
    }
}
