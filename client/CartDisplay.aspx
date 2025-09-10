<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="CartDisplay.aspx.cs" Inherits="GadgetHub.Client.CartDisplay" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Gadget Hub</title>
    <link rel="icon" href="https://i.pinimg.com/736x/db/aa/de/dbaade14ea44878724fd5d89a39af4b8.jpg" type="image/x-icon" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #dddbd7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 3vh 5vh;
            border-radius: 1vh;
            box-shadow: 0 0.6vh 1vh rgba(0, 0, 0, 0.2);
            width: 50vh;
        }

        h3 {
            margin: 0 0 1vh 0;
        }

        .header {
            font-weight: 500;
            font-size: 2vh;
            display: flex;
            justify-content: space-between;
            font-weight: bold;
            margin-bottom: 1vh;
        }

        .item-row {
            font-weight: 500;
            font-size: 1.5vh;
            display: flex;
            justify-content: space-between;
            padding: 1.5vh 0;
            border-bottom: 1vh solid #f0f0f0;
        }

        .note {
            font-weight: 500;
            font-size: 2vh;
            color: red;
            text-align: center;
            margin-top: 2vh;
        }

        .checkout-button {
            display: flex;
            justify-content: center;
            margin-top: 2vh;
        }

        .checkout-button .checkout-btn {
            font-weight: 900;
            font-size: 2vh;
            background-color: #4a403a;
            color: white;
            padding: 1.5vh 4vh;
            border: none;
            border-radius: 1vh;
            cursor: pointer;
            transition: background-color 150ms;
        }

        .checkout-button .checkout-btn:hover {
            background-color: #b13601;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <div>Item Name</div>
                <div>Quantity</div>
            </div>

            <asp:Repeater ID="CartRepeater" runat="server">
                <ItemTemplate>
                    <div class="item-row">
                        <div><%# Eval("ProductName") %></div>
                        <div><%# Eval("RequestedQuantity") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="note">
                Let Gadget Hub choose the best prices for you
            </div>

            <div class="checkout-button">
                <asp:Button ID="btnCheckout" runat="server" Text="Check out" CssClass="checkout-btn" OnClick="btnCheckout_Click" />
            </div>

        </div>
    </form>
</body>
</html>
