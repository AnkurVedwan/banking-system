<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>RoyalTrustBank — Home</title>
  <link rel="icon" type="image/png" href="courthouse.png">
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    html,body{height:100%;font-family:Inter, system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial;color:#fff}
    body{
      background-image: url('bank-page.jpg');
      background-size:cover;
      background-position:center;
      display:flex;
      align-items:center;
      justify-content:center;
    }
    .overlay{position:fixed;inset:0;background:linear-gradient(180deg, rgba(6,20,46,0.55), rgba(3,10,25,0.7));backdrop-filter:blur(0px)}
    .card{position:relative;z-index:2;background:rgba(255,255,255,0.06);border-radius:16px;padding:32px;max-width:920px;width:94%;display:grid;grid-template-columns:1fr 420px;gap:28px;box-shadow:0 10px 30px rgba(2,6,23,0.6);border:1px solid rgba(255,255,255,0.08);align-items:center}
    .brand{padding:12px 6px}
    .logo{display:flex;align-items:center;gap:12px}
    .logo .mark{width:64px;height:64px;border-radius:12px;background:linear-gradient(135deg,#2ce9b1,#3aa0ff);display:flex;align-items:center;justify-content:center;font-weight:700;color:#04213a;font-size:24px;box-shadow:0 6px 18px rgba(40,200,160,0.12)}
    h1{font-size:28px;margin-top:16px;letter-spacing:-0.4px}
    p.lead{margin-top:12px;line-height:1.45;color:rgba(255,255,255,0.86)}
    .actions{display:flex;flex-direction:column;gap:35px;align-items:stretch}
    .btn{display:inline-flex;align-items:center;justify-content:center;gap:10px;padding:14px 20px;border-radius:14px;border:none;cursor:pointer;font-weight:600;font-size:16px;transition:transform .15s ease, box-shadow .15s ease, background .2s ease;backdrop-filter:blur(6px)}
    .btn:active{transform:translateY(1px)}
    .btn-register{background:linear-gradient(90deg,#3aa0ff,#2ce9b1);color:#fff;box-shadow:0 10px 30px rgba(54,172,255,0.3);height: 60px;}
    .btn-login{background:linear-gradient(90deg,#2ce9ff,#1a8cff);color:#fff;box-shadow:0 10px 30px rgba(54,172,255,0.3);height: 60px;}
    .btn-register:hover,.btn-login:hover{background:linear-gradient(90deg,#1a8cff,#00d4ff)}
    .small{font-size:13px;color:rgba(255,255,255,0.7);margin-top:6px}
    @media (max-width:880px){.card{grid-template-columns:1fr; padding:20px}.logo .mark{width:56px;height:56px}.brand{order:2}.actions{order:1}}
  </style>
</head>
<body>
  <div class="overlay"></div>
  <main class="card" role="main">
    <section class="brand" aria-labelledby="bank-title">
      <div class="logo">
        <div class="mark">RB</div>
        <div>
          <div style="font-size:13px;opacity:.9">Trusted • Fast • Secure</div>
          <h1 id="bank-title">RoyalTrust Bank</h1>
        </div>
      </div>
      <p class="lead">Welcome to SecureBank — banking made simple. Use the buttons below to proceed. Our platform secures your transactions with bank‑grade encryption and 24/7 support.</p>
    </section>

    <aside class="actions" aria-label="Authentication actions">
      <button class="btn btn-register" onclick="window.location.href='register.jsp'">Register</button>
      <button class="btn btn-login" onclick="window.location.href='login.jsp'">Login</button>
      <!--<button class="btn btn-exit" onclick="window.open('https://www.microsoft.com/edge')">Exit</button>-->
    </aside>
  </main>


</body>
</html>