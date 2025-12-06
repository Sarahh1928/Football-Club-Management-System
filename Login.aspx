<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Milestone3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body {
        background: #f5f7fa;
        font-family: Arial, sans-serif;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .card {
        background: white;
        padding: 30px;
        width: 350px;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .title {
        text-align: center;
        margin-bottom: 10px;
    }

    label {
        font-weight: bold;
        margin-top: 10px;
    }

    .input {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        width: 100%;
        font-size: 14px;
    }

    .btn, .btn-outline {
        padding: 10px;
        border-radius: 6px;
        border: none;
        width: 100%;
        margin-top: 10px;
        cursor: pointer;
        font-size: 16px;
    }

    .btn {
        background: #0078ff;
        color: white;
    }

    .btn:hover {
        background: #005fcc;
    }

    .btn-outline {
        background: white;
        color: #0078ff;
        border: 2px solid #0078ff;
    }

    .btn-outline:hover {
        background: #eef6ff;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <h2 class="title">Welcome Back</h2>

                <label>Username</label>
                <asp:TextBox ID="username" CssClass="input" runat="server"></asp:TextBox>

                <label>Password</label>
                <asp:TextBox ID="password" TextMode="Password" CssClass="input" runat="server"></asp:TextBox>

                <asp:Button ID="signin" CssClass="btn" runat="server" OnClick="signin_click" Text="Login" />
                <asp:Button ID="signup" CssClass="btn-outline" runat="server" OnClick="signup_click" Text="Register" />
            </div>
        </div>
    </form>
</body>

</html>
