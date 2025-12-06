<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="Milestone.SystemAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f8fc;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 30px;
        }

        .container {
            width: 90%;
            max-width: 700px;
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .card {
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .card h2 {
            color: #0078d7;
            margin-bottom: 15px;
            font-size: 1.3em;
        }

        label {
            display: block;
            margin-top: 10px;
            color: #333;
            font-weight: 500;
        }

        input[type=text],
        input[type=number],
        .aspNetDisabled {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        asp\:TextBox {
            width: 100%;
        }

        .btn {
            background-color: #0078d7;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 10px 20px;
            margin-top: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #005fa3;
        }

        .delete-btn {
            background-color: #d9534f;
        }

        .delete-btn:hover {
            background-color: #b52b27;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>System Administration Panel</h1>
        <div class="container">

            <!-- Add Club -->
            <div class="card">
                <h2>Add Club</h2>

                <label>Club Name</label>
                <asp:TextBox ID="club_name" runat="server"></asp:TextBox>

                <label>Location</label>
                <asp:TextBox ID="club_loc" runat="server"></asp:TextBox>

                <asp:Button ID="addClub" CssClass="btn" OnClick="add_club" runat="server" Text="Add Club" />
            </div>

            <!-- Delete Club -->
            <div class="card">
                <h2>Delete Club</h2>

                <label>Club Name</label>
                <asp:TextBox ID="club_name2" runat="server"></asp:TextBox>

                <asp:Button ID="deleteClub" CssClass="btn delete-btn" OnClick="delete_club" runat="server" Text="Delete Club" />
            </div>

            <!-- Add Stadium -->
            <div class="card">
                <h2>Add Stadium</h2>

                <label>Stadium Name</label>
                <asp:TextBox ID="stadium_name" runat="server"></asp:TextBox>

                <label>Location</label>
                <asp:TextBox ID="stadium_location" runat="server"></asp:TextBox>

                <label>Capacity</label>
                <asp:TextBox ID="stadium_capacity" runat="server"></asp:TextBox>

                <asp:Button ID="addStadium" CssClass="btn" OnClick="add_stadium" runat="server" Text="Add Stadium" />
            </div>

            <!-- Delete Stadium -->
            <div class="card">
                <h2>Delete Stadium</h2>

                <label>Stadium Name</label>
                <asp:TextBox ID="stadium_name2" runat="server"></asp:TextBox>

                <asp:Button ID="deleteStadium" CssClass="btn delete-btn" OnClick="delete_stadium" runat="server" Text="Delete Stadium" />
            </div>

            <!-- Block Fan -->
            <div class="card">
                <h2>Block a Fan</h2>

                <label>National ID Number</label>
                <asp:TextBox ID="national_id" runat="server"></asp:TextBox>

                <asp:Button ID="blockFan" CssClass="btn delete-btn" OnClick="block_fan" runat="server" Text="Block Fan" />
            </div>

        </div>
    </form>
</body>

</html>
