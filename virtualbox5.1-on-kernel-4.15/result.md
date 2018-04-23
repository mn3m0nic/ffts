
Command:

```
apt-get source virtualbox
cd virtualbox*
dpkg-buildpackage -us -uc -d
```

Result:

```
$ ls -lah *.deb
-rw-r--r-- 1 username username  16M Apr 22 21:13 virtualbox_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username  84M Apr 22 21:13 virtualbox-dbgsym_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username 655K Apr 22 21:13 virtualbox-dkms_5.1.30-dfsg-1~bpo9+1_all.deb
-rw-r--r-- 1 username username 585K Apr 22 21:13 virtualbox-guest-dkms_5.1.30-dfsg-1~bpo9+1_all.deb
-rw-r--r-- 1 username username 703K Apr 22 21:13 virtualbox-guest-source_5.1.30-dfsg-1~bpo9+1_all.deb
-rw-r--r-- 1 username username 423K Apr 22 21:13 virtualbox-guest-utils_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username 1.5M Apr 22 21:13 virtualbox-guest-utils-dbgsym_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username 1.1M Apr 22 21:13 virtualbox-guest-x11_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username 8.4M Apr 22 21:13 virtualbox-guest-x11-dbgsym_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username 7.2M Apr 22 21:13 virtualbox-qt_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username  58M Apr 22 21:13 virtualbox-qt-dbgsym_5.1.30-dfsg-1~bpo9+1_amd64.deb
-rw-r--r-- 1 username username 762K Apr 22 21:13 virtualbox-source_5.1.30-dfsg-1~bpo9+1_all.deb
```
