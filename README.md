# wallet

一个发币钱包

使用方法：
1） weth.transfer(w, 50, {'from': accounts[0]}) 将token存入钱包
2） w.addOperator(accounts[2], {'from': accounts[0]}) 授权给操作员
3） w.send(accounts[1], 10, {'from': accounts[2]}) 发币
