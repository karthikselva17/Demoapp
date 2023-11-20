<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <header>
        <h1>Welcome to our Website</h1>
        <nav>
            <a href="index.php">Home</a> |
            <a href="about.php">About Us</a> |
            <a href="contact.php">Contact Us</a>
        </nav>
    </header>
    <main>
        <h2>Contact Us</h2>
        <!-- Your contact us page content here -->
        <p>Contact us at test@test.com or fill out the form below.</p>
        <form action="process_contact.php" method="post">
            <!-- Your contact form fields here -->
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Message:</label><br>
            <textarea id="message" name="message" rows="4" required></textarea><br><br>
            
            <input type="submit" value="Submit">
        </form>
    </main>
    <footer>
        &copy; <?php echo date("Y"); ?> Demowebsite
    </footer>
</body>
</html>
