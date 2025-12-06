<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clubRep.aspx.cs" Inherits="Milestone.clubRep" %>

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
        gap: 30px;
        max-width: 900px;
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

    .title, h3 {
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
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

    .btn-outline {
        background: white;
        color: #0078ff;
        border: 2px solid #0078ff;
    }

    .btn-outline:hover {
        background: #eef6ff;
    }

    .grid {
        margin-top: 10px;
        border: 1px solid #ddd;
        border-radius: 6px;
        width: 100%;
    }

    .grid th {
        background: #f0f0f0;
        padding: 8px;
        text-align: left;
    }

    .grid td {
        padding: 8px;
        border-top: 1px solid #ddd;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="card">
                <asp:Button ID="info" CssClass="btn" onClick="clubInfo" runat="server" Text="View Club Info" />
                <asp:GridView ID="club" CssClass="grid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="club_id" HeaderText="Club ID" />
                        <asp:BoundField DataField="club_name" HeaderText="Club Name" />
                        <asp:BoundField DataField="location" HeaderText="Location" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card">
                <asp:Button ID="upMatches" CssClass="btn" onClick="viewMatches" runat="server" Text="View Upcoming Matches of the Club" />
                <asp:GridView ID="upcoming" CssClass="grid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="Host_club" HeaderText="Host Club" />
                        <asp:BoundField DataField="Guest_club" HeaderText="Guest Club" />
                        <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                        <asp:BoundField DataField="stadium_name" HeaderText="Stadium" />
                    </Columns>
                </asp:GridView>

                <label>Start Time:</label>
                <asp:TextBox ID="sdate" CssClass="input" runat="server"></asp:TextBox>

                <asp:Button ID="availableStad" CssClass="btn" onClick="available_stadium" runat="server" Text="View Available Stadiums" />
                <asp:GridView ID="stadiums" CssClass="grid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="Stadium_name" HeaderText="Stadium Name" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />
                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card">
                <h3>Host Requests</h3>

                <label>Stadium Name:</label>
                <asp:TextBox ID="sname" CssClass="input" runat="server"></asp:TextBox>

                <label>Start Time:</label>
                <asp:TextBox ID="stade2" CssClass="input" runat="server"></asp:TextBox>

                <asp:Button ID="hostrequest" CssClass="btn" onClick="request" runat="server" Text="Submit Request" />
            </div>

        </div>
    </form>
</body>
</html>
