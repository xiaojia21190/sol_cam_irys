# 🔧 Irys后台服务测试网支持检查清单

## 📋 **后台服务配置检查**

### 1. **网络配置**
- [ ] 后台服务能够识别客户端的网络类型（testnet/devnet/mainnet）
- [ ] 根据网络类型连接到正确的Irys节点：
  - Testnet → `https://devnet.irys.xyz`
  - Mainnet → `https://node1.irys.xyz`
- [ ] 根据网络类型连接到正确的Solana RPC：
  - Testnet → `https://api.testnet.solana.com`
  - Mainnet → `https://api.mainnet-beta.solana.com`

### 2. **API端点检查**
- [ ] `/api/status` - 返回服务器状态和当前网络配置
- [ ] `/api/upload/image` - 支持测试网上传
- [ ] `/api/upload/metadata` - 支持测试网元数据上传
- [ ] `/api/upload/complete` - 支持测试网组合上传

### 3. **钱包和支付配置**
- [ ] 后台服务有测试网的钱包配置
- [ ] 有足够的测试SOL用于Irys上传费用
- [ ] 支持从测试网水龙头获取SOL（如果需要）

## 🚀 **黑客松部署建议**

### **选项A：本地部署（推荐）**
```bash
# 当前配置
AppEnvironment.local → http://localhost:3000
```
**优点**：
- 完全控制，无网络依赖
- 快速调试和修改
- 适合演示环境

**需要确保**：
- 后台服务配置为testnet模式
- 有足够的测试SOL

### **选项B：局域网部署**
```bash
# 修改配置
AppEnvironment.network → http://192.168.1.100:3000
```
**优点**：
- 多设备访问
- 更接近生产环境
- 团队协作友好

### **选项C：云端部署**
```bash
# 修改配置
AppEnvironment.production → https://your-domain.com
```
**优点**：
- 最稳定的演示环境
- 支持远程访问
- 最接近真实使用场景

## 🔧 **后台服务代码建议**

### **环境变量配置**
```javascript
// 建议的环境变量
SOLANA_NETWORK=testnet
SOLANA_RPC_URL=https://api.testnet.solana.com
IRYS_NODE_URL=https://devnet.irys.xyz
WALLET_PRIVATE_KEY=your_testnet_wallet_private_key
```

### **网络检测API**
```javascript
// 建议添加网络检测端点
GET /api/network-info
{
  "network": "testnet",
  "solanaRpc": "https://api.testnet.solana.com",
  "irysNode": "https://devnet.irys.xyz",
  "walletBalance": "1.5 SOL"
}
```

## ✅ **测试验证步骤**

1. **启动后台服务**
   - [ ] 确认服务运行在正确端口
   - [ ] 检查 `/api/status` 返回正常

2. **网络配置验证**
   - [ ] 确认连接到测试网
   - [ ] 验证Irys节点连接正常

3. **上传测试**
   - [ ] 测试图片上传到Irys
   - [ ] 验证返回的Irys ID可访问
   - [ ] 测试元数据上传

4. **端到端测试**
   - [ ] 客户端连接后台服务
   - [ ] 完整的拍照→上传→NFT流程
   - [ ] 验证NFT在测试网上成功铸造

## 🎯 **黑客松演示准备**

### **必备检查**
- [ ] 后台服务稳定运行
- [ ] 有足够的测试SOL
- [ ] 网络连接稳定
- [ ] 准备演示用的示例图片

### **备用方案**
- [ ] 本地环境作为主要演示
- [ ] 云端环境作为备用
- [ ] 离线演示材料（截图、视频）

## 📝 **常见问题解决**

### **如果上传失败**
1. 检查后台服务日志
2. 验证Irys节点连接
3. 确认钱包余额充足
4. 检查网络配置

### **如果NFT铸造失败**
1. 确认Phantom钱包连接到测试网
2. 检查钱包有测试SOL
3. 验证元数据URL可访问
4. 查看Solana交易日志

---

## 🎉 **总结**

你的Irys后台服务架构很棒！只需要确保：
1. 后台服务正确配置为测试网模式
2. 有足够的测试SOL用于上传费用
3. 网络配置正确

这样你的拍照→上传→NFT流程就能在测试网上完美运行，非常适合黑客松演示！🚀
