<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>RoyalTrustBank — ATM Dashboard</title>
  <link rel="icon" type="image/png" href="courthouse.png">
  <style>
    *{box-sizing:border-box;margin:0;padding:0;font-family:Inter,system-ui,-apple-system,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;}
    body{
      height:100vh;
      background: url('bank-page.jpg') no-repeat center center/cover;
      display:flex;
      justify-content:center;
      align-items:center;
      color:#fff;
    }
    .overlay{position:fixed; inset:0; background:linear-gradient(180deg, rgba(6,20,46,0.7), rgba(3,10,25,0.9)); backdrop-filter:blur(0px);}
    .dashboard{
      position:relative;
      z-index:2;
      display:grid;
      grid-template-columns:240px 1fr;
      width:950px;
      height:550px;
      background:rgba(255,255,255,0.05);
      border-radius:20px;
      border:1px solid rgba(255,255,255,0.1);
      box-shadow:0 15px 40px rgba(0,0,0,0.6);
      overflow:hidden;
    }
    .menu{
      background:rgba(0,0,0,0.35);
      display:flex;
      flex-direction:column;
      padding:30px 20px;
      gap:25px;
      box-shadow: inset 0 0 30px rgba(255,255,255,0.05);
    }
    .menu h2{
      font-size:22px;
      margin-bottom:25px;
      text-align:center;
      letter-spacing:1px;
      color:#00d4ff;
    }
    .menu a{
      padding:14px 18px;
      border-radius:14px;
      background:linear-gradient(90deg,#2ce9ff,#1a8cff);
      color:#fff;
      text-decoration:none;
      font-weight:600;
      text-align:center;
      transition:0.25s;
      cursor:pointer;
      box-shadow:0 5px 15px rgba(0,0,0,0.2);
    }
    .menu a:hover{
      background:linear-gradient(90deg,#1a8cff,#00d4ff);
      transform:translateY(-2px);
      box-shadow:0 8px 25px rgba(0,0,0,0.3);
    }
    .menu a.exit{
      background:linear-gradient(90deg,#ff4d4d,#ff1a1a);
    }
    .menu a.exit:hover{
      background:linear-gradient(90deg,#ff1a1a,#e60000);
      transform:translateY(-2px);
      box-shadow:0 8px 25px rgba(255,0,0,0.4);
    }
    .content{
      padding:50px;
      display:flex;
      flex-direction:column;
      justify-content:center;
      align-items:center;
      background:rgba(0,0,0,0.25);
      border-left:1px solid rgba(255,255,255,0.1);
      border-radius:0 20px 20px 0;
    }
    .content h1{
      font-size:30px;
      margin-bottom:20px;
      color:#00d4ff;
      text-shadow:0 2px 6px rgba(0,0,0,0.5);
    }
    .content p{
      line-height:1.6;
      color:rgba(255,255,255,0.85);
      text-align:center;
      margin-bottom:30px;
    }
    .form-group{margin-bottom:18px; display:flex; flex-direction:column; width:100%;}
    .form-group label{margin-bottom:8px; color:#fff; font-weight:500;}
    .form-group input{padding:12px; border-radius:12px; border:1px solid rgba(255,255,255,0.1); background:rgba(255,255,255,0.05); color:#fff; font-size:16px; outline:none; transition:0.2s;}
    .form-group input:focus{background:rgba(255,255,255,0.1); border-color:#00d4ff;}
    .btn-submit{margin-top:15px; padding:14px; border:none; border-radius:14px; font-weight:600; background:linear-gradient(90deg,#3aa0ff,#2ce9b1); color:#fff; cursor:pointer; font-size:16px; width:100%; transition:0.25s;}
    .btn-submit:hover{background:linear-gradient(90deg,#1a8cff,#00d4ff); transform:translateY(-2px); box-shadow:0 6px 20px rgba(0,0,0,0.3);}
    @media (max-width:950px){
      .dashboard{grid-template-columns:1fr; height:auto;}
      .menu{flex-direction:row; justify-content:space-around; border-radius:20px 20px 0 0;}
      .content{border-left:none; border-radius:0 0 20px 20px; padding:30px;}
    }
  </style>
</head>
<body>
  <div class="overlay"></div>
  <div class="dashboard">
    <nav class="menu">
      <h2>ATM Options</h2>
      <a onclick="showForm('debit')">Debit Money</a>
      <a onclick="showForm('credit')">Credit Money</a>
      <a onclick="showForm('transfer')">Transfer Money</a>
      <a onclick="showForm('balance')">Check Balance</a>
      <a class="exit" onclick="window.location.replace('home.jsp')">Log Out</a>
    </nav>
    <div class="content" id="content">
      <h1>Welcome to RoyalTrust Bank ATM</h1>
      <p>Select an option from the left menu to perform banking operations. Forms will appear here once an option is selected.</p>
      <% String check = request.getParameter("success");
         String acNumber = request.getParameter("acNumber");
         String amt = request.getParameter("amt");
                    if(check!=null && check.equals("1"))
                    {
                   	 %><h2 style="color: green;">Transaction Successfull.</h2><%
                    }
                    else if(check!=null && acNumber!=null && check.equals("opened"))
                    {
                    	%><h2 style="color: green;">Account Opened Successfully, Your A/C no is : <%=acNumber%></h2><%
                    }
                    else if(check!=null && check.equals("0"))
                    {
                    	%><h2 style="color: red;">Invalid Pin. Try Again.</h2><%
                    }
                    else if(check!=null && check.equals("-1"))
                    {
                    	%><h2 style="color: red;">Insufficient Balance.</h2><%
                    }
                    else if(check!=null && check.equals("balance"))
                    {
                    	%><h2 style="color: white;">Balance : <%=amt%></h2><%
                    }
                    else if(check!=null && check.equals("err"))
                    {
                    	%><h2 style="color: red;">Invalid Pin or Account Number. Try Again.</h2><%
                    }
                 %>
    </div>
  </div>

  <script>
    function showForm(option){
      const content = document.getElementById('content');
      let html = '';

      switch(option){
        case 'debit':
          html = `<h1>Debit Money</h1>
                  <form action="DebitServlet" method="post">
                    <div class='form-group'><label>Amount</label><input type='number' placeholder='Enter amount' name="amount"></div>
                    <div class='form-group'><label>PIN</label><input type='password' placeholder='Enter PIN' name="pin"></div>
                    <button class='btn-submit'>Submit</button>
                  </form>`;
          break;
        case 'credit':
          html = `<h1>Credit Money</h1>
                  <form action="CreditServlet" method="post">
                    <div class='form-group'><label>Amount</label><input type='number' placeholder='Enter amount' name="amount"></div>
                    <div class='form-group'><label>PIN</label><input type='password' placeholder='Enter PIN' name="pin"></div>
                    <button class='btn-submit'>Submit</button>
                  </form>`;
          break;
        case 'transfer':
          html = `<h1>Transfer Money</h1>
                  <form action="TransferServlet" method="post">
                    <div class='form-group'><label>Receiver Account Number</label><input type='text' placeholder='Enter account number' name="acNo"></div>
                    <div class='form-group'><label>Amount</label><input type='number' placeholder='Enter amount' name="amount"></div>
                    <div class='form-group'><label>PIN</label><input type='password' placeholder='Enter PIN' name="pin"></div>
                    <button class='btn-submit'>Submit</button>
                  </form>`;
          break;
        case 'balance':
          html = `<h1>Check Balance</h1>
                  <form action="BalanceServlet" method="post">
                    <div class='form-group'><label>PIN</label><input type='password' placeholder='Enter PIN' name="pin"></div>
                    <button class='btn-submit'>Check Balance</button>
                  </form>`;
          break;
        default:
          html = `<h1>Welcome to SecureBank ATM</h1><p>Select an option from the left menu to perform banking operations.</p>`;
      }
      
      content.innerHTML = html;
    }
  </script>
</body>
</html>