<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stadium_manager.aspx.cs" Inherits="Milestone.stadium_manager" %>

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
        margin-right: 5px;
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
                <asp:Button ID="Stadium_info" CssClass="btn" runat="server" Text="View Stadium Information" OnClick="Stadium_info_Click" />
                <asp:GridView ID="stadium" CssClass="grid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="stadium_id" HeaderText="Stadium ID" />
                        <asp:BoundField DataField="status" HeaderText="Available?" />
                        <asp:BoundField DataField="stadium_name" HeaderText="Stadium Name" />
                        <asp:BoundField DataField="location" HeaderText="Location" />
                        <asp:BoundField DataField="capacity" HeaderText="Capacity" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="card">
                <asp:Button ID="requests_info" CssClass="btn" runat="server" Text="View All Requests" OnClick="listofrequests" />

                <asp:GridView ID="requests" CssClass="grid" runat="server" AutoGenerateColumns="false" OnRowCommand="requests_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="rep_name" HeaderText="Representative Name" />
                        <asp:BoundField DataField="host_club" HeaderText="Host Club" />
                        <asp:BoundField DataField="guest_club" HeaderText="Guest Club" />
                        <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                        <asp:BoundField DataField="end_time" HeaderText="End Time" />
                        <asp:BoundField DataField="status" HeaderText="Status" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Accept" CssClass="btn btn-outline" Text="Accept" runat="server" CommandArgument="<%# Container.DataItemIndex %>" Visible='<%# Convert.ToString(Eval("status")) == "unhandled" %>' CommandName="acceptRequest"/>
                                <asp:Button ID="Reject" CssClass="btn btn-outline" Text="Reject" runat="server" CommandArgument="<%# Container.DataItemIndex %>" Visible='<%# Convert.ToString(Eval("status")) == "unhandled" %>' CommandName="rejectRequest"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
