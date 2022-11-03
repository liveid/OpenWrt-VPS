# VPS_OpenWrt



**Prerequisite**
 - **`Ubuntu`** or **`Debian`**  
 - **`wget`** installed<br>

    ```Bash
    apt update && apt install -y wget 
    ```
**Steps**

1.  Upload OpenWrt firmware, rename it to `openwrt.img.gz` 
2.  Run command line below:
    ```Bash
    bash -c "$(wget -O- https://git.io/JZOn0)"
    ```
    If you have problem with https certificate, then try this:

    ```Bash
    wget --no-check-certificate -O- https://git.io/JZOn0|bash
    ```
**Support Platform :**

- Google Cloud
- Azure
- Vultr
- Virmach
- Racknerd
- Hostdare
- Ali Cloud (Domestic)
- hostEONS
- ...


