# DalamudPlugins-TW

台服 FFXIV 專用的 Dalamud 插件倉庫，提供 API13 相容版本的插件。

## 使用方式

1. 開啟 Dalamud 設定
2. 進入「實驗性功能」
3. 在「自訂插件儲存庫」加入以下 URL：

```
https://raw.githubusercontent.com/cycleapple/DalamudPlugins-TW/main/repo.json
```

4. 儲存後即可在插件安裝器中看到這些插件

## 可用插件

| 插件 | 版本 | 說明 |
|------|------|------|
| **Penumbra** | 1.5.0.7 | Mod 載入器與管理工具（修正台服特徵碼並讀取 TC 繁中 Excel 頁） |
| **Simple Heels** | 0.10.7.4 | 穿著 Mod 高跟鞋時調整角色位置 |
| **Brio** | 0.5.2.0 | GPose 增強工具，用於拍照與動作控制 |
| **Glamourer** | 1.5.0.6 | 外觀修改與儲存工具（需要 Penumbra）- **已修正台服 TC 繁中 Excel 語言頁** |
| **Customize+** | 2.0.7.27 | 透過編輯骨骼參數自訂角色外觀 - **已修正台服 TC 繁中 Excel 語言頁** |
| **Aetherment** | 0.4.0.0 | Mod 瀏覽、安裝與自動更新工具 |
| **PlayerWatchlist** | 1.0.0.1 | 黑白名單玩家追蹤系統，偵測周圍玩家並顯示連結線與通知 |
| **Action Timeline Replacement** | 1.0.0.1 | 部分特效 MOD 使用，用於替換動畫和特效 |
| **Simple Tweaks** | 1.10.11.1 | 多項可設定的遊戲便利性調整 |

## 為什麼需要這個倉庫？

台服使用的 Dalamud 版本為 API13，而多數上游插件已更新至較新的 API。直接使用上游最新版本會因 API 不相容而無法載入。

本倉庫固定在各插件的 API13 上游版本，並套用台服需要的相容性修正。

## 相關連結

- [台服 Dalamud (yanmucorp)](https://github.com/yanmucorp/Dalamud)
- [Penumbra 官方](https://github.com/xivdev/Penumbra)
- [Simple Heels 官方](https://github.com/Caraxi/SimpleHeels)
- [Brio 官方](https://github.com/Etheirys/Brio)
- [Glamourer 官方](https://github.com/Ottermandias/Glamourer)
- [Customize+ 官方](https://github.com/Aether-Tools/CustomizePlus)
- [Aetherment 官方](https://github.com/Sevii77/aetherment)
- [PlayerWatchlist](https://github.com/cycleapple/PlayerWatchlist)
- [Action Timeline Replacement](https://github.com/papapachin/ActionTimelineReplacement)

## 修改說明

### Glamourer

此版本的 Glamourer 是基於 [Ottermandias/Glamourer v1.4.0.1](https://github.com/Ottermandias/Glamourer/releases/tag/1.4.0.1) 修改而成。

**修改內容：**
- 修復中文/台服客戶端無法偵測玩家角色的問題
- 原版僅顯示 NPC，不顯示 LocalPlayer 和其他玩家

**問題原因：**
原版的 `VerifyPlayerName()` 僅接受西方字母 (a-z)，導致中文名稱驗證失敗。

**修改的檔案：**
- `Penumbra.GameData/Interop/Actor.cs` - 關閉嚴格的名稱/世界驗證

**Fork 來源：**
- [cycleapple/Glamourer](https://github.com/cycleapple/Glamourer/tree/fix-player-detection)
- [cycleapple/Penumbra.GameData](https://github.com/cycleapple/Penumbra.GameData/tree/fix-non-western-clients)

### Customize+

此版本的 Customize+ 是基於 [Aether-Tools/CustomizePlus testing_2.0.7.22](https://github.com/Aether-Tools/CustomizePlus/releases/tag/testing_2.0.7.22) 修改而成。

**修改內容：**
- 修復中文/台服客戶端無法偵測玩家角色的問題
- 與 Glamourer 相同的問題和修復方式

**修改的檔案：**
- `Penumbra.GameData/Interop/Actor.cs` - 關閉嚴格的名稱/世界驗證

**Fork 來源：**
- [cycleapple/CustomizePlus](https://github.com/cycleapple/CustomizePlus/tree/fix-non-western-clients)
- [cycleapple/Penumbra.GameData](https://github.com/cycleapple/Penumbra.GameData/tree/fix-non-western-clients-cp)

### PlayerWatchlist

台服專用的黑白名單玩家追蹤系統。

**功能：**
- 管理黑名單和白名單玩家
- 可為每個玩家添加備註原因
- 設定偵測半徑
- 當目標玩家在範圍內時顯示連結線（黑名單：紅色，白名單：綠色）
- 發送聊天訊息和系統通知
- 支援右鍵選單快速添加/移除

**來源：**
- [cycleapple/PlayerWatchlist](https://github.com/cycleapple/PlayerWatchlist)

### Action Timeline Replacement

用於替換一些僅通過 mod 無法替換的動畫和特效，部分技能 mod 需要用到。

**適用場景：**
- Papachin 的真維吉爾和但丁
- Amon 的失落天堂
- Bangja 的克勞德
- 其他需要替換動畫時間線的 mod

**來源：**
- [papapachin/ActionTimelineReplacement](https://github.com/papapachin/ActionTimelineReplacement)

## 注意事項

- 這些插件是從官方 API13 源碼分支編譯的版本
- Glamourer 和 Customize+ 經過修改以支援中文名稱
- 版本可能落後於官方最新版本
- 如有問題請在 Issues 中回報

## 授權

各插件依照其原始授權條款發布。本倉庫僅提供編譯後的二進位檔案供台服玩家使用。
