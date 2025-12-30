# EthExplorer (In Progress)

![EthExplorer Screenshot](http://i.imgur.com/NHFYq0x.png)

##License

GPL (see LICENSE)

##Installation

Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git "Git installation") if you haven't already

Clone the repo

`git clone https://github.com/etherparty/explorer`

Download [Nodejs and npm](https://docs.npmjs.com/getting-started/installing-node "Nodejs install") if you don't have them

Start the program. All dependencies will be automatically downloaded

`npm start`

Then visit http://localhost:8000 in your browser of choice. You might get an error message:

`geth --rpc --rpccorsdomain "http://localhost:8000"`

Install [geth](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum "Geth install") if you don't already have it, then run the above command.

Then refresh the page in your browser 

## 🎓 实训改造记录

### 学生：lixinyi166
### 日期：2024年12月30日

### 遇到的问题：
1. **bower安装失败**：由于Git路径编码问题
2. **解决方案**：采用CDN加载库 + 手动提供web3.js

### 完成的改造：
1. 修改index.html：添加实训信息栏
2. 创建测试页面：test_page.html
3. 更新项目文档：README.md

### 运行测试：
```bash
npx http-server -p 8080
# 访问 http://localhost:8080
```
