//
//  main.swift
//  deal-cards
//
//  Created by TNT on 2018/7/26.
//  Copyright © 2018年 TNT. All rights reserved.
//

import Foundation

struct card {
    var color: Int //用数字代表扑克牌花色，0:♦️ 1:♣️ 2:♥️ 3:♠️
    var number: Int //用数字代表扑克牌大小，3:3 4:4 ～ 10:10 11:J 12:Q 13:K 14:A 15:2 16:鬼
    //大鬼，number:16,color:0;小鬼：number:16,color:1
}
//52张牌，除大小鬼，四个玩家
func randomCard()->[[card]]{
    let card1 = card(color: 0, number: 0)
    var totCard = [card](repeating: card1, count: 52)
    var count = 0
    for i in 0...3{
        for j in 3...15{
            totCard[count].color = i;
            totCard[count].number = j;
            count=count+1
        }
    }
    for i in 1...totCard.count{
        let index = Int(arc4random())%i;
        totCard.swapAt(i-1, index)
    }
    var cards1 = [card](repeating: card1, count: 13)
    var cards2 = [card](repeating: card1, count: 13)
    var cards3 = [card](repeating: card1, count: 13)
    var cards4 = [card](repeating: card1, count: 13)
    
    for i in 0...12{
        cards1[i]=totCard[i]
        cards2[i]=totCard[i+13]
        cards3[i]=totCard[i+26]
        cards4[i]=totCard[i+39]
    }
    let fourCards : [[card]]=[cards1, cards2, cards3, cards4]
    return fourCards
}
//54张牌，带打小鬼，三个玩家，参数为为地主的玩家，可取1，2，3
func randomCard(host : Int)->[[card]]{
    let card1 = card(color: 0, number: 0)
    var totCard = [card](repeating: card1, count: 54)
    var count = 0
    for i in 0...2{
        for j in 3...16{
            if j==16&&i==2{
                break;
            }
            totCard[count].color = i;
            totCard[count].number = j;
            count=count+1
        }
    }
    for i in 1...totCard.count{
        let index = Int(arc4random())%i;
        totCard.swapAt(i-1, index)
    }
    var cards1 = [card](repeating: card1, count: 20)
    var cards2 = [card](repeating: card1, count: 17)
    var cards3 = [card](repeating: card1, count: 17)
    for i in 0...19{
        cards1[i]=totCard[i]
        if i<17{
            cards2[i]=totCard[i+20]
            cards3[i]=totCard[i+37]
        }
    }
    var threeCards:[[card]]=[cards1,cards2,cards3]
    threeCards.swapAt(0, host-1)
    return threeCards
}
let cards=randomCard(host:3)
print(cards)

