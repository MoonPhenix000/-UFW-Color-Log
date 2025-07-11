#!/bin/bash

# Ativa o log completo do UFW
echo "[+] Ativando log completo do UFW..."
sudo ufw logging full

# Instala utilitário de cores (ccze) se não estiver instalado
echo "[+] Instalando ccze (colorizador de logs)..."
sudo apt update
sudo apt install -y ccze

# Cria um alias/atalho no ~/.bashrc
echo "[+] Adicionando comando 'ufw-colorlog' ao ~/.bashrc..."

cat << 'EOF' >> ~/.bashrc

# === UFW Color Log Avançado ===
ufw-colorlog() {
  sudo sudo journalctl -k -f | awk '
  /BLOCK|DENIED|INVALID|DROP/ {
    print "\033[1;31m" $0 "\033[0m"; next  # Vermelho para eventos bloqueados/suspeitos
  }
  /DPT=23|DPT=445|DPT=3389|DPT=1433|DPT=21|DPT=22/ {
    print "\033[1;31m[!] Porta sensível: " $0 "\033[0m"; next  # Vermelho para portas comuns a ataques
  }
  /ALLOW/ {
    print "\033[1;34m" $0 "\033[0m"; next  # Azul para conexões permitidas
  }
  /SRC=([0-9]{1,3}\.){3}[0-9]{1,3}/ {
    print "\033[1;33m[~] Conexão ativa: " $0 "\033[0m"; next  # Amarelo para conexões com IP
  }
  {
    print "\033[0;37m" $0 "\033[0m";  # Cinza para logs neutros
  }'
}
EOF

echo "[+] Recarregando ~/.bashrc..."
source ~/.bashrc

echo "[✔] Pronto! Agora você pode usar o comando: ufw-colorlog"
