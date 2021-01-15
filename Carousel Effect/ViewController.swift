//
//  ViewController.swift
//  Carousel Effect
//
//  Created by Austin Zheng on 2021/1/13.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    var collectionView: UICollectionView!
    var dataSource: Array<CustomCellModel>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bgView = UIView(frame: self.view.bounds)
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = UIImage(named: "rcv_bg")
        bgView.addSubview(bgImageView)
        
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .dark)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        bgView.addSubview(blurView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.backgroundView = bgView
        collectionView.dataSource = self
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
    
        self.view.addSubview(collectionView)
        
        
        let model1 = CustomCellModel()
        model1.image = UIImage(named: "rcv_bg")

        let model2 = CustomCellModel()
        model2.image = UIImage(named: "rcv_bg")

        let model3 = CustomCellModel()
        model3.image = UIImage(named: "rcv_bg")

        let model4 = CustomCellModel()
        model4.image = UIImage(named: "rcv_bg")

        let model5 = CustomCellModel()
        model5.image = UIImage(named: "rcv_bg")

        dataSource = Array(arrayLiteral: model1,model2,model3,model4,model5)



        let segmentView = UISegmentedControl(items: ["FlowLayout","CustomLayout"])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white as AnyObject]
        segmentView.setTitleTextAttributes(titleTextAttributes, for: UIControl.State.normal)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black as AnyObject], for: UIControl.State.selected)
        segmentView.tintColor = UIColor.white
        segmentView.isMomentary = false
        segmentView.frame = CGRect(x:10, y:50, width:(self.view.frame.width)-20, height:segmentView.bounds.height)
        segmentView.selectedSegmentIndex = 0
        segmentView.addTarget(self, action: #selector(action_segmentValueChanged(sender:)), for: UIControl.Event.valueChanged)

        self.view.addSubview(segmentView)

        
    }
    
    @objc func action_segmentValueChanged(sender:UISegmentedControl) {
            let layout = sender.selectedSegmentIndex == 0 ? UICollectionViewFlowLayout() : CustomCollectionViewLayout()
            layout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.configCell(model: dataSource[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 220, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    




}

