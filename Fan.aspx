<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan.aspx.cs" Inherits="Milestone.Fan" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            View Available Matches to attend starting from:<br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
        <asp:Button ID="matchesList" runat="server" Text="View All Avaialabe Matches" OnClick="listofmatches" />
        <br />
        <br />
        <asp:GridView ID="matches" runat="server" AutoGenerateColumns="false" OnRowCommand="matchesRows" >
               
                <Columns>
                    <asp:BoundField DataField="host_club" HeaderText="Host Club"/>
                    <asp:BoundField DataField="guest_club" HeaderText="Guest Club" />
                    <asp:BoundField DataField="stadium_name" HeaderText="stadium_name" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />

        <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="purchase" Text="Purchase A Ticket" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="purchaseTicket"/>
                    
                </ItemTemplate>
            </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
