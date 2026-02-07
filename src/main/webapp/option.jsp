<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>RoyalTrustBank — Dashboard</title>
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
    .card{position:relative;z-index:2;background:rgba(255,255,255,0.06);border-radius:16px;padding:32px;max-width:500px;width:94%;box-shadow:0 10px 30px rgba(2,6,23,0.6);border:1px solid rgba(255,255,255,0.08);text-align:center}
    h1{font-size:28px;margin-bottom:16px;letter-spacing:-0.4px}
    p.lead{margin-bottom:24px;line-height:1.45;color:rgba(255,255,255,0.86)}
    .btn{display:inline-flex;align-items:center;justify-content:center;gap:10px;padding:14px 20px;border-radius:14px;border:none;cursor:pointer;font-weight:600;font-size:16px;transition:transform .15s ease, box-shadow .15s ease, background .2s ease;backdrop-filter:blur(6px);width:100%;margin-bottom:16px}
    .btn-open{background:linear-gradient(90deg,#3aa0ff,#2ce9b1);color:#fff;box-shadow:0 10px 30px rgba(54,172,255,0.3)}
    .btn-exit{background:linear-gradient(90deg,#ff4d4d,#ff1a1a);color:#fff;box-shadow:0 10px 30px rgba(255,77,77,0.3)}
    .btn-open:hover{background:linear-gradient(90deg,#1a8cff,#00d4ff)}
    .btn-exit:hover{background:linear-gradient(90deg,#ff1a1a,#e60000)}
    .small{font-size:13px;color:rgba(255,255,255,0.7);margin-top:6px;text-align:center}
    .form-group{margin-bottom:16px;text-align:left}
    .form-group label{display:block;margin-bottom:6px;color:rgba(255,255,255,0.85)}
    .form-group input{width:100%;padding:10px;border-radius:10px;border:1px solid rgba(255,255,255,0.1);background:rgba(255,255,255,0.03);color:#fff}
    .btn-submit{width:100%;padding:12px;border:none;border-radius:12px;background:linear-gradient(90deg,#2ce9ff,#1a8cff);color:#fff;font-weight:600;cursor:pointer;transition:0.2s;margin-top:10px}
    .btn-submit:hover{background:linear-gradient(90deg,#1a8cff,#00d4ff)}
  </style>
</head>
<body>
  <div class="overlay"></div>
  <main class="card" id="mainCard">
    <h1>Welcome to RoyalTrust Bank</h1>
    <p class="lead">Choose an option below to proceed.</p>
    <div id="options">
      <button type="button" class="btn btn-open" onclick="showAccountForm()">Open New Bank Account</button>
      <button type="button" class="btn btn-exit" onclick="window.location.replace('home.jsp')">Exit</button>
    </div>
  </main>

  <script>
    function showAccountForm() {
      const card = document.getElementById('mainCard');
      card.innerHTML = `
        <h1>Create New Account</h1>
        <form action="OpenAcServlet" method="post">
          <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" required placeholder="Enter your full name">
          </div>
          <div class="form-group">
            <label for="amount">Initial Deposit</label>
            <input type="number" id="amount" name="amount" required placeholder="Enter initial amount">
          </div>
          <div class="form-group">
            <label for="pin">Security PIN</label>
            <input type="password" id="pin" name="pin" required placeholder="Enter 4-digit PIN">
          </div>
          <button type="submit" class="btn-submit">Submit</button>
        </form>
      `;
    }
  </script>
</body>
</html>
    