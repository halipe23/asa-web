# Projeto ASA - Aplicação de Serviços de Rede

## 📌 Sobre o Projeto
O **Projeto ASA** é uma infraestrutura simulada de um provedor de serviços de internet baseada em **Docker** e **Docker Compose**. O objetivo é criar e gerenciar serviços essenciais, incluindo:
- **DNS (Bind9)**
- **Proxy Reverso (NGINX)**
- **Servidor de E-mail (Postfix + Dovecot)**
- **Webmail (Roundcube)**
- **Servidores Web (WordPress)**
- **Acesso Remoto via SSH**

A arquitetura utiliza **Infraestrutura como Código (IaC)** para garantir modularidade e facilidade na implantação.

---
## 🛠️ Tecnologias Utilizadas
As principais ferramentas utilizadas neste projeto são:

| Tecnologia  | Uso |
|-------------|------------------------------------------|
| Docker      | Containerização dos serviços |
| Docker Compose | Orquestração dos containers |
| Bind9       | Servidor DNS |
| NGINX       | Proxy reverso e balanceamento de carga |
| Postfix     | Servidor SMTP para envio de e-mails |
| Dovecot     | Servidor IMAP para recebimento de e-mails |
| Roundcube   | Webmail para acesso aos e-mails |
| WordPress   | CMS utilizado nos servidores Web |
| OpenSSH     | Acesso remoto seguro |

---
## 📂 Estrutura do Projeto
O projeto está organizado da seguinte maneira:
```
📂 Projeto-ASA
 ├── 📂 Provedor
 │   ├── 📂 dns
 │   ├── 📂 proxy
 │   ├── 📂 email
 │   ├── 📂 webmail
 │   ├── 📂 ssh
 │   ├── docker-compose.yml
 │
 ├── 📂 Cliente-fogo
 │   ├── 📂 db_data
 │   ├── 📂 SSH
 │   ├── docker-compose.yml
 │
 ├── 📂 Cliente-genipa
 │   ├── 📂 db_data
 │   ├── 📂 SSH
 │   ├── docker-compose.yml
 │
 ├── README.md
```
Cada serviço tem seus arquivos de configuração específicos dentro de sua pasta correspondente.

---
## 🚀 Como Executar o Projeto
### **1️⃣ Clonar o Repositório**
```bash
git clone https://github.com/halipe23/asa-web.git
cd asa-web
```

### **2️⃣ Criar Rede Externa do Docker**
O proxy reverso utiliza uma rede externa chamada `praia-proxy`. Certifique-se de criá-la antes de subir os containers:
```bash
docker network create praia-proxy
```

### **3️⃣ Subir os Serviços**
Cada serviço pode ser iniciado individualmente ou todos de uma vez:
```bash
docker-compose up -d
```
Para subir um cliente específico:
```bash
docker-compose -f Cliente1/docker-compose.yml up -d
```

### **4️⃣ Testar os Serviços**
Após a execução, os serviços estarão disponíveis nos seguintes endereços:
| Serviço   | URL |
|-----------|---------------------------------|
| Proxy     | https://proxy.miami.asa.br |
| Webmail   | https://webmail.miami.asa.br |
| Cliente1 Web | https://fogo.asa.br |
| Cliente2 Web | https://genipa.asa.br |

Caso esteja rodando localmente, adicione os domínios ao arquivo `/etc/hosts` (Linux/Mac) ou `C:\Windows\System32\drivers\etc\hosts` (Windows):
```bash
127.0.0.1 fogo.asa.br
127.0.0.1 genipa.asa.br
127.0.0.1 webmail.miami.asa.br
```
Ou user uma VM que será bem mais facil.

---
## 🛠️ Configuração dos Serviços
### **1️⃣ DNS (Bind9)**
- Servidor DNS gerencia as zonas para os domínios `fogo.asa.br`, `genipa.asa.br` e `webmail.miami.asa.br`.
- Arquivos de configuração estão em `Provedor/dns/zones/`.

### **2️⃣ Proxy Reverso (NGINX)**
- O proxy faz o encaminhamento de requisições HTTPS e o balanceamento de carga.
- Configuração disponível em `Provedor/proxy/config/`.

### **3️⃣ Servidor de E-mail (Postfix + Dovecot)**
- Envio e recebimento de e-mails com suporte a webmail (Roundcube).
- Configuração em `Provedor/email/postfix-dovecot/`.

### **4️⃣ Webmail (Roundcube)**
- Interface web para acessar os e-mails.
- Configuração em `Provedor/webmail/conf/config.inc.php`.

### **5️⃣ Servidores Web (WordPress)**
- Utiliza a imagem oficial do WordPress para hospedagem de sites.
- Configuração disponível em `Cliente1/web` e `Cliente2/web`.

### **6️⃣ Acesso SSH**
- O acesso remoto está disponível via SSH, permitindo gerenciar os servidores.
- Configuração em `Provedor/ssh/`.

---
## 🐛 Possíveis Problemas e Soluções
### 🔴 **1. Serviços rodam internamente, mas não são acessíveis via navegador**
✅ **Solução:**
- Verifique se as portas 80 e 443 estão livres:
```bash
sudo netstat -tuln | grep -E '80|443'
```
- Se estiver em rede restrita, tente acessar via uma VM (colocando seu endereço IP como DNS na VM).
- Teste com o IP do container (`docker inspect` para obter o IP).

### 🔴 **2. O DNS não está resolvendo os domínios**
✅ **Solução:**
- Mude o endereço IP para o da sua maquina nos db (`Provedor/dns/zones/db.fogo.asa.br | db.genipa.asa.br | db.miami.asa.br`).
- Verifique a configuração no Bind9 (`Provedor/dns/named.conf.local`).

### 🔴 **3. Certificados SSL gerando erro no navegador**
✅ **Solução:**
- Se for um ambiente local, o navegador pode não reconhecer os certificados autoassinados.
- No Chrome, acesse `chrome://flags/#allow-insecure-localhost` e ative a opção.

---
## 📝 Créditos
Projeto desenvolvido para fins educacionais e aprendizado em administração de sistemas e infraestrutura de redes.

🔗 **Autor:** [Boto](https://github.com/halipe23)
🔗 **Repositório:** [GitHub](https://github.com/seu-usuario/projeto-asa)

---
🚀 **Se este projeto te ajudou, deixe uma ⭐ no repositório!**