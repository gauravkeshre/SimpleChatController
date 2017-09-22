//
//  ChatModel.swift
//  ZDF
//
//  Created by Gaurav Keshre on 21/09/17.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation

struct ChatModel {
    let senderName: String
    let message: String
    let date: String
    let isSentByMe: Bool
}
extension ChatModel {
    init(dict: [String: Any]) {
        self.senderName = dict["senderName"] as! String
        self.message = dict["message"] as! String
        self.date = dict["date"] as! String
        self.isSentByMe = dict["sentByMe"] as! Bool
    }
}

func fetchFakeChat() -> [ChatModel] {
    let arr = data.map{ChatModel(dict: $0)}
    return arr
}
let data = [
    [
        "senderName": "Iva Cooke",
        "message": "Cillum laborum commodo exercitation eiusmod esse. Officia ad labore labore eiusmod veniam laborum aliqua aliquip sunt deserunt pariatur. Labore labore ut magna quis consequat commodo exercitation cillum reprehenderit reprehenderit. Qui tempor sint exercitation et ex exercitation officia. Consectetur non aliqua nostrud consequat est.\r\n",
        "date": "2017-05-31T05:36:29 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Graham Gordon",
        "message": "Mollit magna aliquip eiusmod ut do proident minim sint duis enim eu. Mollit sint exercitation exercitation sit culpa ex ex irure laborum ex labore adipisicing. Irure laboris sit velit id nostrud ex occaecat aliquip aute aliqua voluptate magna ex. Quis enim fugiat ad tempor qui exercitation fugiat enim elit est dolore incididunt anim.\r\n",
        "date": "2015-10-20T10:21:29 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Margo Salinas",
        "message": "Officia voluptate incididunt laborum pariatur incididunt ipsum in ipsum commodo sunt aliquip incididunt ut. Cupidatat officia esse exercitation nisi aliquip sint ut aute pariatur tempor. Dolore nulla dolore ut ex aute velit laborum. In sunt pariatur labore pariatur occaecat nulla aliqua non adipisicing ullamco tempor. Commodo aliqua labore sint cupidatat fugiat consectetur aliqua occaecat id ipsum sit eiusmod culpa nisi.\r\n",
        "date": "2016-02-03T01:45:51 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Little Benjamin",
        "message": "Consectetur ad adipisicing cillum duis occaecat incididunt ipsum et nostrud occaecat fugiat. Aliqua dolor officia adipisicing anim qui. Dolore mollit pariatur ipsum et velit est culpa sint ut culpa laboris sint ex incididunt. Tempor dolore irure sit do laboris irure aliquip nulla aliquip tempor.\r\n",
        "date": "2017-06-11T05:59:43 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Rios Casey",
        "message": "Culpa ullamco do ea sunt eiusmod tempor commodo. Nisi deserunt ea tempor nulla reprehenderit aute cillum reprehenderit labore est est. Aute excepteur aliquip cupidatat commodo sit nisi ipsum ut in qui ullamco tempor aute. Incididunt eiusmod sunt anim eu. Id ullamco mollit excepteur anim deserunt irure duis cupidatat. Occaecat nisi proident eu ipsum eiusmod velit est.\r\n",
        "date": "2014-11-22T05:31:15 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Sanders Sweet",
        "message": "Dolore nisi cupidatat ea officia sunt officia elit irure pariatur. Occaecat sit proident laboris esse non excepteur exercitation consequat. Aute magna sunt tempor eu laboris et. Quis culpa occaecat sunt officia esse ea incididunt tempor ullamco non consectetur culpa est.\r\n",
        "date": "2015-09-03T08:52:39 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Collier Dixon",
        "message": "In eiusmod quis eiusmod adipisicing culpa adipisicing. Ad qui cillum officia officia esse consectetur ipsum minim. Voluptate quis nisi tempor qui enim Lorem sunt non nisi. Ea enim nulla laboris non nisi mollit. Sit eiusmod fugiat occaecat proident officia magna. Laboris cupidatat est adipisicing laborum id nostrud velit. Sint enim anim nulla ullamco mollit officia duis.\r\n",
        "date": "2015-10-25T07:05:33 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Adrian Roy",
        "message": "Deserunt ex duis ut irure aute deserunt Lorem enim. Excepteur aliquip officia nulla fugiat aliquip ex dolore nulla proident. Officia ipsum in dolore mollit adipisicing esse eiusmod fugiat sit aliqua officia. Ut qui anim duis ex irure adipisicing voluptate.\r\n",
        "date": "2016-06-30T05:17:23 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Lilian Joyner",
        "message": "Deserunt esse commodo incididunt ex Lorem culpa ea et. Nisi sit labore est pariatur excepteur nisi qui Lorem et quis et. Occaecat exercitation velit exercitation veniam consequat in eu et aliqua duis cillum. Culpa adipisicing irure velit minim. Est aliqua culpa ut anim et duis deserunt reprehenderit velit magna ipsum nulla.\r\n",
        "date": "2016-08-02T02:11:53 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Hubbard Bass",
        "message": "Tempor fugiat incididunt consectetur mollit enim et cupidatat eiusmod fugiat. Elit adipisicing laboris et aliqua cillum. Irure elit tempor ea proident eiusmod. Elit nisi culpa laboris Lorem nisi incididunt amet Lorem pariatur. Proident reprehenderit et mollit in ipsum id ipsum anim qui anim ad eiusmod. Ad ad excepteur nostrud quis voluptate reprehenderit.\r\n",
        "date": "2015-04-13T03:29:06 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Arlene Austin",
        "message": "Aute ex esse aute eiusmod ad laboris in aliquip proident adipisicing laboris aliquip irure. Laboris sint nostrud minim ullamco incididunt exercitation. Duis in aute nostrud sit non irure duis officia exercitation laborum est. Laboris elit pariatur commodo voluptate nisi. Eiusmod magna et ipsum cillum do id do occaecat consectetur ipsum reprehenderit. Ut deserunt id eu ex nostrud deserunt. Proident pariatur commodo nisi fugiat duis veniam quis.\r\n",
        "date": "2014-09-20T03:00:40 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Barbara Montgomery",
        "message": "Elit consequat mollit minim culpa anim ad consectetur do nisi. Cillum deserunt commodo nostrud ea sunt incididunt ea. Ex laboris ad non adipisicing nostrud pariatur exercitation est mollit aliqua occaecat deserunt.\r\n",
        "date": "2015-02-19T12:31:21 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Arline Frost",
        "message": "Commodo tempor elit reprehenderit ex pariatur minim id cupidatat adipisicing enim enim. Consequat exercitation aliqua minim sit nostrud aliqua labore anim exercitation magna esse ex mollit adipisicing. Nisi eu voluptate nulla occaecat Lorem veniam.\r\n",
        "date": "2016-03-19T08:03:22 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Maggie Lopez",
        "message": "Est enim eu sit tempor sint cillum ea deserunt proident eu consequat. Reprehenderit amet reprehenderit quis adipisicing est ea mollit eiusmod aliquip nulla minim. Reprehenderit id aliquip proident adipisicing eiusmod velit elit sit nostrud voluptate incididunt. Nulla minim nulla nulla est commodo ad tempor.\r\n",
        "date": "2017-05-27T06:51:36 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Bethany Mann",
        "message": "Aliquip sunt Lorem sint labore do est in esse sunt est eu. Commodo aliqua eiusmod nulla cupidatat. Et ullamco eiusmod exercitation laborum duis non. Id id officia mollit proident aliqua deserunt adipisicing labore proident ex. Cupidatat velit elit ut minim voluptate enim sint Lorem irure magna tempor do culpa cillum. Nulla sint amet laborum eiusmod officia adipisicing eu. Pariatur fugiat sunt laborum voluptate ut velit excepteur fugiat deserunt cupidatat velit ex cillum cillum.\r\n",
        "date": "2015-05-19T03:26:30 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Morgan Benton",
        "message": "Elit ea tempor in do. Do sunt sunt tempor ut commodo pariatur dolore tempor in laboris qui incididunt sunt. Ex non eiusmod minim duis voluptate incididunt adipisicing. Minim proident culpa deserunt incididunt consectetur adipisicing voluptate veniam mollit occaecat sint exercitation enim fugiat. Non cupidatat et qui culpa sunt proident id laboris aute ut consectetur. Sint pariatur sunt do enim eiusmod mollit ex cillum eu proident. Laborum aliqua minim consequat consectetur ex tempor proident proident qui occaecat occaecat cillum.\r\n",
        "date": "2016-01-03T09:32:27 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Garrett Parsons",
        "message": "Qui id cillum id commodo reprehenderit commodo. Duis pariatur elit veniam ea adipisicing aute. Irure labore ut labore ipsum Lorem adipisicing do do. Labore quis labore minim culpa consectetur proident do consectetur sint ipsum nulla fugiat.\r\n",
        "date": "2017-04-25T02:14:47 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Sally Ware",
        "message": "Pariatur deserunt labore ut aute officia cupidatat anim nostrud elit pariatur ea est. Sunt consectetur amet excepteur ea. Elit eu nostrud officia laborum dolore esse id mollit irure duis elit non commodo incididunt. Proident in ad magna adipisicing reprehenderit veniam minim ex nisi dolore aliquip nulla velit.\r\n",
        "date": "2014-11-26T11:50:19 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Noemi Maddox",
        "message": "Id mollit sunt eu eiusmod consectetur exercitation et tempor eu reprehenderit dolor nisi culpa magna. Lorem enim officia eiusmod sit aute. Eu quis ea culpa veniam.\r\n",
        "date": "2014-05-11T11:29:30 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Gutierrez Calhoun",
        "message": "Est sint reprehenderit sunt fugiat cupidatat incididunt sit. Amet minim esse culpa sunt. Veniam et exercitation nostrud cupidatat et labore ad amet ea culpa enim officia adipisicing enim. Eiusmod voluptate ipsum aliqua commodo eu est irure sint enim consectetur. Laboris ullamco ad exercitation ipsum laboris consectetur esse velit commodo labore eu. Sunt pariatur commodo est est quis anim.\r\n",
        "date": "2014-03-26T06:39:04 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Mcknight Logan",
        "message": "Ullamco minim voluptate do irure est laboris. Magna eu aute ipsum elit elit exercitation ad aliquip. Ullamco qui ex voluptate excepteur esse minim aute. Aute ex magna quis officia nisi. Est dolor elit occaecat in minim sit enim sit laboris voluptate ut irure aliquip.\r\n",
        "date": "2015-10-22T04:57:33 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Bridgett Maynard",
        "message": "Veniam esse nisi dolor dolore laboris aliquip. Cillum esse non id laboris aliquip nisi magna labore. Cillum consequat occaecat laborum esse nisi. Elit eu ullamco in cupidatat occaecat aliquip est.\r\n",
        "date": "2015-12-07T07:49:45 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Mallory Blair",
        "message": "Ullamco non ut in aliquip. Aliquip sit reprehenderit commodo ad irure consequat tempor do duis velit ea. Exercitation dolor in est Lorem. Nostrud magna dolor sint incididunt sit proident officia non. Adipisicing mollit fugiat proident velit proident elit.\r\n",
        "date": "2016-08-28T08:10:27 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Lakeisha Jones",
        "message": "Cupidatat sunt proident sit dolor nulla enim amet. Sunt irure consectetur occaecat minim. Elit exercitation Lorem cillum culpa excepteur mollit Lorem Lorem amet occaecat Lorem incididunt exercitation.\r\n",
        "date": "2015-04-15T07:48:37 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Wilkerson Byrd",
        "message": "Sit voluptate elit velit aliqua. Adipisicing magna est minim et consectetur qui laboris cillum consectetur est irure et. Veniam aute consectetur sunt qui.\r\n",
        "date": "2015-08-07T02:04:23 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Torres Wolf",
        "message": "Deserunt reprehenderit laboris esse non. Exercitation ad elit consequat mollit nulla labore culpa nisi pariatur. Eu exercitation aute anim et ea. Anim occaecat quis ex excepteur ea consectetur irure cupidatat nulla.\r\n",
        "date": "2014-11-27T06:23:27 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Sherry Williams",
        "message": "Exercitation labore minim sunt et occaecat. Ad minim sunt elit qui magna elit. Ex irure excepteur ut exercitation eiusmod amet officia pariatur qui reprehenderit id. Sint culpa non aliquip proident tempor irure anim. Deserunt sit consequat Lorem Lorem.\r\n",
        "date": "2016-11-12T07:44:45 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Juliana Chang",
        "message": "Culpa mollit amet exercitation aute ex ullamco. Veniam laboris irure cupidatat aliquip aliqua velit voluptate. Do ut enim commodo officia.\r\n",
        "date": "2015-02-13T09:27:01 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Nelson Witt",
        "message": "Enim ipsum dolore ullamco enim eiusmod commodo. Id voluptate commodo reprehenderit ea dolor irure nisi laboris dolor velit do. Ad dolor non ea elit occaecat occaecat exercitation ea anim mollit. Reprehenderit voluptate dolore ut deserunt esse ad elit occaecat tempor est culpa. Ad aliqua officia adipisicing excepteur nostrud Lorem sit anim occaecat. Sint reprehenderit aliqua ad laborum velit amet eiusmod culpa.\r\n",
        "date": "2014-01-13T12:13:28 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Althea Oconnor",
        "message": "Aliqua culpa ipsum cupidatat excepteur enim qui Lorem nisi. Consectetur commodo culpa proident consectetur pariatur exercitation laboris ut duis commodo aute sint. Eiusmod excepteur ut tempor dolore Lorem ipsum Lorem labore mollit occaecat eiusmod adipisicing. Amet eiusmod sint enim minim id et. Laborum ipsum ad deserunt dolor. Tempor officia est quis elit minim sunt ex aliqua incididunt cillum non nulla velit deserunt.\r\n",
        "date": "2014-10-08T07:16:45 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Roxanne Hardin",
        "message": "Sunt quis ullamco eiusmod deserunt. Occaecat aliquip amet cupidatat officia mollit. Laboris ex qui enim laborum do adipisicing occaecat non nulla exercitation labore. Et veniam commodo irure excepteur officia non incididunt ut. Eiusmod commodo qui ullamco dolor. Ut quis aliqua pariatur sunt pariatur. Est laboris excepteur do velit.\r\n",
        "date": "2017-06-26T04:42:27 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Virgie Castaneda",
        "message": "Deserunt voluptate pariatur cupidatat aliqua ut eu ipsum. Consectetur et irure pariatur cupidatat velit aute aliquip est tempor dolor do excepteur ea. Nulla culpa incididunt proident incididunt ut ea irure magna. Minim laboris minim nostrud anim ad.\r\n",
        "date": "2017-02-19T11:51:37 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Bridgette Fischer",
        "message": "Ex amet exercitation ipsum occaecat minim nulla voluptate nisi reprehenderit proident labore in. Incididunt adipisicing tempor exercitation velit anim Lorem tempor duis ex culpa laborum magna est. Est esse eu magna fugiat cupidatat veniam occaecat. Ullamco magna sit veniam eu. Quis proident mollit sunt consectetur est ad ullamco amet consequat commodo consequat. Enim sunt dolore officia eu deserunt. Tempor exercitation officia ea deserunt.\r\n",
        "date": "2014-11-20T11:34:40 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Norton Ratliff",
        "message": "Amet duis laboris commodo mollit excepteur. Labore magna laboris aliquip quis eu laboris. Consectetur ad irure consectetur elit reprehenderit reprehenderit.\r\n",
        "date": "2014-07-28T05:55:44 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Lindsay Small",
        "message": "Veniam commodo aute culpa consectetur proident enim exercitation cupidatat veniam. Do anim nostrud in id exercitation elit ipsum veniam aute aute ea fugiat commodo. Sit cillum adipisicing magna consectetur excepteur mollit minim incididunt. Est do sit anim fugiat veniam consequat Lorem culpa nostrud fugiat ea occaecat nulla reprehenderit. Id nulla Lorem qui deserunt mollit. Veniam esse proident fugiat laborum occaecat. Adipisicing consectetur reprehenderit quis est non.\r\n",
        "date": "2015-12-23T07:58:26 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Christa Lloyd",
        "message": "Ea ullamco Lorem proident officia consectetur duis labore officia esse non. Sit minim sunt nulla commodo eu. Eiusmod amet do ex adipisicing. Fugiat ex dolore officia dolor voluptate et nulla et voluptate. Sint non cupidatat deserunt do occaecat pariatur.\r\n",
        "date": "2016-03-08T11:41:00 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Mccray Holmes",
        "message": "Nulla in et non ex consectetur. Labore cillum nulla exercitation esse ut tempor. Laborum aute laborum eiusmod proident nostrud id elit consectetur anim in. Duis adipisicing reprehenderit ad labore dolore magna tempor aute nulla in do occaecat commodo elit.\r\n",
        "date": "2016-02-28T08:03:20 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Kay White",
        "message": "Id ex deserunt dolor mollit qui excepteur amet. Eu consequat qui est do non voluptate do qui. Enim est est est eu tempor deserunt sint cillum amet enim. Consequat consectetur proident nostrud est. Laboris reprehenderit excepteur laborum aliquip excepteur cillum. Pariatur nisi consequat fugiat consectetur ut Lorem voluptate cupidatat.\r\n",
        "date": "2016-10-27T04:17:54 -06:-30",
        "sentByMe": true
    ],
    [
        "senderName": "Dana Hanson",
        "message": "Quis nisi excepteur aliquip deserunt magna pariatur. Nisi duis ea sit consectetur ex consequat cupidatat ipsum incididunt laboris. Eiusmod cillum dolor ipsum commodo do. Excepteur irure do laboris commodo exercitation ex.\r\n",
        "date": "2016-09-15T07:19:39 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Kirk Anderson",
        "message": "Nulla ullamco tempor voluptate velit qui elit enim ullamco tempor. Sunt irure dolor est consectetur exercitation consectetur enim laborum sit sit non. Voluptate minim consectetur non proident officia amet duis cillum nostrud consectetur eu cupidatat velit. Proident deserunt nostrud irure exercitation cillum aute minim proident.\r\n",
        "date": "2015-12-20T08:28:59 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Cabrera Guerrero",
        "message": "Elit ea consectetur labore nisi laborum incididunt do laborum. Fugiat proident excepteur qui mollit exercitation consectetur deserunt nisi dolore amet ipsum reprehenderit nisi. Irure esse nulla dolore officia et fugiat velit.\r\n",
        "date": "2017-07-31T01:58:46 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Lilly Madden",
        "message": "Ea et excepteur excepteur deserunt ut pariatur occaecat nulla aliqua do veniam voluptate exercitation esse. Elit tempor dolor duis proident nostrud. Ipsum exercitation anim et elit.\r\n",
        "date": "2015-02-19T10:27:41 -06:-30",
        "sentByMe": false
    ],
    [
        "senderName": "Jodi Watkins",
        "message": "Fugiat amet duis est enim laboris aliquip cupidatat incididunt reprehenderit sint reprehenderit. Sunt quis sunt nostrud duis proident labore. Aute enim magna sint consectetur excepteur nostrud id laborum exercitation ad aute ad et.\r\n",
        "date": "2015-01-27T11:54:27 -06:-30",
        "sentByMe": true
    ]
]
