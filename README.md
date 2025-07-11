# -UFW-Color-Log
Monitoramento Colorido e em Tempo Real para o UFW no Debian
Este script adiciona uma ferramenta prática chamada `ufw-colorlog` ao seu terminal Linux, permitindo monitorar em **tempo real** os eventos do firewall `UFW` com **destaque visual por cores** diretamente dos logs do kernel (`journalctl -k -f`).

---

## 🎯 Funcionalidades

✅ Log de eventos do UFW em tempo real  
✅ Destaque em **vermelho** para acessos suspeitos ou bloqueados (`BLOCK`, `DROP`, `DENIED`)  
✅ Destaque em **azul** para conexões permitidas (`ALLOW`)  
✅ Destaque em **amarelo** para mensagens gerais com "UFW"  
✅ Outros eventos em cinza (neutros)  
✅ Instalação simples com um único script  
✅ Não requer ferramentas externas (só `awk` e `journalctl`)

---

## 📦 Requisitos

- Distribuição baseada em Debian (ex: Debian 12, Ubuntu)
- `ufw` instalado e ativado
- Permissão de `sudo`
- Terminal compatível com **cores ANSI**

---

## 🚀 Instalação

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/ufw-colorlog.git
cd ufw-colorlog

    Torne o script executável:

chmod +x ufw_color_log.sh

    Execute o script:

./ufw_color_log.sh

    Após a execução, use o comando:

ufw-colorlog

🖍️ Exemplo de Saída

[! BLOQUEADO] Jul 11 17:32:21 kernel: [UFW BLOCK] IN=eth0 OUT=... SRC=185.12.34.56 DPT=22 ...
[OK PERMITIDO] Jul 11 17:32:24 kernel: [UFW ALLOW] IN=eth0 OUT=... SRC=192.168.0.100 DPT=443 ...
[INFO] Jul 11 17:32:30 kernel: [UFW AUDIT] ...

🧠 Como Funciona

O script adiciona uma função ufw-colorlog no seu ~/.bashrc, que executa:

sudo journalctl -k -f | awk '...'

Esse comando lê os logs do kernel (-k), filtra eventos relacionados ao UFW, e colore dinamicamente com base no conteúdo do log.
🛠️ Personalização

Você pode editar a função ufw-colorlog no seu .bashrc e ajustar:

    Palavras-chave de busca

    Códigos de cor ANSI (\033[1;31m = vermelho, etc.)

    Tipos de eventos a destacar

❗ Segurança

Este script não altera nenhuma regra de firewall — ele apenas monitora os logs gerados pelo UFW.
Ideal para administradores, pentesters e entusiastas que queiram visualizar a atividade da rede de forma clara e rápida.
📄 Licença

Este projeto está licenciado sob a MIT License.
💬 Contribuições

Contribuições são bem-vindas! Sinta-se livre para abrir issues, pull requests ou sugerir melhorias.
✨ Autor

Desenvolvido por Luiza-Botelho
