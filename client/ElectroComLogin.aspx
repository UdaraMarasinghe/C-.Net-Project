<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ElectroComLogin.aspx.cs" Inherits="GadgetHub.ElectroComLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gadget Hub</title>
    <link rel="icon" href="https://i.pinimg.com/736x/db/aa/de/dbaade14ea44878724fd5d89a39af4b8.jpg" type="image/x-icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            height: 100vh;
            background-color: #deddda;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            display: flex;
            width: 90vh;
            height: 55vh;
            background-color: white;
            border-radius: 2vh;
            box-shadow: 0 0.5vh 2vh rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .left-panel {
            width: 50%;
            background-color: #8971E2;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-top-left-radius: 2vh;
            border-bottom-left-radius: 2vh;
            border-top-right-radius: 16vh;
            border-bottom-right-radius: 16vh;
        }

        .left-panel h1 {
            font-family: "Poppins", sans-serif;
            font-weight: 600;
            text-align: center;
            font-size: 4vh;
        }

        .right-panel {
            width: 60%;
            padding: 5vh 4vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right-panel h2 {
            font-family: "Poppins", sans-serif;
            font-weight: 600;
            font-size: 4vh;
            text-align: center;
            margin-bottom: 4vh;
        }

        .input-box {
            margin-bottom: 2.5vh;
            position: relative;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 1.2vh;
            font-size: 1.5vh;
            background-color: #dedddd;
            border: none;
            border-radius: 0.5vh;
            outline: none;
        }

        .password-toggle {
            position: absolute;
            right: 1vh;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            user-select: none;
            font-size: 1.5vh;
            color: #555;
        }

        .login-btn {
            font-family: "Poppins", sans-serif;
            font-weight: 600;
            margin-top: 1vh;
            padding: 1vh;
            background-color: #8971E2;
            color: white;
            font-size: 2vh;
            border: none;
            border-radius: 0.5vh;
            cursor: pointer;
            transition: background-color 150ms;
        }

        .login-btn:hover {
            background-color: #5B45AC;
        }

        .error-message {
            color: red;
            font-size: 1.4vh;
            text-align: center;
            margin-top: 1vh;
        }
    </style>

    <script>
        function togglePassword() {
            var pwdInput = document.getElementById('<%= txtPassword.ClientID %>');
            var toggleBtn = document.getElementById('pwdToggleIcon');
            if (pwdInput.type === "password") {
                pwdInput.type = "text";
                toggleBtn.textContent = "🙈";
            } else {
                pwdInput.type = "password";
                toggleBtn.textContent = "👁️";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="left-panel">
                <h1>
                    Welcome to <br />
                    Electro Com
                </h1>
            </div>

            <div class="right-panel">
                <h2>Login</h2>

                <div class="input-box">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="input-text" placeholder="Username"></asp:TextBox>
                </div>

                <div class="input-box">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-text" placeholder="Password"></asp:TextBox>
                    <span id="pwdToggleIcon" class="password-toggle" onclick="togglePassword()" title="Show/Hide Password">👁️</span>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="btnLogin_Click" />

                <asp:Label ID="lblError" runat="server" CssClass="error-message" />
            </div>
        </div>
    </form>
</body>
</html>