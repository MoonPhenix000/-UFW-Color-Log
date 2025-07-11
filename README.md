# -UFW-Color-Log
# 🧱 ufw-colorlog

> 🔥 Monitoramento em tempo real de logs do UFW com **cores** e **alertas sonoros** — direto no terminal Linux.

O `ufw-colorlog` é uma ferramenta simples e poderosa para quem deseja acompanhar o que acontece no firewall do sistema (UFW) com clareza, visibilidade e resposta rápida. Ideal para administradores de sistemas, entusiastas de segurança e curiosos que querem ficar de olho na rede!

---

## 🚀 Instalação

### 📥 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/ufw-colorlog.git
cd ufw-colorlog

🔐 2. Instale o alerta sonoro (opcional, mas recomendado)

sudo apt install beep
sudo modprobe pcspkr
sudo chmod u+s /usr/bin/beep

    💡 Se seu terminal não tiver speaker, você pode depois adaptar o script para usar paplay ou aplay.

⚙️ 3. Execute o instalador para adicionar o comando ufw-colorlog

chmod +x ufw_color_log.sh
./ufw_color_log.sh

Esse script adicionará a função ufw-colorlog ao final do seu ~/.bashrc.
🔄 4. Recarregue o terminal

source ~/.bashrc

📡 5. Rode o monitoramento com:

ufw-colorlog

🖍️ Exemplo de Saída

[! BLOQUEADO] Jul 11 17:32:21 kernel: [UFW BLOCK] IN=eth0 OUT=... SRC=185.12.34.56 DPT=22 ...
[✔ PERMITIDO] Jul 11 17:32:24 kernel: [UFW ALLOW] IN=eth0 OUT=... SRC=192.168.0.100 DPT=443 ...
[⚠ PORTA SENSÍVEL] Jul 11 17:32:26 kernel: [UFW ALLOW] DPT=445 ...
[INFO] Jul 11 17:32:30 kernel: [UFW AUDIT] ...

As cores ajudam a identificar imediatamente:

    🔴 Tentativas bloqueadas ou maliciosas

    🔵 Acessos permitidos

    🟣 Portas sensíveis acessadas

    🟡 Outros eventos do UFW

🧠 Como Funciona

O script adiciona a seguinte função ao ~/.bashrc:

ufw-colorlog() {
  sudo journalctl -k -f | awk '
  /UFW.*(BLOCK|DENIED|DROP|INVALID)/ {
    print "\033[1;31m[! BLOQUEADO] " $0 "\033[0m";
    system("beep -f 1000 -l 150");
    next;
  }
  /UFW.*ALLOW/ {
    print "\033[1;34m[✔ PERMITIDO] " $0 "\033[0m";
    next;
  }
  /UFW.*DPT=(23|445|3389|1433|21|22)/ {
    print "\033[1;35m[⚠ PORTA SENSÍVEL] " $0 "\033[0m";
    system("beep -f 800 -l 200");
    next;
  }
  /UFW/ {
    print "\033[1;33m[INFO] " $0 "\033[0m";
    next;
  }
  '
}

Essa função:

    Usa journalctl -k -f para acompanhar os logs do kernel

    Filtra linhas que contenham UFW

    Aplica cor ANSI e alerta sonoro para eventos críticos

🛠️ Personalização

Você pode editar a função ufw-colorlog no seu ~/.bashrc e ajustar:

    ⚙️ Palavras-chave para monitorar (ex: DPT=, SRC=, SYN)

    🎨 Códigos de cor ANSI (vermelho, azul, roxo, amarelo...)

    🔔 Sons diferentes por tipo de evento

    ❌ Ignorar eventos internos de confiança

❗ Segurança

⚠️ Este script é apenas um visualizador de logs. Ele não modifica regras de firewall.

💬 Contribuições

Contribuições são bem-vindas!
Sinta-se à vontade para abrir issues, enviar PRs ou sugerir melhorias no script ou na documentação.


✨ Autor

Desenvolvido por Luiza-Botelho
