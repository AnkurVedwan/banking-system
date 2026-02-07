<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>RoyalTrustBank — Register</title>
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
    .card{position:relative;z-index:2;background:rgba(255,255,255,0.06);border-radius:16px;padding:32px;max-width:500px;width:94%;box-shadow:0 10px 30px rgba(2,6,23,0.6);border:1px solid rgba(255,255,255,0.08)}
    h1{font-size:28px;margin-bottom:16px;letter-spacing:-0.4px}
    p.lead{margin-bottom:24px;line-height:1.45;color:rgba(255,255,255,0.86)}
    .field{display:flex;flex-direction:column;margin-bottom:16px}
    .field label{font-size:13px;margin-bottom:6px;color:rgba(255,255,255,0.85)}
    .field input{padding:12px 14px;border-radius:10px;border:1px solid rgba(255,255,255,0.06);background:rgba(255,255,255,0.03);color:#fff;font-size:15px}
    .btn{display:inline-flex;align-items:center;justify-content:center;gap:10px;padding:14px 20px;border-radius:14px;border:none;cursor:pointer;font-weight:600;font-size:16px;transition:transform .15s ease, box-shadow .15s ease, background .2s ease;backdrop-filter:blur(6px);width:100%}
    .btn-register{background:linear-gradient(90deg,#3aa0ff,#2ce9b1);color:#fff;box-shadow:0 10px 30px rgba(54,172,255,0.3)}
    .btn-register:hover{background:linear-gradient(90deg,#1a8cff,#00d4ff)}
    .small{font-size:13px;color:rgba(255,255,255,0.7);margin-top:6px;text-align:center}
  </style>
</head>
<body>
  <div class="overlay"></div>
  <main class="card">
    <h1>Register Account</h1>
    <p class="lead">Create your RoyalTrust Bank account by filling in your details below.</p>
    <form action="RegisterServlet" method="post">
      <div class="field">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required />
      </div>
      <div class="field">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required />
      </div>
      <div class="field">
        <label for="password">Password</label>
        <input type="password" id="password" name="pass" required minlength="6" />
      </div>
      <button type="submit" class="btn btn-register">Register</button>
      
      <%String eror = request.getParameter("err");
         if(eror!=null && eror.equals("1"))
         {
        	 %><p style="color: red;">Registeration Failed. Try again.</p><%
         }
       %>
    </form>
  </main>
</body>
</html>
    