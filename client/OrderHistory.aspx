<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="GadgetHub.Client.OrderHistory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order History</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #DDDCD8;
            color: #333;
        }

        form#form1 {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 12px rgba(137, 113, 226, 0.3);
            border-radius: 8px;
        }

        h3 {
            background-color: #b13601;
            color: white;
            padding: 12px 20px;
            margin-top: 0;
            border-radius: 6px;
            font-weight: 600;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            margin-top: 12px;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(137, 113, 226, 0.15);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #DDDCD8;
        }

        th {
            background-color: #504742;
            color: white;
            font-weight: 600;
        }

        tr:last-child td {
            border-bottom: none;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="rptOrderHistory" runat="server">
            <ItemTemplate>
                <h3>
                    Order: <%# Eval("FormattedOrderID") %> 
                    | Date: <%# Eval("OrderDate") %> 
                    | Status: <%# Eval("CurrentStatus") %>
                </h3>
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>Supplier Name</th>
                        <th>Supplied Quantity</th>
                        <th>Unit Price</th>
                        <th>Estimated Time</th>
                    </tr>
                    <asp:Repeater ID="rptDetails" runat="server" DataSource='<%# Eval("Confirmations") %>'>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("SupplierName") %></td>
                                <td><%# Eval("SuppliedQuantity") %></td>
                                <td><%# Eval("UnitPrice") %></td>
                                <td><%# Eval("EstimatedTime") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
