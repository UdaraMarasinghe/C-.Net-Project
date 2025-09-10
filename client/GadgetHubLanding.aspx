<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="GadgetHubLanding.aspx.cs" Inherits="GadgetHub.Client.GadgetHubLanding" %>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <title>Gadget Hub</title>
        <link rel="icon" href="https://i.pinimg.com/736x/db/aa/de/dbaade14ea44878724fd5d89a39af4b8.jpg" type="image/x-icon" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Audiowide&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        html {
            scroll-behavior: smooth;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Poppins", sans-serif;
            background-color: #e0ded9;
            color: #3b332f;
        }

        header {
            max-height: 8vh;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #ffffff;
            padding: 2vh 4vh;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .logo {
            text-decoration: none;
            color: inherit;
            font-family: "Audiowide", sans-serif;
            font-weight: 400;
            display: flex;
            margin-left: 12vh;
            align-items: center;
            font-size: 2.6vh;
            font-weight: bold;
        }

        .logo-box {
            background: #3b332f;
            color: #fff;
            padding: 0.44vh 1vh;
            border-radius: 0.5vh;
            margin-left: 0.7vh;
        }

        nav a {
            font-weight: 500;
            font-size: 2vh;
            margin: 0 4vh;
            text-decoration: none;
            color: #3b332f;
        }

        .cart-btn {
            width: 20vh;
            height: 5vh;
            background: #3b332f;
            color: white;
            padding: 0.8vh 4vh;
            border: none;
            border-radius: 0.6vh;
            font-size: 2vh;
            cursor: pointer;

            transition: background-color 150ms;
        }

        .cart-btn:hover {
            background-color: #b13601;
        }

        main {
            display: flex;
            justify-content: space-between;
            padding: 12vh 16vh 0;
            gap: 4vh;
        }

        .left-content {
            flex: 1;
            margin-top: 6vh;
        }

        .left-content h1 {
            color: #504742;
            font-size: 9vh;
            line-height: 1.3;
            margin-bottom: 2.22vh;
            font-weight: 700;
        }

        .left-content p {
            font-size: 2vh;
            line-height: 1.6;
            margin-bottom: 3.33vh;
            max-width: 60vh;
        }

        .shop-btn {
            background: #3b332f;
            color: white;
            padding: 1.8vh 6vh;
            border: none;
            border-radius: 1vh;
            font-size: 2vh;
            cursor: pointer;

            transition: background-color 150ms;
        }

        .shop-btn:hover {
            background-color: #b13601;
        }

        .right-content {
            flex: 1;
        }

        .grid-images {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-template-rows: repeat(2, auto);
            gap: 2vh;
        }

        .image-box img {
            width: 100%;
            height: 100%;
            border-radius: 2vh;
            object-fit: cover;
            box-shadow: 0vh 0.4vh 0.9vh rgba(0,0,0,0.1);
        }

        .image-box.tall {
            grid-row: span 2;
        }

        .Background2 {
            background-color: white;
            padding-bottom: 4vh;
        }

        #products {
            margin-top: 20vh;
            padding-top: 10vh;
        }

        .title {
            font-family: "Poppins", sans-serif;
            font-weight: 600;
            font-size: 5vh;
            text-align: center;
            color: #3c2e2e;
        }

        .product-container {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 2vh;
            max-width: 100%;
            margin: 1vh 16vh;
        }

        .product-card {
            max-width: 36vh;
            max-height: 38vh;
            background-color: #DDDCD8;
            padding: 1.5vh;
            border-radius: 1vh;
            box-shadow: 0 0 0.5vh rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: start;
        }

        .img-placeholder {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
            width: 100%;
            height: 15vh;
            margin-bottom: 1vh;
            border-radius: 0.5vh;
            overflow: hidden;
        }

        .product-card img {
            display: block;
            max-width: 16vh;
            height: auto;
        }

        h3 {
            font-weight: 600;
            margin: 0 0 0.5vh;
            font-size: 2.5vh;
        }

        .description {
            text-align: left;
            width: 100%;
            font-size: 1.5vh;
            margin: 0 0 1.5vh 0;
            color: #444;
        }

        .stock {
            align-self: flex-start;
            font-size: 1.8vh;
            margin: 0 0 1vh 0;
            color: #333;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            gap: 1vh;
        }

        .cart-button {
            font-size: 1.8vh;
            background-color: #5c4c45;
            color: white;
            padding: 1vh 7vh;
            border: none;
            border-radius: 0.5vh;
            cursor: pointer;
            flex: 1;
            transition: background-color 150ms;
        }

        .cart-button:hover {
            background-color: #b13601;
        }

        .qty-input {
            width: 8vh;
            padding: 1vh;
            border-radius: 0.5vh;
            border: 1px solid #ccc;
            outline: none;
        }

        .Card-Buttom {
            display: flex;
            gap: 1vh;
        }

        .section-title {
            text-align: center;
            font-size: 4vh;
            font-weight: 700;
            color: #3b332f;
            margin: 6vh 0 3vh;
        }

        .reviews-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: white;
            padding: 0 2vh 6vh;
        }

        .reviews-container h2.section-title {
            margin-top: 6vh;
            margin-bottom: 3vh;
        }

        .review-card {
            border: 1px solid #ccc;
            padding: 2vh;
            width: 30vh;
            border-radius: 1vh;
            background-color: #fff;
            margin: 1vh;
        }

        .reviews-container .card-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 3vh;
        }


        .stars {
            color: #444;
            margin-bottom: 1vh;
            font-size: 2.2vh;
        }

        .review-title {
            font-weight: 600;
            font-size: 2vh;
            margin-bottom: 0.6vh;
        }

        .review-text {
            font-size: 1.6vh;
            color: #333;
            margin-bottom: 2vh;
        }

        .reviewer {
            display: flex;
            align-items: center;
            gap: 1.2vh;
        }

        .reviewer img {
            width: 5vh;
            height: 5vh;
            border-radius: 50%;
        }

        .reviewer-name {
            font-size: 1.6vh;
        }

        .about-section {
            background-color: #e3e1dd;
            text-align: center;
            padding: 6vh 2vh;
        }

        .about-title {
            font-size: 3.6vh;
            font-weight: 700;
            margin-bottom: 3vh;
        }

        .about-text {
            max-width: 100vh;
            margin: 0 auto 4vh;
            line-height: 1.8;
            font-weight: 600;
            font-size: 1.8vh;
        }

        .footer-info {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 6vh;
            font-weight: 700;
            font-size: 2vh;
        }

        .Section03 {
            display: flex;
            flex-direction: row;
            justify-content: center;
            flex-wrap: wrap;
        }

        .details {
            display: flex;
            justify-content: center;
            gap: 18vh;
        }

        .price {
            font-size: 2vh;
            font-weight: 500;
        }

    </style>
    </head>
    <body>

    <header>
        <a href="" class="logo">
        <span>Gadget</span><div class="logo-box">Hub</div>
        </a>
        <nav>
        <a href="">Home</a>
        <a href="#products">Shop</a>
        <a href="#ReviewSection">Reviews</a>
        <a href="#AboutUS">About Us</a>
        </nav>
        <div style="display: flex; gap: 1vh; margin-right: 12vh;">
            <button class="cart-btn" onclick="location.href='CartDisplay.aspx'">Your Cart</button>
            <button class="cart-btn" onclick="location.href='OrderHistory.aspx'">Order History</button>
        </div>
    </header>

    <main>
        <div class="left-content">
        <h1>Our Innovation<br/>Your Choice</h1>
        <p>Discover innovation, upgrade your lifestyle, and stay ahead with Gadget Hub. We bring you top-quality products at unbeatable prices.</p>
        <a href="#products"><button class="shop-btn">Shop Now</button></a>
        </div>
        <div class="right-content">
        <div class="grid-images">
            <div class="image-box">
            <img src="https://cdn.pixabay.com/photo/2022/06/21/21/15/audio-7276511_640.jpg" alt="Headphones">
            </div>
            <div class="image-box tall">
            <img src="https://cdn.pixabay.com/photo/2018/01/01/18/58/woman-3054744_640.jpg" alt="Woman with Phone">
            </div>
            <div class="image-box">
            <img src="https://cdn.pixabay.com/photo/2015/05/07/13/43/watch-756487_640.jpg" alt="Smart Watch">
            </div>
        </div>
        </div>
    </main>

    <form id="form1" runat="server">
        <div class="Background2">
            <h1 id="products" class="title">Best Electronics For You</h1>
            <div class="product-container">

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/736x/86/dc/18/86dc1889b37fcd7649ad5b8b1e71bf2e.jpg" alt="SanDisk USB" />
                    </div>

                    <h3><asp:Literal ID="litProduct1" runat="server" /></h3>

                    <p class="description">Fast, reliable USB storage for your important files.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="1" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty1" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/1200x/d3/aa/70/d3aa70fb518142fe40ff77a6d84cf50b.jpg" alt="Casio Calculator" />
                    </div>

                    <h3><asp:Literal ID="litProduct2" runat="server" /></h3>

                    <p class="description">Essential for quick and accurate calculations.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="2" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty2" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/736x/32/53/b6/3253b657b173887057d956a73846b71e.jpg" alt="LG Monitor" />
                    </div>

                    <h3><asp:Literal ID="litProduct3" runat="server" /></h3>

                    <p class="description">Full HD display for vibrant visuals and productivity.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="3" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty3" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/1200x/e1/92/cd/e192cd0001c24cae0e731824970cd0e5.jpg" alt="WebCam" />
                    </div>

                    <h3><asp:Literal ID="litProduct4" runat="server" /></h3>

                    <p class="description">HD webcam for video calls and streaming clarity.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="4" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty4" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/736x/af/f6/80/aff6800be752f3fa0c3132e1b9d122ca.jpg" alt="Security Camera" />
                    </div>

                    <h3><asp:Literal ID="litProduct5" runat="server" /></h3>

                    <p class="description">Keep your property safe with high-definition surveillance.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="5" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty5" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/736x/91/c3/82/91c382be2031c07666296ed9e5db4eeb.jpg" alt="HP Printer" />
                    </div>

                    <h3><asp:Literal ID="litProduct6" runat="server" /></h3>

                    <p class="description">Reliable printing solution for home and office.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="6" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty6" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/1200x/5f/bf/8a/5fbf8a53a80bc1a5376eac7638266078.jpg" alt="Bar Code Reader" />
                    </div>

                    <h3><asp:Literal ID="litProduct7" runat="server" /></h3>

                    <p class="description">Quick and accurate scanning for retail and logistics.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="7" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty7" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/1200x/2e/95/14/2e95148a5dbbe58f0b0c25414f407a8f.jpg" alt="Scanner" />
                    </div>

                    <h3><asp:Literal ID="litProduct8" runat="server" /></h3>

                    <p class="description">High-resolution scanning for documents and images.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="8" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty8" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/1200x/2c/c8/6e/2cc86e7c92b421c513c942d8823fac4f.jpg" alt="Office Keyboard" />
                    </div>

                    <h3><asp:Literal ID="litProduct9" runat="server" /></h3>

                    <p class="description">Comfortable and durable keyboard for everyday typing.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="9" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty9" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>

                </div>

                <div class="product-card">

                    <div class="img-placeholder">
                        <img src="https://i.pinimg.com/736x/7a/cb/d3/7acbd31185e4ea1ef9f50d3cf9fb0195.jpg" alt="Office Mouse" />
                    </div>

                    <h3><asp:Literal ID="litProduct10" runat="server" /></h3>

                    <p class="description">Precise and comfortable mouse for daily tasks.</p>

                    <div class="Card-Buttom">
                        <asp:Button runat="server" Text="Add to Cart" CssClass="cart-button" CommandArgument="10" OnClick="AddToCart_Click" />
                        <asp:TextBox ID="txtQty10" runat="server" CssClass="qty-input" TextMode="Number" min="1" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="reviews-container">

        <h2 id="ReviewSection" class="section-title">What Our Customers Say</h2>

        <div class="card-wrapper">
        <div class="review-card">
            <div class="stars">★★★★★</div>
            <div class="review-title">Highly Recommended</div>
                <div class="review-text">This is an example customer review.</div>
                <div class="reviewer">
                <img src="https://cdn-icons-png.flaticon.com/512/147/147144.png" alt="Avatar" />
                <div class="reviewer-name">C . Jayalath</div>
                </div>
            </div>
            <div class="review-card">
                <div class="stars">★★★★★</div>
                <div class="review-title">Highly Recommended</div>
                <div class="review-text">This is an example customer review.</div>
                <div class="reviewer">
                <img src="https://cdn-icons-png.flaticon.com/512/147/147144.png" alt="Avatar" />
                <div class="reviewer-name">R . Chamal</div>
                </div>
            </div>
            <div class="review-card">
                <div class="stars">★★★★★</div>
                <div class="review-title">Highly Recommended</div>
                <div class="review-text">This is an example customer review.</div>
                <div class="reviewer">
                <img src="https://cdn-icons-png.flaticon.com/512/147/147144.png" alt="Avatar" />
                <div class="reviewer-name">L . Kumara</div>
            </div>
            </div>
        </div>
        </div>

    <div class="about-section">
        <div id="AboutUS" class="about-title">About Us</div>
        <div class="about-text">
        From smart accessories to essential office gear, we handpick quality gadgets that combine innovation, reliability, and affordability. Our goal is simple: to offer a seamless shopping experience with fast delivery, responsive customer support, and products that deliver real value. Whether you're a student, a professional, or a tech enthusiast, Gadget Hub is your one-stop destination for trusted electronics and accessories in <br> Sri Lanka.
        </div>
        <div class="footer-info">
        <div><strong>www.Gadgethub.lk</strong></div>
        <div>+94 77 777 7777</div>
        <div><strong>GadgethubSupplies</strong></div>
        <div>gadgethub@gmail.com</div>
        </div>
    </div>

    </body>
    </html>
