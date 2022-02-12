//
//  ViewController.swift
//  TechPod
//
//  Created by Emily Nozaki on 2022/02/12.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //StoryBoardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    
    var imageNameArray = [String]()
    
    var audioPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはViewControllerに書くよ、という設定
        table.dataSource = self
        //テーブルビューのデリゲートソースメソッドはViewControllerに書くよ、という設定
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        fileNameArray = ["cannon","elise","aria"]
        
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
        
        
    }
    //セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をsongNameArrayの数にする
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させてみる
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
    //セルが押されたときに呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer = try! AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
    }
}


