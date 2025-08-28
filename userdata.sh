#!/bin/bash
set -euo pipefail

# Atualiza e instala Nginx
dnf update -y
dnf install -y nginx

# Habilita e inicia
systemctl enable nginx
systemctl start nginx

# Gera a página com logos inline (Base64)
cat > /usr/share/nginx/html/index.html <<'HTML'
<!doctype html>
<html lang="pt-br">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Infra Terraform + AWS</title>
  <style>
    :root {
      --bg1: #0b1220;
      --bg2: #0e1730;
      --muted: #9fb0cf;
      --white: #ffffff;
    }
    * { box-sizing: border-box; }
    html, body {
      height: 100%;
      margin: 0;
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
      background: radial-gradient(1200px 600px at 50% -10%, #1d2a50 0%, var(--bg2) 40%, var(--bg1) 100%);
      color: var(--white);
    }
    .wrap {
      min-height: 100%;
      display: grid;
      place-items: center;
      padding: 32px 16px;
    }
    .card {
      width: min(980px, 92vw);
      background: linear-gradient(180deg, rgba(255,255,255,0.05), rgba(255,255,255,0.02));
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 20px;
      padding: 32px;
      backdrop-filter: blur(4px);
      box-shadow:
        0 20px 50px rgba(0,0,0,0.45),
        inset 0 1px 0 rgba(255,255,255,0.06);
      text-align: center;
    }
    h1 {
      margin: 0 0 18px;
      font-size: clamp(24px, 3.5vw, 42px);
      line-height: 1.2;
      color: var(--white);
      text-shadow:
        0 2px 12px rgba(0,0,0,0.55),
        0 0 18px rgba(255,255,255,0.35);
    }
    p.sub {
      margin: 0 0 28px;
      color: var(--muted);
      font-size: clamp(14px, 1.6vw, 18px);
    }
    .logos {
      display: flex;
      gap: clamp(18px, 4vw, 40px);
      align-items: center;
      justify-content: center;
      flex-wrap: wrap;
      padding: 10px 0 4px;
    }
    .logo {
      width: clamp(64px, 10vw, 110px);
      height: clamp(64px, 10vw, 110px);
      display: grid;
      place-items: center;
      border-radius: 16px;
      background: rgba(255,255,255,0.04);
      border: 1px solid rgba(255,255,255,0.08);
      box-shadow:
        0 10px 30px rgba(0,0,0,0.35),
        inset 0 1px 0 rgba(255,255,255,0.05);
    }
    .logo img {
      max-width: 72%;
      max-height: 72%;
      filter: drop-shadow(0 6px 18px rgba(0,0,0,0.35));
    }
    .badge {
      margin-top: 12px;
      font-size: 12px;
      color: var(--muted);
      letter-spacing: .04em;
    }
    footer {
      margin-top: 26px;
      font-size: 12px;
      color: #7f92b8;
      opacity: 0.9;
    }
  </style>
</head>
<body>
  <div class="wrap">
    <div class="card">
      <h1>Server rodando utilizando essas tecnologias</h1>
      <p class="sub">Provisionado via <strong>Terraform</strong> em <strong>AWS</strong> (EC2 + S3)</p>

      <div class="logos">
        <!-- Terraform (placeholder estilizado em roxo) -->
        <div class="logo" title="Terraform">
          <img alt="Terraform"
               src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5NiIgaGVpZ2h0PSI5NiIgdmlld0JveD0iMCAwIDk2IDk2Ij48ZGVmcz48bGluZWFyR3JhZGllbnQgaWQ9ImciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPjxzdG9wIHN0b3AtY29sb3I9IiMzODU4OTkiIG9mZnNldD0iMCUiLz48c3RvcCBzdG9wLWNvbG9yPSIjNjI4NmZmIiBvZmZzZXQ9IjEwMCUiLz48L2xpbmVhckdyYWRpZW50PjwvZGVmcz48ZyBmaWxsPSJ1cmwoI2cpIj48cGF0aCBkPSJNMTIgMTV2MTkuNWwxNiA5LjVWMjQuNWwtMTYtOS41eiIvPjxwYXRoIGQ9Ik00MCAzMC41djE5LjVsMTYgOS41VjQwTDQwIDMwLjV6Ii8+PHBhdGggZD0iTTQwIDU2djE5LjVsMTYgOS41VjY1LjVMNDAgNTZ6Ii8+PHBhdGggZD0iTTcyIDE1djE5LjVsLTE2IDkuNVYyNC41bDE2LTkuNXoiLz48L2c+PC9zdmc+" />
          <div class="badge">Terraform</div>
        </div>

        <!-- EC2 (hexágono laranja com texto EC2) -->
        <div class="logo" title="Amazon EC2">
          <img alt="EC2"
               src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTYiIGhlaWdodD0iOTYiIHZpZXdCb3g9IjAgMCA5NiA5NiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMzIgMTFsMzIgMTRsMzIgLTE0djQ0bC0zMiAxNC0zMi0xNHoiIGZpbGw9IiNmOTljMDAiLz48dGV4dCB4PSI0OCUiIHk9IjU1JSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9IndoaXRlIiBmb250LXdlaWdodD0iNjAwIiBmb250LXNpemU9IjE0Ij5FQzI8L3RleHQ+PC9zdmc+" />
          <div class="badge">Amazon EC2</div>
        </div>

        <!-- S3 (círculo vermelho com texto S3) -->
        <div class="logo" title="Amazon S3">
          <img alt="S3"
               src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTYiIGhlaWdodD0iOTYiIHZpZXdCb3g9IjAgMCA5NiA5NiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48Y2lyY2xlIGN4PSI0OCIgY3k9IjQ4IiByPSI0MiIgZmlsbD0iI2ZmNDAwMCIvPjx0ZXh0IHg9IjQ4JSIgeT0iNTUlIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0id2hpdGUiIGZvbnQtd2VpZ2h0PSI2MDAiIGZvbnQtc2l6ZT0iMTQiPlMzPC90ZXh0Pjwvc3ZnPg==" />
          <div class="badge">Amazon S3</div>
        </div>
      </div>

      <footer>
        Página gerada automaticamente por <em>user_data</em> na inicialização da instância.
      </footer>
    </div>
  </div>
</body>
</html>
HTML
