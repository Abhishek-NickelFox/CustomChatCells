//
//  ViewController.swift
//  ChatBot
//
//  Created by Abhishek on 29/05/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

struct CellModel {
    var text: String
    var contentType: Int /* 1 = send 2 = receive */
}

class ViewController: UIViewController {
    
    @IBOutlet weak var botTableView: UITableView!
    @IBOutlet weak var sendTxtView: UITextView!

    var msgArray: [CellModel]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendAction(_ sender: Any) {
        
        msgArray?.append(CellModel(text: sendTxtView.text, contentType: 1))
        msgArray?.append(CellModel(text: sendTxtView.text, contentType: 2))
        botTableView.reloadData()
        
        DispatchQueue.main.async {
            self.moveTableView()
        }
    }
    
    func moveTableView() {
        
        if (botTableView.contentSize.height > botTableView.frame.size.height)
        {
            let offSet = CGPoint(x: 0, y: botTableView.contentSize.height - botTableView.frame.size.height)
            botTableView.setContentOffset(offSet, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable() {
    
        botTableView.delegate = self
        botTableView.dataSource = self
        
        msgArray = [CellModel(text: "2131331332", contentType: 1),
                    CellModel(text: "213133wq1332", contentType: 2),
                    CellModel(text: "213133wqwq1332", contentType: 1),
                    CellModel(text: "21313wq231332", contentType: 2)]
        
        let sendNib = UINib(nibName: "SendMsgTableCell", bundle: nil)
        let receviceNib = UINib(nibName: "ReceiveMsgTableCell", bundle: nil)
        botTableView.register(sendNib, forCellReuseIdentifier: "SendMsgTableCell")
        botTableView.register(receviceNib, forCellReuseIdentifier: "ReceiveMsgTableCell")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (msgArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = (msgArray?[indexPath.row])! as CellModel

        if model.contentType == 1 { /* SendMsgTableCell.defaultReuseIdentifier */
            let sendCell = tableView.dequeueReusableCell(withIdentifier: "SendMsgTableCell") as! SendMsgTableCell
            sendCell.txtLabel.text = model.text
            return sendCell
        }
        else {
            let receiveCell = tableView.dequeueReusableCell(withIdentifier: "ReceiveMsgTableCell") as! ReceiveMsgTableCell
            receiveCell.txtLabel.text = model.text
            return receiveCell
        }
    }
}

