<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fans.aspx.cs" Inherits="Milestone.fans" %>



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
        margin-bottom: 10px;
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
                <h2 class="title">Available Matches</h2>

                <label>View Available Matches to Attend Starting From:</label>
                <asp:TextBox ID="startDate" CssClass="input" runat="server"></asp:TextBox>

                <asp:Button ID="matchesList" CssClass="btn" runat="server" Text="View All Available Matches" OnClick="listofmatches" />
            </div>

            <div class="card">
                <asp:GridView ID="matches" CssClass="grid" runat="server" AutoGenerateColumns="false" OnRowCommand="matchesRows">
                    <Columns>
                        <asp:BoundField DataField="Host" HeaderText="Host Club"/>
                        <asp:BoundField DataField="Guest" HeaderText="Guest Club" />
                        <asp:BoundField DataField="stadium_name" HeaderText="Stadium Name" />
                        <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="purchase" CssClass="btn btn-outline" Text="Purchase A Ticket" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="purchaseTicket"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
