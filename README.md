# DalamudPlugins-TW

台服 FFXIV 專用的 Dalamud 插件倉庫，提供 API13 相容版本與台服客戶端所需的修正。

目前正式版已針對台服 Dalamud API13、繁體中文 Excel 資料及部分台服客戶端結構差異進行調整。這不是上游最新版鏡像，請勿直接以 API14 或更新版本的上游二進位檔覆蓋。

> [!WARNING]
> Penumbra、Glamourer、Ktisis、Loporrit Sync 等會攔截資源載入、修改角色／場景／音訊／快捷欄狀態、同步外觀資料或 Hook 遊戲函式，風險高於一般介面插件。請整套使用本倉庫列出的相容版本；不要混用上游 API14 DLL，並在更新前保留可回退版本。

## 使用方式

1. 開啟 Dalamud 設定
2. 進入「實驗性功能」
3. 在「自訂插件儲存庫」加入以下 URL：

```
https://raw.githubusercontent.com/cycleapple/DalamudPlugins-TW/main/repo.json
```

4. 儲存後即可在插件安裝器中看到這些插件

## 支持維護

如果這個插件倉庫對你有幫助，歡迎[請我喝一杯咖啡](https://portaly.cc/thecy) ☕

## 可用插件

| 插件 | 版本 | 說明 |
|------|------|------|
| **Penumbra** | 1.5.1.23 | Mod 載入器與管理工具（API13 上游 1.5.1.1 基底；修正 TC 結構、繁中 Excel、shader handle 誤判、空資源路徑、一般 ZIP／PMP 匯入，並可唯讀載入新版 V4 模組） |
| **Simple Heels** | 0.10.7.5 | 穿著 Mod 高跟鞋時調整角色位置；補齊角色／群組、暫時偏移、模型與裝備偏移及快捷鍵介面的繁中翻譯 |
| **Brio** | 0.5.2.1 | GPose 增強工具，用於拍照與動作控制；補齊目前版本的繁中介面與 291 個語系鍵 |
| **Ktisis v0.3** | 0.3.14.5 | 集體動作模式的場景、角色姿勢、鏡頭與燈光編輯工具；補齊 575 個繁中語系鍵，並讓既有 `en_US` 設定自動載入繁中 |
| **Glamourer** | 1.5.0.10 | 外觀修改與儲存工具（需要 Penumbra）- **已修正台服 TC 繁中 Excel 語言頁與即時玩家辨識，並補齊設計、染色、自動化與裝備介面的繁中翻譯** |
| **Customize+** | 2.0.7.30 | 透過編輯骨骼參數自訂角色外觀 - **已修正台服角色世界 ID 驗證，並補齊設定、範本、設定檔及骨骼編輯介面的繁中翻譯** |
| **Aetherment** | 0.4.0.0 | Mod 瀏覽、安裝與自動更新工具 |
| **PlayerWatchlist** | 1.0.0.1 | 黑白名單玩家追蹤系統，偵測周圍玩家並顯示連結線與通知 |
| **Action Timeline Replacement** | 1.0.0.1 | 部分特效 MOD 使用，用於替換動畫和特效 |
| **Simple Tweaks** | 1.10.11.1 | 多項可設定的遊戲便利性調整 |
| **Loporrit Sync** | 1.0.9.2 | 與配對玩家同步 Penumbra Mod 與 Glamourer 外觀（需要 Penumbra 1.5.1.23、Glamourer 1.5.0.10） |

## 為什麼需要這個倉庫？

台服使用的 Dalamud 版本為 API13，而多數上游插件已更新至較新的 API。直接使用上游最新版本可能因 API、FFXIVClientStructs 或遊戲版本不相容而無法載入，甚至在選角或載入角色時造成遊戲崩潰。

本倉庫固定在各插件的 API13 上游版本，並套用台服需要的相容性修正。

## 版本選取原則

- 優先使用上游已正式支援 Dalamud API13 的原始碼節點
- 避免混入 API14 之後才加入的遊戲結構、特徵碼與 renderer 變更
- Penumbra 等核心外觀插件以 2025 年 8 月 5 日至 2025 年 12 月 16 日的 API13 上游範圍為基礎，再加入台服專用修正
- 每次發布都會確認插件 manifest 的 `DalamudApiLevel` 為 `13`
- `PlayerWatchlist` 為本倉庫自行維護的插件，不套用上述上游日期範圍

## 相關連結

- [台服 Dalamud (yanmucorp)](https://github.com/yanmucorp/Dalamud)
- [台服 FFXIVClientStructs TC-BASE](https://github.com/yanmucorp/FFXIVClientStructs/tree/TC-BASE)
- [Penumbra 官方](https://github.com/xivdev/Penumbra)
- [Simple Heels 官方](https://github.com/Caraxi/SimpleHeels)
- [Brio 官方](https://github.com/Etheirys/Brio)
- [Glamourer 官方](https://github.com/Ottermandias/Glamourer)
- [Customize+ 官方](https://github.com/Aether-Tools/CustomizePlus)
- [Aetherment 官方](https://github.com/Sevii77/aetherment)
- [PlayerWatchlist](https://github.com/cycleapple/PlayerWatchlist)
- [Action Timeline Replacement](https://github.com/papapachin/ActionTimelineReplacement)
- [Loporrit Sync 官方](https://github.com/loporrit/LoporritSync)

## 修改說明

### Penumbra

目前正式版本為 `1.5.1.23`，以 2025-08-28 發布、仍使用 Dalamud API13 的上游 `1.5.1.1` 為基礎，來源位於 [cycleapple/Penumbra 的 api13-tw-1.5.1 分支](https://github.com/cycleapple/Penumbra/tree/api13-tw-1.5.1)。

修改內容：

- 更新為 Dalamud API13 可載入的建置
- 修正台服客戶端使用的 renderer 與其他特徵碼
- 支援台服繁體中文 Excel 頁與 Dalamud `None` 語言回退
- 停用台服客戶端不存在的非必要 parasol animation hook
- 修正 TC 內建 SHPK handle 被誤判為 modded shader 的問題
- 保留真正由本機 Mod 替換的 SHPK 處理功能
- 移植上游 `12a218bb` 的空資源路徑保護，在進入 SqPack loader 前拒絕無效請求
- 使用 Penumbra.Api `5.12.0`，提供 Loporrit Sync 所需的 PCP、暫時集合及資源路徑 IPC
- 將 SharpCompress 更新至修補路徑穿越弱點的 `0.48.0`
- 回移上游 SharpCompress 讀取回歸修正：一般 ZIP／PMP 逐項解壓，solid／7z 才使用 `ExtractAllEntries()`
- 回移上游 V4 模組唯讀相容層：讀取新版 Penumbra 內嵌於 `meta.json` 的預設資料與選項群組
- 禁止 API13 版本覆寫 V4 模組，並拒絕尚未支援的 V5 以上格式，避免破壞國際服新版 Penumbra 的資料

`1.5.1.23` 保留既有台服 shader、空路徑與 ZIP／PMP 匯入修正，並加入新版 Penumbra V4 模組的唯讀載入能力。V3 模組仍沿用原本的檔案與儲存流程；V4 模組可讀取內嵌預設資料及選項群組，但本版本不會寫回 V4 模組。若模組宣告 API13 不支援的新功能，仍會安全地拒絕載入，而不會靜默套用不完整內容。

如需緊急回退，GitHub Release 中仍保留 `1.5.0.13` 與停用 Shader Replacement Fixer 的 `1.5.0.11`；但 Loporrit Sync 不支援回退到 `1.5.0.x`。

### Loporrit Sync

目前正式版本為 `1.0.9.2`，來源位於 [cycleapple/LopClient 的 api13-tw 分支](https://github.com/cycleapple/LopClient/tree/api13-tw)。

- 保留上游原始的 `Penumbra >= 1.5.1.0` 相容性條件
- 已用台服 Dalamud `13.0.0.8` 編譯
- 需要本倉庫的 Penumbra `1.5.1.23` 與 Glamourer `1.5.0.10`
- SignalR、MessagePack 與 Hosting 相依套件已更新至 `9.0.18`，NuGet 弱點掃描無已知項目

### Glamourer

此版本的 Glamourer 使用 API13 安全節點為基礎，並針對台服客戶端調整玩家辨識。

修改內容：

- 修復中文/台服客戶端仍無法偵測部分即時玩家角色的問題
- 已由遊戲物件確認為玩家時，不再套用過窄的姓名格式與區域 Excel 世界清單
- 即時玩家仍必須具有非空名稱及有效的非零世界 ID
- IPC、匯入資料與手動輸入仍保留嚴格驗證

問題原因：

即使放寬本地化姓名格式，使用一般輸入資料的驗證流程處理即時遊戲物件，仍可能因名稱表示方式或區域世界資料不完整而誤判。新版只信任已由遊戲物件種類確認的即時玩家資料，避免格式規則阻擋玩家清單。

修改的檔案：

- `Penumbra.GameData/Actors/ActorIdentifierFactory.cs` - 分離即時遊戲物件與外部輸入資料的玩家驗證

Fork 來源：

- [cycleapple/Glamourer](https://github.com/cycleapple/Glamourer/tree/api13-tw)
- [cycleapple/Penumbra.GameData](https://github.com/cycleapple/Penumbra.GameData/tree/api13-tw-glamourer)

### Customize+

此版本的 Customize+ 是基於 [Aether-Tools/CustomizePlus testing_2.0.7.22](https://github.com/Aether-Tools/CustomizePlus/releases/tag/testing_2.0.7.22) 修改而成。

修改內容：

- 修復中文/台服客戶端無法偵測玩家角色的問題
- 角色世界 ID 不再要求存在於 Dalamud 公開世界清單
- 保留角色名稱格式驗證，並拒絕無效的世界 ID `0`

修改的檔案：

- `Penumbra.GameData/Actors/ActorIdentifierFactory.cs` - 移除世界清單相依，只驗證世界 ID 非 `0`

Fork 來源：

- [cycleapple/CustomizePlus](https://github.com/cycleapple/CustomizePlus/tree/fix-non-western-clients)
- [cycleapple/Penumbra.GameData](https://github.com/cycleapple/Penumbra.GameData/tree/fix-non-western-clients-cp)

### PlayerWatchlist

台服專用的黑白名單玩家追蹤系統。

功能：

- 管理黑名單和白名單玩家
- 可為每個玩家添加備註原因
- 設定偵測半徑
- 當目標玩家在範圍內時顯示連結線（黑名單：紅色，白名單：綠色）
- 發送聊天訊息和系統通知
- 支援右鍵選單快速添加/移除

來源：

- [cycleapple/PlayerWatchlist](https://github.com/cycleapple/PlayerWatchlist)

### Action Timeline Replacement

用於替換一些僅通過 mod 無法替換的動畫和特效，部分技能 mod 需要用到。

適用場景：

- Papachin 的真維吉爾和但丁
- Amon 的失落天堂
- Bangja 的克勞德
- 其他需要替換動畫時間線的 mod

來源：

- [papapachin/ActionTimelineReplacement](https://github.com/papapachin/ActionTimelineReplacement)

## 注意事項

- 這些插件是從官方 API13 源碼分支編譯的版本
- Penumbra、Glamourer 和 Customize+ 經過台服語言或客戶端相容性修改
- 版本可能落後於官方最新版本
- 更新後若在選角或載入角色時崩潰，請保留 Dalamud log 與 `.dmp`／`.tspack` 報告檔
- 不要將上游 API14 以上版本的 DLL 單獨混入本倉庫的插件目錄
- 如有問題請在 Issues 中回報

## 授權

各插件依照其原始授權條款發布。本倉庫僅提供編譯後的二進位檔案供台服玩家使用。
