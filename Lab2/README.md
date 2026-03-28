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
### Network bonding (Active-Backup)
```mermaid
graph LR
    subgraph Server ["伺服器 (Server)"]
        direction TB
        Bond0["<b>bond0</b><br/>(Logical Interface)"]
        Mode["Mode: active-backup"]
        
        Bond0 --- ens33["ens33 (Active)"]
        Bond0 --- ens37["ens37 (Backup)"]
    end

    subgraph Switch_Block ["網路交換器"]
        SW[SW]
    end

    %% 實體連線
    ens33 ===|Primary Path| SW
    ens37 -.-|Standby Path| SW

    %% 頻寬標註
    SW --- BW1["1G"]
    SW --- BW2["2G"]

    %% 樣式美化
    style Bond0 fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    style Mode fill:none,stroke:none
    style ens33 fill:#fff,stroke:#333
    style ens37 fill:#fff,stroke:#333,stroke-dasharray: 5 5
```
Network Bonding (NIC Teaming)
Aggregating multiple physical network interfaces (e.g., `ens33` and `ens37`) into a single logical interface (e.g., bond0) to provide redundancy and High Availability (HA).
Active-Backup Mode (Mode 1)
Failover mechanism: Only one slave interface (the "Active" one) is active at any given time.
Standby: The second interface (the "Backup" one) remains idle and only takes over if the primary active interface fails.
Single MAC Address: The logical bond interface typically uses only one MAC address (from the active NIC) to avoid confusing the network switch.
Switch-Independent (LACP X)
No LACP Required: Since the mode is Active-Backup, it does not require the physical switch (SW) to support Link Aggregation Control Protocol (LACP/802.3ad).
Simplicity: This setup is easier to deploy because it works with any standard switch without complex port-channel configurations.
Physical vs. Logical Setup
Slaves: `ens33` and `ens37` are referred to as "slave" interfaces.
Master: The bond interface acts as the "master," which is where the IP address is actually assigned.
### Component
1. Ubuntu Desktop:
   + file: ubuntu-24.04.4-desktop-amd64-autoinstall.iso
   + 172.27.X.101/24 
3. Ubuntu Server:
   + file: ubuntu-24.04.4-live-server-amd64-autoinstall.iso 
   + 172.17.X.11/24
5. Rocky Server:
   + file: Rocky-9.7-x86_64-minimal-kickstart.iso
   + 172.17.X.254/24
   + 172.27.X.254/24
   + WAN IP 140.129.26.X/24
