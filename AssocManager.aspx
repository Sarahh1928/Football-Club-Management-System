<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssocManager.aspx.cs" Inherits="Milestone.AssocManager" %>

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

    .title {
        text-align: center;
        font-size: 20px;
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
                <h2 class="title">Add New Match</h2>
                
                <label>Host Club Name:</label>
                <asp:TextBox ID="host_name" CssClass="input" runat="server"></asp:TextBox>

                <label>Guest Club Name:</label>
                <asp:TextBox ID="guest_name" CssClass="input" runat="server"></asp:TextBox>

                <label>Start Time:</label>
                <asp:TextBox ID="start_time" CssClass="input" runat="server"></asp:TextBox>

                <label>End Time:</label>
                <asp:TextBox ID="end_time" CssClass="input" runat="server"></asp:TextBox>

                <asp:Button ID="addMatch" CssClass="btn" onClick="add_match" runat="server" Text="Add Match" />
            </div>

            <div class="card">
                <h2 class="title">Delete Match</h2>

                <label>Host Club Name:</label>
                <asp:TextBox ID="host_name2" CssClass="input" runat="server"></asp:TextBox>

                <label>Guest Club Name:</label>
                <asp:TextBox ID="guest_name2" CssClass="input" runat="server"></asp:TextBox>

                <asp:Button ID="deleteMatch" CssClass="btn btn-outline" onClick="delete_match" runat="server" Text="Delete Match" />
            </div>

            <div class="card">
                <asp:Button ID="upcomingMatches" CssClass="btn" onClick="upcoming_matches" runat="server" Text="View Upcoming Matches" />
                <asp:GridView ID="UpMatches" CssClass="grid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="Host_club" HeaderText="Host Club" />
                        <asp:BoundField DataField="Guest_club" HeaderText="Guest Club" />
                        <asp:BoundField DataField="Start_time" HeaderText="Start Time" />
                        <asp:BoundField DataField="End_time" HeaderText="End Time" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card">
                <asp:Button ID="played" CssClass="btn" onClick="already_played" runat="server" Text="View Already Played Matches" />
                <asp:GridView ID="alreadyPlayed" CssClass="grid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="Host_club" HeaderText="Host Club" />
                        <asp:BoundField DataField="Guest_club" HeaderText="Guest Club" />
                        <asp:BoundField DataField="Start_time" HeaderText="Start Time" />
                        <asp:BoundField DataField="End_time" HeaderText="End Time" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card">
                <asp:Button ID="never" CssClass="btn" onClick="never_matched" runat="server" Text="Clubs Never Matched" />
                <asp:GridView ID="neverMatched" CssClass="grid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="first_club" HeaderText="First Club" />
                        <asp:BoundField DataField="second_club" HeaderText="Second Club" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>

</html>
