import Foundation
//import UIKit


//1
var str = "Hello, playground"
var n1 = 3
var n2 = 3.5
//2
let n3:Int = 25
let s1:String="hello"
let s2:String = "boy"
//3
let conc:String = str+String(n2)
let conc2:String=" \(str) \(n2)"
//4
var fruits = ["apple", "orange", "pear"]
var noises:[String:String] = ["cat": "meow!", "dog": "bark!"]
//5
fruits.append("ploom")
noises["cow"]="mooo"
//6
var lotto:[String:[Int]]=["29-11-14":[4,5,21,30,31,49],"27-11-14":[5,8,10,19,23,40]]
//7
var chars=[Character:Int]()
//8
for i in 1...10 {
    chars[Character(UnicodeScalar(64+i)!)]=i
}
print(chars)
//9
for(date,numbers) in lotto{
    print("losowanie dnia \(date): ")
    for n in numbers{
        print("- \(n)")
    }
}
//10
func nwd(a:Int,b:Int)-> Int{
    var s=a
    var e=b
    while(s != e){
        if(s>e){
            s-=e
        }else{
            e-=s
        }
    }
    return s
}
//11
func nwdmod(a:Int,b:Int)-> (Int,Int,Int){
    var s=a
    var e=b
    while(s != e){
        if(s>e){
            s-=e
        }else{
            e-=s
        }
    }
    return(s,a/s,b/s)
}
//12
func cipher(word:String, func:((Character) -> Character)) -> String{
    let uppercased:String=word.uppercased()
    var coded:String=""
    for char in uppercased{
        coded.append(cipherMapper(char: char))
    }
    return coded
}
func cipherMapper(char:Character)->Character{
    let map: [Character: Character] = ["A": "G", "G": "A", "D": "E", "E": "D", "P": "O", "O": "P", "R": "Y", "Y": "R", "L": "U", "U": "L", "K": "I", "I": "K"]
    if map.index(forKey:char) != nil {
        return map[char]!
    }else{
        return char
    }
}
print(cipher(word: "hello", func: cipherMapper))
//13
var lotto2=[String:[Int]]()
for(date,numbers) in lotto{
    lotto2[date]=numbers.map({(number: Int) -> Int in
    if number % 2==0 {
        return 0
    }else{
        return 1
    }
})
}
print(lotto2)
//14
class NamedObject{
    var name: String
    init(name: String) {
        self.name = name
    }
    func describe()->String{
        return "NameObject \(name)"
    } 
}
let obj=NamedObject(name:"Name")
print(obj.describe())
//15
class Sphere:NamedObject{
    var radius: Double
    var capacity: Double{
        get{
            return (4/3)*Double.pi*pow(radius,3)
        }
        set(cap){
            radius=pow(((cap*3/4)/Double.pi),1/3)
        }

    }
    init(name: String,radius: Double) {
        self.radius=radius
        super.init(name: name) 

    }
    override func describe()->String{
        return "NameObject \(name), radius: \(radius) and capacity= \(capacity)"
    } 

}
let obj2=Sphere(name:"Name",radius:3)
print(obj2.describe())
obj2.capacity=150
print(obj2.describe())
