## Lab2: 
### Structure
```mermaid
flowchart TD
    %% 定義節點 (GitHub 會自動根據主題調整顏色，這裡我們只固定邊框與文字)
    A1[Access 1]
    A2[Access 2]
    S[S]

    %% 定義連線與標籤
    A1 ===|Stack| A2
    A1 ---|1G| S
    A2 ---|1G| S

    %% 針對 Stack 連線進行橘色強化 (這是圖中的視覺重點)
    linkStyle 0 stroke:#ff6600,stroke-width:4px,color:#ff6600
    
    %% 設定節點樣式：讓它看起來更像你提供的截圖（深底白邊）
    style A1 fill:#222,stroke:#fff,stroke-width:2px,color:#fff
    style A2 fill:#222,stroke:#fff,stroke-width:2px,color:#fff
    style S fill:#222,stroke:#fff,stroke-width:2px,color:#fff
```
```mermaid
graph TD
    %% 定義節點樣式
    Internet((Internet))
    R[Rockey Server]
    U[Ubuntu Server]
    D[Ubuntu Desktop]

    %% 連線與標籤
    Internet --- |"Bridge (Win11)"| R
    R --- |"VM Net 1 (Host-only)"| U
    R --- |"VM Net 2 (Host-only)"| D

    %% 樣式美化
    style Internet fill:#f9f,stroke:#333,stroke-width:2px
    style R fill:#fff,stroke:#333,stroke-width:2px
    style U fill:#fff,stroke:#333,stroke-width:2px
    style D fill:#fff,stroke:#333,stroke-width:2px
```
### Component
1. Ubuntu Desktop: 172.27.X.101/24
2. Ubuntu Server: 172.17.X.11/24
3. Rocky Server: 172.17.X.254/24
                 172.27.X.254/24
                 WAN IP 140.129.26.X/24
