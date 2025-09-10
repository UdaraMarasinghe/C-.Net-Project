<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="ElectroComManager.aspx.cs" Inherits="GadgetHub.Client.ElectroComManager" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ElectroCom Manager</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #DDDCD8;
            padding: 30px;
        }
        .order-table {
            width: 90%;
            border-collapse: collapse;
            margin: auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .order-table th, .order-table td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
            vertical-align: middle;
        }
        .order-table th {
            background-color: #8971E2;
            color: white;
        }
        .title {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            color: white;
            background-color: #8971E2;
            padding: 15px 20px;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }
        .qty-input, .price-input, .estimatedTime {
            width: 80%;
            padding: 6px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .quote-button {
            padding: 8px 15px;
            font-size: 14px;
            font-weight: bold;
            background-color: #8971E2;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 150ms;
        }
        .quote-button:hover {
            background-color: #5B45AC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="title">ElectroCom Manager</div>
        <asp:Repeater ID="OrderRepeater" runat="server">
            <HeaderTemplate>
                <table class="order-table">
                    <tr>
                        <th>Product</th>
                        <th>Quantity Ordered</th>
                        <th>Order Date</th>
                        <th>Quantity able to Supply</th>
                        <th>Price per Unit (LKR)</th>
                        <th>Estimated Delivery Time</th>
                        <th>Action</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("ProductName") %></td>
                    <td><%# Eval("RequestedQuantity") %></td>
                    <td><%# Eval("OrderDate") %></td>
                    <td>
                        <input type="number" min="1" class="qty-input" name="supplyQty" placeholder="Quantity able to supply" />
                    </td>
                    <td>
                        <input type="number" min="1" class="price-input" name="unitPrice" placeholder="Price per Unit" />
                    </td>
                    <td>
                        <input type="text" class="estimatedTime" placeholder="Estimated Delivery Time" />
                    </td>
                    <td>
                        <button type="button" class="quote-button">Send Quotation</button>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </form>

    <script>
        document.querySelectorAll(".quote-button").forEach(button => {
            button.addEventListener("click", async function () {
                const row = this.closest("tr");

                const productName = row.children[0].innerText;
                const requestedQty = parseInt(row.children[1].innerText);
                const orderDate = row.children[2].innerText;
                const unitPriceInput = row.querySelector('input[name="unitPrice"]');
                const suppliedQtyInput = row.querySelector('input[name="supplyQty"]');
                const estimatedTimeInput = row.querySelector('.estimatedTime');

                const unitPrice = parseFloat(unitPriceInput.value);
                const suppliedQty = parseInt(suppliedQtyInput.value);
                const estimatedTime = estimatedTimeInput.value.trim();

                if (!unitPriceInput.value || !suppliedQtyInput.value || !estimatedTime) {
                    alert("Please fill in all fields before submitting the quotation.");
                    return;
                }

                if (suppliedQty > requestedQty) {
                    alert("Error: Supplied quantity cannot exceed the requested quantity.");
                    return;
                }

                const payload = {
                    ProductName: productName,
                    OrderDate: orderDate,
                    Tprice: null,
                    Eprice: unitPrice,
                    Gprice: null,
                    Tquantity: null,
                    Equantity: suppliedQty,
                    Gquantity: null,
                    TestimatedTime: null,
                    EestimatedTime: estimatedTime,
                    GestimatedTime: null
                };

                try {
                    const response = await fetch("https://localhost:44399/api/quotation", {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(payload)
                    });

                    const message = await response.text();

                    if (!response.ok) {
                        alert("Error: " + message);
                    } else {
                        alert("Quotation submitted successfully.");
                        row.remove();
                    }
                } catch (error) {
                    console.error(error);
                    alert("An error occurred while submitting the quotation.");
                }
            });
        });
    </script>

</body>
</html>
