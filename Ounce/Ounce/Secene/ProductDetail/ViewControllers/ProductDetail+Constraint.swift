extension ProductDetailVC {
    
    func contraint(){
        view.addSubview(productTV)
        
        productTV.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
