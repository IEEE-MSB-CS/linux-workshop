# Session 8

A humble introduction to web technologies & architecture.

## Table of contents

- Proxies: Proxy vs reverse Proxy
- VPN
- Load Balancers
- TLS, SSL, CAs.
- Before Knowing TLS, we should know:
  1. Encoding, Hashing, Encryption
  2. Vanilla HTTP
  3. HTTPS
  4. TLS 1.2
  5. Diffi-Helman
  6. TlS 1.3
  7. On Practice
- writing your first web application
  - html & css
  - understanding js
  - Ajax, Fetch api
  - localStorage vs sessionStorage
  - common attacks (client side)
  - server-side programming language

## Hashing

- Tranform plaintext into a shorter representation
- Hashing is one way!
- Also called a Hashing function
- Mathemtical Algorithm conver user input into a fixed size output (used for integrity checks) can't be reversible (one way function)

\*\* Why is this needed?

- Password's
- Indexes
- File signature
  Types:

- md4, md5, sha1, NTLM, sha2, etc

```python
import hashlib
hashlib.md5("hello world").hexdigest()
```

\*\* MD5

- Message Digest 5
- Commonly used to verify the content of data
- Not commonly used for authentication any longer

\*\* How it works?

- Provides an output a message digest of 128 bits
- Processes data in a 512-bit blocks
- Each block is broken down into 16 words composded of 32 bits each

\*\* SHA

- Secure Hashing Algorithm
- Commonly used to hash passwords
- Utilized a salt in most cases
  --> Salt: Random fixed data, either preneded or pended to the end of the beginning of the data to be hashed
  the reason for using salt:
  suppose you hash directly the word 'password' without adding any salt, it's easy to lookup a dictionary of already hashed passwords and start comparing
- Also a one way hashing function
- Common types:
  - SHA-1
  - SHA-2 (SHA-2224, SHA-286, SHA-512)
  - SHA-3

## Encoding:

- The process of changing a sequence of charachers into a specialized format
  on another words (transform data so that we can properly (and safely) consumed by different type of systems)

- Commonly used for transferring data
- it is bi directional (Encoded and Decoded)

\*\* Why this needed?

- to provide a standard format for data (url encoding for example)
- Can be used for Unicode as well as ASCII

Types of Encoding:

- Base64
- Hex
- URL encoding

\*\* Base64

\*\* HEX

\*\* URL encoding

- This encoding scheme is used for the HTTP protocol in the first place
- Inside of HTTP it is used to transfer data safely
- It was invented as part of the MIME content transfer encoding

## Encryption

- Transform plaintext into ciphertext
- uses a type of Cipher
- Most Cipers use a pseudo random generated key for encryption

Why is this needed?

- used to hide sensitive data so that when intercepted cannot be viewd by anyone but the intended recipient
- not easy to crack Encryption Algorithms (happens once :"D , but not happens frequently)
- Used in large amount of systems (most websites used HTTPS which used TLS as a protocol underneath that which relies on encryption)
  Types of Enc Algo:
- RSA
- AES
- 3DES

\*\* Symmetric Enc:

- uses the same crypto key for encryption and decryption
- the key is normally shared between 2 or more end parties for encryption and decryption

-> Drawbacks

- each party member will have the same key, if one get compromised they all are compromised
- Pseudo random key generators are used for the keys and can sometimes lack randomness
  - Because of this there have been past attacks on Symmetric Encryption

\*\* Two Typed of Symmetric enc:

- Stream Cipher:  
   used to encrypt (digits and letters) one at a time in a stream
- Block Cipher:

  - takes a set number of buts and encrypt them as single entity (you are not encrypting bit a time or letter at a time, but a block at a time)
  - if the plaintext does not fit the block cipher bit size it will pad the date to make sure to fits

  - AES
  - 3DES
  - RC4

\*\* Asymmetric enc:

- Also knows as Public Key Crypto
- Used a concept of Public and Private Key's
- Public and Private Keys are generated at once as pair (so they both are bein born at the same time)
- Public Keys are sent out to 3rd parties

\*\*\* Public key: (used only for encrypting)

- Public key is public (lol xD)
- Client will use this to **encrypt** their message for the Private Key owner
- No one but the holder of the private key can decrypt a message encrypted with the Public key

\*\* Private Key:

- Private Key is kept local (Private)
- Used to decrypt the message from the Public key holder
- Should not be shared with anyone

\*\* How it works?

1. Key Exchange

- User A generates a public and private key pai and sends the User A public key to User B
- User B genereate a public and private key pair and send the User B public key to User A
  So at the moment, they both have their own private key and they had each other public key

2. Establishing the Connection

- User A wants to send a message to User B
- User A encrypt the plain text message with User B's public key and sends it off to User B.
- If it is intercepted it cannot be decrypted witout User B's Private Key

- User B recieves the message and decrypts it with User B's Private Key
- User B generate its response and encrypt it with User A's public Key
- User B sends the the encrypted message to User A
- User A now decrypts it with User A's private key

Common uses:

- TLS
- RSA
- Diffie-Hellman
- DH, DSA, ECDH, etc

--> Demo (SSH)
SSH is used for getting secure shell over server.
there are two main way of connection:
[1] user/pass

```bash
ssh root@<ip>
```

[2] using private/public key encryption

```bash
ssh-keygen -t rsa
```

After Generating the public/private key of the ssh, we send the public key to the server, the server has it's own public and priate key also
Then the server will generate symmetric key and encrypt this symmetric key with the
public key of the ssh and send this key to ssh
symmetric key is used to encrypt and decrpyt the data send back and forth (so it actually one key used and this key is encrpted/decrpyted using Asymmetric key)
\*\*\* RSA

- Uses Asymmetric Encryption
- Commnly used in Hybrid Encrption (in conjunction with other encryption methods)
- Encrypts a Symmetric Encryption Key to be sent to 3rd party
- used for Digital Signature
- Used 2 very lage prime numbers and perform the Factoring Problem (Math behind RSA)

-> Drawbacks:

- it is very slow
- You would not want to use this on full connections or an entire file
- The resources required to do so would be too much for for most common systems
  \*\*\* AES (Symmetric)

- Advanced Encryption Standard
- Utilizes a block cipher of different sizes
- common AES block sizes: - AES-128 - AES-192 - AES-256
  \*\* How It works?
- The Symmetric key length is important
- the data encrypted with the symmetric key will be encrypted over and over again depending on its size
- AES-128 will encrypt the data over 10 rounds
- AES-192 will encrypt the data over 12 rounds
- AES0-256 will encrypt the data over 14 rounds

AES commonly used in conjunction with RSA, an example of this is TLS
TLS will use Asymmetric based encryption however, it will encrypt the keys of version of RSA

## Vanilla HTTP

## HTTPs

## SSL/TLS 1.2

http://www.steves-internet-guide.com/ssl-certificates-explained/
https://www.youtube.com/watch?v=pu1GeAw3fus
https://www.youtube.com/watch?v=gnLEl10J_Jg

## Diffi-Helman

## TLS 1.3

https://www.youtube.com/watch?v=HW9FXdSB9TE

## Networking:

-Networking tutorials:
https://www.youtube.com/watch?v=XaGXPObx2Gs&list=PLowKtXNTBypH19whXTVoG3oKSuOcw_XeW
-overview of TCP/IP architecture:
https://www.garykessler.net/library/tcpip.html
TCP sequence numbers:
https://www.youtube.com/watch?v=8XJPZttC4RM&list=PLDzveA55I0_hY2k5Jo5O5kKvsRybcTM54

### and a usuful channel

https://www.youtube.com/channel/UCdUAtnHJwRZRwfBL6xoSiUw
TCP the handshake:
https://www.youtube.com/watch?v=HCHFX5O1IaQ&list=LL&index=1
-OSI:
https://www.youtube.com/watch?v=dV8mjZd1OtU&ab_channel=theroadmap
https://www.youtube.com/watch?v=7IS7gigunyI&ab_channel=HusseinNasser

HTTP:
https://www.youtube.com/watch?v=0OrmKCB0UrQ&feature=youtu.be
URL:
https://www.youtube.com/watch?v=ADQ_rhefgEk
Web basics:
https://www.youtube.com/watch?v=RsQ1tFLwldY
https://www.youtube.com/watch?v=sxiRFwQ1RJ4
https://www.youtube.com/watch?v=pHFWGN-upGM
HTTP caching:
https://www.youtube.com/watch?v=HiBDZgTNpXY
WebSockets:
https://www.youtube.com/watch?v=2Nt-ZrNP22A&feature=youtu.be
TCP, UDP:
https://www.youtube.com/watch?v=37AFBZv4_6Y&t=9s
https://www.youtube.com/watch?v=qqRYkcta6IE
https://www.youtube.com/watch?v=uwoD5YsGACg
use cases for TCP and UDP:
https://www.youtube.com/watch?v=G86axGfnWag
Network layer protocols:
ARP: https://www.youtube.com/watch?v=cn8Zxh9bPio
NAT: https://www.youtube.com/watch?v=RG97rvw1eUo
PAT:
port forwarding: https://www.youtube.com/watch?v=92b-jjBURkw&list=LL&index=9
Basics of server side programming:
https://www.youtube.com/watch?v=92b-jjBURkw&list=LL&index=9
Browser :
https://www.youtube.com/watch?v=z0HN-fG6oT4&ab_channel=OpenCanvas
How the web works:
https://www.youtube.com/watch?v=hJHvdBlSxug

- CIDR:
  https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking
  -General information technology knowledge:
  https://www.youtube.com/playlist?list=PL7zRJGi6nMRzHkyXpGZJg3KfRSCrF15Jg
  security:
  https://www.youtube.com/watch?v=aCCpPyClx1I&list=PLy-0y1RosLEeLFZFpcJbq_zRFbGMYMCxF&index=2
  SSH:
  https://www.youtube.com/watch?v=hQWRp-FdTpc
  State transfer in REST:
  https://www.youtube.com/watch?v=EKCM1oQQrCM
