Example Usage
-
```
$ echo 'my secret' > secret.txt
$ bash encrypt.sh secret.txt
Successfully encrypted file. Output in ./out
```
```
$ cd out
$ ls
README          decrypt.sh      otp.key         secret.txt.enc
```
```
$ cat secret.txt.enc
Salted__F??E????%????\?ZDf{??

$ bash decrypt.sh
Decrypted file located: ./secret.txt

$ cat secret.txt
my secret
```
