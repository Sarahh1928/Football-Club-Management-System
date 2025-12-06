<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Milestone.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fa;
        margin: 0;
        padding: 20px;
    }

    .container {
        display: flex;
        flex-direction: column;
        gap: 25px;
        max-width: 700px;
        margin: auto;
    }

    .card {
        background: white;
        padding: 20px 25px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .panel h3 {
        text-align: center;
        font-size: 17px;
        font-weight: bold;
        margin-bottom: 10px;
        text-decoration: underline;
    }

    label {
        font-weight: bold;
        margin-top: 5px;
    }

    .input {
        padding: 8px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 6px;
        width: 100%;
    }

    .btn {
        margin-top: 10px;
        padding: 10px;
        font-size: 15px;
        border: none;
        border-radius: 6px;
        background: #0078ff;
        color: white;
        cursor: pointer;
        width: 100%;
    }

    .btn:hover {
        background: #005fcc;
    }

    .error {
        color: red;
        font-weight: bold;
        margin-top: 5px;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="card">
                <h2 class="title">Register</h2>

                <label>Register As A:</label>
                <asp:DropDownList ID="DropDownList2" CssClass="input" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem>Select an Option:</asp:ListItem>
                    <asp:ListItem>Association Manager</asp:ListItem>
                    <asp:ListItem>Club Representative</asp:ListItem>
                    <asp:ListItem>Stadium Manager</asp:ListItem>
                    <asp:ListItem>Fan</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Association Manager Panel -->
            <asp:Panel ID="association" runat="server" CssClass="card panel">
                <h3>Association Manager Info</h3>

                <label>Name:</label>
                <asp:TextBox ID="assoc_name" CssClass="input" runat="server"></asp:TextBox>

                <label>Username:</label>
                <asp:TextBox ID="assoc_username" CssClass="input" runat="server"></asp:TextBox>

                <label>Password:</label>
                <asp:TextBox ID="assoc_password" CssClass="input" runat="server" TextMode="Password"></asp:TextBox>
            </asp:Panel>

            <!-- Club Representative Panel -->
            <asp:Panel ID="Club_Respresentative" runat="server" CssClass="card panel">
                <h3>Club Representative Info</h3>

                <label>Name:</label>
                <asp:TextBox ID="rep_name" CssClass="input" runat="server"></asp:TextBox>

                <label>Username:</label>
                <asp:TextBox ID="rep_username" CssClass="input" runat="server"></asp:TextBox>

                <label>Password:</label>
                <asp:TextBox ID="rep_password" CssClass="input" runat="server" TextMode="Password"></asp:TextBox>

                <label>Select A Club:</label>
                <asp:DropDownList ID="Clubs" CssClass="input" runat="server"></asp:DropDownList>
            </asp:Panel>

            <!-- Stadium Manager Panel -->
            <asp:Panel ID="stadiumManager" runat="server" CssClass="card panel">
                <h3>Stadium Manager Info</h3>

                <label>Name:</label>
                <asp:TextBox ID="manager_name" CssClass="input" runat="server"></asp:TextBox>

                <label>Username:</label>
                <asp:TextBox ID="manager_username" CssClass="input" runat="server"></asp:TextBox>

                <label>Password:</label>
                <asp:TextBox ID="manager_password" CssClass="input" runat="server" TextMode="Password"></asp:TextBox>

                <label>Select A Stadium:</label>
                <asp:DropDownList ID="stadium_list" CssClass="input" runat="server"></asp:DropDownList>
            </asp:Panel>

            <!-- Fan Panel -->
            <asp:Panel ID="fans" runat="server" CssClass="card panel">
                <h3>Fan Info</h3>

                <label>Name:</label>
                <asp:TextBox ID="fan_name" CssClass="input" runat="server"></asp:TextBox>

                <label>Username:</label>
                <asp:TextBox ID="fan_username" CssClass="input" runat="server"></asp:TextBox>

                <label>Password:</label>
                <asp:TextBox ID="fan_password" CssClass="input" runat="server" TextMode="Password"></asp:TextBox>

                <label>National ID:</label>
                <asp:TextBox ID="fan_national" CssClass="input" runat="server"></asp:TextBox>

                <label>Phone Number:</label>
                <asp:TextBox ID="fan_phone" CssClass="input" runat="server" TextMode="Phone"></asp:TextBox>

                <label>Birth Date:</label>
                <asp:TextBox ID="fan_birth" CssClass="input" runat="server" TextMode="DateTimeLocal"></asp:TextBox>

                <label>Address:</label>
                <asp:TextBox ID="fan_address" CssClass="input" runat="server"></asp:TextBox>
            </asp:Panel>

            <div class="card">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="error" runat="server" CssClass="error" Text=""></asp:Label>
                        <asp:Button ID="sign" CssClass="btn" runat="server" Text="Sign Up!" onClick="Register"/>    
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>
    </form>
</body>
</html>

