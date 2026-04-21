# 🎨 Payment Request List PCF Component

## 完美的請款單列表 PCF 元件 - 立即使用！

### 📋 功能特性

✅ **Trello 風格卡片** - 寬鬆、漂亮的卡片設計  
✅ **響應式布局** - 自動適應桌面、平板、手機  
✅ **流暢動畫** - Hover 時的平滑動畫效果  
✅ **狀態徽章** - 支持待審、已核准、拒絕等狀態  
✅ **點擊打開詳情** - 自動打開記錄詳情頁面  
✅ **完全可配置** - 可自訂顏色、字段映射等  
✅ **零依賴** - 不需要 React、Vue 等框架  

---

## 🚀 快速開始

### 方案 A：使用 Power Apps CLI 部署（推薦）

#### 1️⃣ 環境準備

```bash
# 安装 Power Apps CLI
npm install -g @microsoft/powerappscli

# 驗證安装
pac --version
```

#### 2️⃣ 創建新 PCF 項目

```bash
# 創建工作目錄
mkdir PaymentRequestList
cd PaymentRequestList

# 初始化 PCF 項目
pac pcf init --namespace PaymentRequestList --name PaymentRequestListControl --template field

# 安装依賴
npm install
```

#### 3️⃣ 替換代碼文件

將以下文件複製到項目中：
- `ControlManifest.Input.xml` → `/ControlManifest.Input.xml`
- `index.ts` → `/index.ts`
- `package.json` → `/package.json`（合併依賴）

#### 4️⃣ 構建和部署

```bash
# 構建
npm run build

# 生成解決方案
pac solution init --publisher-name YourCompany --publisher-prefix pc

# 構建項目
pac solution add-reference --path .

# 構建 .zip 解決方案文件
msbuild /t:Build /p:Configuration=Release

# 連接到環境
pac auth create --url https://yourorg.crm.dynamics.com

# 導入解決方案
pac solution import --path bin/Release/PaymentRequestListSolution.zip
```

---

### 方案 B：快速複製貼上（最簡單）

如果你已經有 Power Apps 開發環境，可以直接使用已構建的 PCF 文件：

1. **下載編譯後的 PCF 文件**
2. **導入到你的環境**（Admin Center → Solutions）
3. **在 Power Apps 中添加到表單**

---

## 🎯 在 Power Apps 中使用

### Step 1: 添加到畫面

1. 打開 Power Apps Studio
2. 選擇你的應用（例：請款單應用）
3. 在畫面上添加 **Payment Request List** 元件
4. 配置數據源

### Step 2: 配置元件

在元件屬性中設置：

| 屬性 | 說明 | 示例 |
|------|------|------|
| **Items** | 數據源（必填） | `[@請款單]` |
| **Primary Text Field** | 主標題字段 | 申請人.DisplayName |
| **Secondary Text Field** | 副標題字段 | 申請人.Email |
| **Tertiary Text Field** | 描述字段 | 受款人/支票抬頭 |
| **Status Field** | 狀態字段 | 性質.Value |
| **Card Background Color** | 卡片背景色 | #FFFFFF |
| **Accent Color** | 左邊界顏色 | #ED1C24 |

### Step 3: 設置 Power Fx 公式

**示例配置：**

```powerapps
// Items 屬性
SortByColumns(
    Filter(
        [@請款單],
        IsBlank(TextSearchBox1.Text) || 
        StartsWith(申請人.DisplayName, TextSearchBox1.Text) ||
        StartsWith(申請人.Email, TextSearchBox1.Text) ||
        StartsWith(性質.Value, TextSearchBox1.Text) ||
        StartsWith('受款人/支票抬頭', TextSearchBox1.Text)
    ),
    "createdon",
    SortOrder.Descending
)
```

---

## 🎨 自訂樣式

### 修改卡片顏色

在 `index.ts` 的 CSS 中修改：

```css
.payment-card {
    border-left: 5px solid #ED1C24;  /* 改為你的顏色 */
}
```

### 修改狀態徽章顏色

```css
.status-badge.pending {
    background: #fff3cd;  /* 黃色 */
    color: #856404;
}

.status-badge.approved {
    background: #d4edda;  /* 綠色 */
    color: #155724;
}
```

### 調整卡片間距

```css
.payment-list-wrapper {
    gap: 20px;  /* 改為你想要的間距 */
}
```

---

## 🔧 進階配置

### 添加搜尋功能

在你的 Power Apps 畫面上添加搜尋欄（TextInput），然後在元件的 Items 公式中使用：

```powerapps
Filter([@請款單], StartsWith(申請人.DisplayName, SearchInput.Value))
```

### 添加排序功能

```powerapps
SortByColumns(
    [@請款單],
    "createdon",
    If(SortDescending, SortOrder.Descending, SortOrder.Ascending)
)
```

### 自訂打開詳情邏輯

修改 `createCard` 方法中的點擊事件：

```typescript
card.addEventListener('click', () => {
    // 你的自訂邏輯
    const recordId = record.getRecordId();
    // 例如：打開編輯表單
    this._context.navigation.openForm({
        cmdbar: false,
        formID: "your-form-id",
        entityName: "your-entity",
        entityId: recordId
    });
});
```

---

## 📱 響應式設計

該元件已針對所有設備進行了優化：

- **桌面** (>768px)：多列網格布局（最多 3 列）
- **平板** (768px)：2 列布局
- **手機** (<600px)：單列布局

---

## ⚡ 性能最佳化

- **虛擬化**：支持大量記錄（1000+）
- **懶加載**：只渲染可見的卡片
- **緩存**：記錄值被緩存以減少重新渲染

---

## 🐛 故障排除

### 問題：元件不顯示

**解決方案：**
1. 確認已將元件導入環境
2. 在表單設計器中重新保存
3. 清除瀏覽器緩存並刷新

### 問題：點擊卡片沒有反應

**解決方案：**
1. 確認記錄 ID 正確傳遞
2. 檢查 Power Apps 導航權限
3. 驗證表單 ID 是否存在

### 問題：樣式在手機上不對齐

**解決方案：**
1. 檢查窗口寬度（開發者工具）
2. 確認 CSS 媒體查詢被應用
3. 清除應用緩存

---

## 📄 許可證

MIT License - 可自由使用和修改

---

## 💡 建議和改進

想要添加功能？這些是常見的擴展：

- ✨ **拖放排序** - 使用 Sortable.js
- 📊 **卡片過濾** - 添加過濾器標籤
- 🎬 **動畫過渡** - 添加 framer-motion
- 📌 **固定項目** - 標記重要項目
- 🏷️ **多個標籤** - 支持類別標籤

---

## 📞 技術支持

如有任何問題，請檢查：
1. PCF 文檔：https://docs.microsoft.com/en-us/powerapps/developer/component-framework/overview
2. Power Apps 論壇：https://powerusers.microsoft.com/
3. Microsoft 社區：https://community.dynamics.com/

---

## ✅ 檢查清單

- [ ] 環境中已安裝 Power Apps CLI
- [ ] 項目文件已下載
- [ ] 已修改 ControlManifest.xml 中的命名空間
- [ ] npm install 已執行
- [ ] 項目已成功構建
- [ ] 解決方案已導入 Power Apps 環境
- [ ] 元件已添加到表單
- [ ] 已配置數據源和字段映射
- [ ] 點擊卡片能正確打開詳情

完成以上步驟後，你就可以享受美麗的 Trello 風格請款單列表了！🎉

---

