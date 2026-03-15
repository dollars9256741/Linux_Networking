# Linux Networking Lab: Infrastructure & Implementation

This repository documents my practical experience in building and managing a professional-grade **Linux Networking** environment. It features a multi-layered infrastructure using VMWare Workstation Pro, Rocky Linux, and Ubuntu.

---

## 🏗 Network Topology

The following diagram illustrates the logical and physical flow of data from the Virtual Machines (VMs) through the host system to the external Internet.

```mermaid
graph TD
    %% Layer 1: Guest Operating Systems
    subgraph Layer_VM ["Virtual Machine Layer (Guest OS)"]
        direction LR
        Rocky["Rocky Linux<br/>(Static IP: .1)"] --- NIC_R["■ NIC"]
        Ubuntu["Ubuntu Linux<br/>(VMNet8: V8)"] --- NIC_U["■ NIC"]
    end

    %% Layer 2: Virtual Network Editor
    subgraph Layer_vSwitch ["Virtual Networking Layer"]
        VSwitch["vSwitch<br/>(VMNet0 / VMNet1 / VMNet8)"]
    end

    %% Layer 3: Host System
    subgraph Layer_Host ["Host System Layer"]
        direction LR
        Win11["Windows 11 +<br/>VMWare Workstation Pro"] --- NIC_W["■ Physical NIC"]
    end

    %% Layer 4: Physical & External Network
    AccessSwitch(["Access Switch"])
    Router((Router))
    Internet{{"Internet<br/>(Yahoo!)"}}

    %% Connectivity Logic
    NIC_R === VSwitch
    NIC_U === VSwitch
    VSwitch === Win11
    NIC_W === AccessSwitch
    
    AccessSwitch --- Router
    Router --- Internet

    %% Styling
    style Rocky fill:#8b0000,color:#fff
    style Ubuntu fill:#8b4513,color:#fff
    style VSwitch fill:#3d2b2b,color:#fff
    style Win11 fill:#1a2a3a,color:#fff
    style NIC_R fill:#000,color:#fff,stroke:#fff
    style NIC_U fill:#000,color:#fff,stroke:#fff
    style NIC_W fill:#000,color:#fff,stroke:#fff
    
    %% Transparent subgraph backgrounds
    style Layer_VM fill:none,stroke:#666,stroke-dasharray: 5 5
    style Layer_vSwitch fill:none,stroke:#666,stroke-dasharray: 5 5
    style Layer_Host fill:none,stroke:#666,stroke-dasharray: 5 5

